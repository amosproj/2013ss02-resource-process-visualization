#include "Component.hpp"

Component::Component(QObject *parent) :
    id(-1),
    QObject(parent){
}

Component::Component(const Component& other)
    : id(other.getId()),
      serial(other.getSerial()),
      device(other.device){
}

Component::~Component(){
}

Component& Component::operator=(const Component& other){
    id = other.getId();
    serial = other.getSerial();
    device = other.device;
    return *this;
}

int Component::getId() const{
    return id;
}

QString Component::getSerial() const{
    return serial;
}

void Component::setId(int arg){
    if (id != arg) {
        id = arg;
        emit idChanged(arg);
    }
}

void Component::setSerial(QString arg){
    if (serial != arg) {
        serial = arg;
        emit serialChanged(arg);
    }
}
