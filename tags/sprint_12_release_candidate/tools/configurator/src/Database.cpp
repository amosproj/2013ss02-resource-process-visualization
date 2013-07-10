#include "Database.hpp"
#include "Factory.hpp"
#include "Hall.hpp"
#include "HallDAO.hpp"
#include "Log.hpp"
#include "LineDAO.hpp"
#include "LocationDAO.hpp"
#include "DeviceDAO.hpp"
#include "ComponentDAO.hpp"

#include <iostream>
#include <QQmlContext>
#include <QJsonDocument>
#include <QFile>
#include <QIODevice>

Database::Database(QQmlEngine& engine)
	: engine(engine), connected(false), 
	db(QSqlDatabase::addDatabase("QPSQL")){
}

Database::~Database(){
	QSqlDatabase::removeDatabase("QPSQL");
}

bool Database::init(QString host, QString dbName, QString user, QString pass){
	if(connected){
		db.close();
		connected = false;
	}

	db.setConnectOptions("connect_timeout=5");

	db.setHostName(host);
	db.setDatabaseName(dbName);
	db.setUserName(user);
	db.setPassword(pass);
	if(!db.open()){
		QString err = "Connection failed: ";
		err.append(db.lastError().text());
		Log::warning(err);
		return false;
	}
	connected = true;

	QObject::connect(&FactoryDAO::getInstance(), &DAO::countChanged, &HallDAO::getInstance(), &DAO::update);
	QObject::connect(&HallDAO::getInstance(), &DAO::countChanged, &LineDAO::getInstance(), &DAO::update);
	QObject::connect(&LineDAO::getInstance(), &DAO::countChanged, &LocationDAO::getInstance(), &DAO::update);

	engine.rootContext()->setContextProperty("idSeq", &(IdSeq::getInstance()));
	engine.rootContext()->setContextProperty("factories", &FactoryDAO::getInstance());
	engine.rootContext()->setContextProperty("halls", &HallDAO::getInstance());
	engine.rootContext()->setContextProperty("lines", &LineDAO::getInstance());
	engine.rootContext()->setContextProperty("locations", &LocationDAO::getInstance());
    engine.rootContext()->setContextProperty("devices", &DeviceDAO::getInstance());
    engine.rootContext()->setContextProperty("components", &ComponentDAO::getInstance());

	Log::info("Connection established.");
	return true;
}

bool Database::loadTestData(){
	QString config;
	QFile file(":/config.json");
	if(!file.exists()){
		Log::warning("Test data file does not exist");
		return false;
	}
	file.open(QIODevice::ReadOnly | QIODevice::Text);
	config = file.readAll();
	file.close();
	
	QJsonParseError err;
	QJsonDocument doc = QJsonDocument::fromJson(config.toUtf8(), &err);
	if(QJsonParseError::NoError != err.error){
		Log::warning("Couldn't read test data file.");
		Log::warning(err.errorString());
		return false;
	}
	QJsonArray root = doc.array();
	for(int factoryNo = 0; factoryNo < root.size(); ++factoryNo){
		QJsonObject jFactory = root.at(factoryNo).toObject();
		Factory factory;
		factory.name = jFactory.value("name").toString();
		factory.staff = jFactory.value("staff").toDouble();
		factory.vehicles = 0;
		QJsonObject coords = jFactory.value("coordinate").toObject();
		factory.gpsLatitude = coords.value("latitude").toDouble();
		factory.gpsLongitude = coords.value("longitude").toDouble();
		factory.city = "";
		factory.country = "";
		factory.company = "Audi";
		FactoryDAO::insert(&factory);
		QJsonArray halls = jFactory.value("halls").toArray();
		for(int hallNo = 0; hallNo < halls.size(); ++hallNo){
			QJsonObject jHall = halls.at(hallNo).toObject();
			Hall hall;
            hall.factory = factory.id;
			hall.name = jHall.value("name").toString();
			hall.path = jHall.value("path").toString();
            hall.type = jHall.value("type").toString();
			hall.staff = 0;
			hall.capacity = 0;
            HallDAO::insert(&hall);
			QJsonArray lines = jHall.value("lines").toArray();
			for(int lineNo = 0; lineNo < lines.size(); ++lineNo){
				QJsonObject jLine = lines.at(lineNo).toObject();
				Line line;
				line.name = jLine.value("name").toString();
				line.path = jLine.value("path").toString();
                line.hall = hall.id;
				line.capacity = 0;
				line.series = "Test Series";
                LineDAO::insert(&line);
				QJsonArray locations = jLine.value("locations").toArray();
				for(int locNo = 0; locNo < locations.size(); ++locNo){
					QJsonObject jLoc = locations.at(locNo).toObject();
					Location loc;
					loc.name = jLoc.value("name").toString();
                    loc.line = line.id;
                    LocationDAO::insert(&loc);
                    QJsonArray devices = jLoc.value("devices").toArray();
                    for(int deviceNo = 0; deviceNo < devices.size(); ++deviceNo){
                        QJsonObject jDevice = devices.at(deviceNo).toObject();
                        Device device;
                        device.location = loc.id;
                        device.setSerial(jDevice.value("serial").toString());
                        DeviceDAO::insert(&device);
                        QJsonArray components = jDevice.value("components").toArray();
                        for(int componentNo = 0; componentNo < components.size(); ++componentNo){
                            QJsonObject jComponent = components.at(componentNo).toObject();
                            Component comp;
                            comp.device = device.getId();
                            comp.setSerial(jComponent.value("serial").toString());
                            ComponentDAO::insert(&comp);
                        }
                    }
				}
			}
		}
	}
	Log::info("Testdata loaded");
	return false;
}
