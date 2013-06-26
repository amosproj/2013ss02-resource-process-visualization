#include <QtSql>

#include <iostream>

#include "Database.hpp"
#include "Factory.hpp"
#include "Log.hpp"


Factory::Factory(QObject* parent)
	: QObject(parent), id(-1),
	gpsLatitude(0), gpsLongitude(0),
	staff(0), vehicles(0){
}

Factory::Factory(const Factory& other)
	: id(other.getId()),
	name(other.getName()),
	city(other.getCity()),
	country(other.getCountry()),
	company(other.getCompany()),
	gpsLatitude(other.getGpsLatitude()),
	gpsLongitude(other.getGpsLongitude()),
	brands(other.getBrands()),
	staff(other.getStaff()),
	vehicles(other.getVehicles()){
}

Factory::~Factory(){
}

Factory& Factory::operator=(const Factory& other){
	id = other.id;
	name = other.name;
	city = other.city;
	country = other.country;
	company = other.company;
	gpsLatitude = other.gpsLatitude;
	gpsLongitude = other.gpsLongitude;
	brands = other.brands;
	staff = other.staff;
	vehicles = other.vehicles;
	return *this;
}

FactoryDAO::FactoryDAO()
	: DAO("factory"){
}

FactoryDAO::~FactoryDAO(){
}

FactoryDAO& FactoryDAO::getInstance(){
	static FactoryDAO instance;
	return instance;
}

void FactoryDAO::create(){
	QSqlQuery query;
	query.exec("CREATE TABLE IF NOT EXISTS factory"
		"("
		"id INT DEFAULT nextval('ids') PRIMARY KEY, "
		"company VARCHAR(50), "
		"name VARCHAR(25), "
		"city VARCHAR(50), "
		"country VARCHAR(50), "
		"gpslatitude DOUBLE PRECISION, "
		"gpslongitude DOUBLE PRECISION, "
		"carmodels VARCHAR(512), "
		"sizeofstaff INTEGER, "
		"numofvehicles INTEGER"
		")");
	getInstance().tableCreated();
}

void FactoryDAO::del(){
	getInstance().wipe();
}

void FactoryDAO::insert(Factory* factory){
	QSqlQuery query;
	query.prepare("INSERT INTO factory "
		"(id, company, name, city, country, gpslatitude, gpslongitude, "
		"sizeofstaff, numofvehicles) "
		"VALUES "
		"(DEFAULT, :company, :name, :city, :country, :lat, :lon, "
		":staff, :vehicles)"
		"RETURNING id");
	query.bindValue(":company", factory->company);
	query.bindValue(":name", factory->name);
	query.bindValue(":city", factory->city);
	query.bindValue(":country", factory->country);
	query.bindValue(":lat", factory->gpsLatitude);
	query.bindValue(":lon", factory->gpsLongitude);
	query.bindValue(":staff", factory->staff);
	query.bindValue(":vehicles", factory->vehicles);
	query.exec();
	if(query.next()){
		int id = query.value(0).toInt();
		factory->id = id;
		getInstance().elementInserted();
	}else{
		Log::warning(query.lastError().text());
	}
}

void FactoryDAO::update(Factory* factory){
	if(factory->id == -1){
		Log::warning("Updating invalid factory");
		return;
	}
	QSqlQuery query;
	QString queryString("UPDATE factory "
		"SET "
			"company = :company, name = :name, "
			"city = :city, country = :country, "
			"gpslatitude = :lat, gpslongitude = :lon, "
			"sizeofstaff = :staff, numofvehicles = :vehicles "
		"WHERE id = :id");
	query.prepare(queryString);
	query.bindValue(":company", factory->company);
	query.bindValue(":name", factory->name);
	query.bindValue(":city", factory->city);
	query.bindValue(":country", factory->country);
	query.bindValue(":lat", factory->gpsLatitude);
	query.bindValue(":lon", factory->gpsLongitude);
	query.bindValue(":staff", factory->staff);
	query.bindValue(":vehicles", factory->vehicles);
	query.bindValue(":id", factory->id);
	query.exec();
	if(QSqlError::NoError != query.lastError().type()){
		Log::warning("Couldn't update factory");
		Log::warning(query.lastError().text());
	}
}

void FactoryDAO::del(Factory* factory){
	QSqlQuery query;
	query.prepare("DELETE FROM factory WHERE id = :id");
	query.bindValue(":id", factory->id);
	query.exec();
	getInstance().elementDeleted();
}

Factory FactoryDAO::findById(unsigned int id){
	Factory fac;
	QString queryString("SELECT "
		"id, name, city, country, "
		"gpslatitude, gpslongitude, "
		"carmodels, sizeofstaff, numofvehicles, "
		"company "
		"FROM factory WHERE id = :id");
	QSqlQuery query;
	query.prepare(queryString);
	query.bindValue(":id", id);
	query.exec();
	if(query.next()){
		fac.id = query.value(0).toInt();
		fac.name = query.value(1).toString();
		fac.city = query.value(2).toString();
		fac.country = query.value(3).toString();
		fac.gpsLatitude = query.value(4).toDouble();
		fac.gpsLongitude = query.value(5).toDouble();
		//fac.brands = query.value(6) ...
		fac.staff = query.value(7).toInt();
		fac.vehicles = query.value(8).toInt();
		fac.company = query.value(9).toString();
	}else{
		Log::warning(queryString);
		Log::warning(query.lastError().text());
	}
	return fac;
}

QList<Factory> FactoryDAO::findAll(){
	QList<Factory> list;
	QString queryString("SELECT id FROM factory");
	QSqlQuery query(queryString);
	if(QSqlError::NoError != query.lastError().type()){
		Log::warning(query.lastError().text());
		return list;
	}
	while(query.next()){
		int id = query.value(0).toInt();
		list.append(findById(id));
	}
	return list;
}