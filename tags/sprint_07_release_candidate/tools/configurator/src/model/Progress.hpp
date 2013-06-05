#ifndef PROGRESS_HPP
#define PROGRESS_HPP

#include <QObject>

#include "Factory.hpp"
#include "Hall.hpp"
#include "Line.hpp"
#include "Location.hpp"
#include "Device.hpp"
#include "Component.hpp"

class Progress: public QObject {
	Q_OBJECT
	Q_PROPERTY(Factory* factory READ getFactory CONSTANT)
    Q_PROPERTY(Hall* hall READ getHall CONSTANT)
    Q_PROPERTY(Line* line READ getLine CONSTANT)
    Q_PROPERTY(Location* location READ getLocation CONSTANT)
    Q_PROPERTY(Device* device READ getDevice CONSTANT)
    Q_PROPERTY(Component* component READ getComponent CONSTANT)
public:
	Progress(QObject* parent = 0);
	virtual ~Progress();
public slots:
	void setFactory(int id);
	void resetFactory();
	Factory* getFactory();
    void setHall(int id);
    void resetHall();
    Hall* getHall();
    void setLine(int id);
    void resetLine();
    Line* getLine();
    void setLocation(int id);
    void resetLocation();
    Location* getLocation();
    void setDevice(int id);
    void resetDevice();
    Device* getDevice();
    void setComponent(int id);
    void resetComponent();
    Component* getComponent();
private:
	Factory factory;
    Hall hall;
    Line line;
    Location location;
    Device device;
    Component component;
};

#endif /* PROGRESS_HPP */
