#include "Progress.hpp"
#include "HallDAO.hpp"
#include "LineDAO.hpp"
#include "LocationDAO.hpp"
#include "DeviceDAO.hpp"
#include "ComponentDAO.hpp"

Progress::Progress(QObject* parent)
    : QObject(parent){
}

Progress::~Progress(){
}

void Progress::setFactory(int id){
	factory = FactoryDAO::findById(id);
    hall.factory = id;
}

void Progress::resetFactory(){
	factory = Factory();
}

Factory* Progress::getFactory(){
	return &factory;
}

void Progress::setHall(int id){
    hall = HallDAO::findById(id);
    line.hall = id;
}

void Progress::resetHall(){
    hall = Hall();
    hall.factory = factory.getId();
}

Hall* Progress::getHall(){
    return &hall;
}

void Progress::setLine(int id){
    line = LineDAO::findById(id);
    location.line = id;
}

void Progress::resetLine(){
    line = Line();
    line.hall = hall.getId();
}

Line* Progress::getLine(){
    return &line;
}

void Progress::setLocation(int id){
    location = LocationDAO::findById(id);
    device.location = id;
}

void Progress::resetLocation(){
    location = Location();
    location.line = line.getId();
}

Location* Progress::getLocation(){
    return &location;
}

void Progress::setDevice(int id){
    device = DeviceDAO::findById(id);
    component.device = id;
}

void Progress::resetDevice(){
    device = Device();
    device.location = location.getId();
}

Device *Progress::getDevice(){
    return &device;
}

void Progress::setComponent(int id){
    component = ComponentDAO::findById(id);
}

void Progress::resetComponent(){
    component = Component();
    component.device = device.getId();
}

Component *Progress::getComponent(){
    return &component;
}
