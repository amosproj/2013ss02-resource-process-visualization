#include <QApplication>
#include <QQuickView>
#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QDebug>

#include <iostream>

#include <Windows.h>

#include "Database.hpp"
#include "LogModel.hpp"
#include "ListModels.hpp"
#include "Factory.hpp"
#include "LoginModel.hpp"
#include "Progress.hpp"

int main(int argc, char* argv[]){
	QApplication app(argc, argv);
	qmlRegisterType<Factory>("org.unbugged.amos13", 1, 0, "Factory");
    qmlRegisterType<Hall>("org.unbugged.amos13", 1, 0, "Hall");
    qmlRegisterType<Line>("org.unbugged.amos13", 1, 0, "Line");
    qmlRegisterType<Location>("org.unbugged.amos13", 1, 0, "Location");
    qmlRegisterType<Device>("org.unbugged.amos13", 1, 0, "Device");
    qmlRegisterType<Component>("org.unbugged.amos13", 1, 0, "EComponent");
	qmlRegisterType<Progress>("org.unbugged.amos13", 1, 0, "Progress");
	qmlRegisterType<LogModel>("org.unbugged.amos13", 1, 0, "LogModel");
	qmlRegisterType<LoginModel>("org.unbugged.amos13", 1, 0, "LoginModel");
    qmlRegisterType<FactoryList>("org.unbugged.amos13", 1, 0, "FactoryList");
    qmlRegisterType<HallList>("org.unbugged.amos13", 1, 0, "HallList");
    qmlRegisterType<LineList>("org.unbugged.amos13", 1, 0, "LineList");
    qmlRegisterType<LocationList>("org.unbugged.amos13", 1, 0, "LocationList");
    qmlRegisterType<DeviceList>("org.unbugged.amos13", 1, 0, "DeviceList");
    qmlRegisterType<ComponentList>("org.unbugged.amos13", 1, 0, "ComponentList");
	QQmlEngine engine;
	QQmlComponent component(&engine);
	component.loadUrl(QUrl("qrc:/qml/main.qml"));
	if(!component.isReady()){
		qWarning() << component.errorString();
		int a;
		std::cin >> a;
		return -1;
	}
	QObject *toplevel =	component.create();
	QQuickWindow *window = qobject_cast<QQuickWindow *>(toplevel);
	if(!window){
		qWarning() << "Root item has to be a window.";
		return -1;
	}
	Database db(engine);
	engine.rootContext()->setContextProperty("database", &db);
	engine.rootContext()->setContextProperty("log", &(Log::getLog()));
	QObject::connect(&engine, SIGNAL(quit()), &app, SLOT(quit()));

	//qmlRegisterType<Factory>("org.unbugged.amos13", 1, 0, "Factory");
	window->show();

	
	return app.exec();;
}
