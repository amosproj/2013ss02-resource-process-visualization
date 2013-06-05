#include "Device.hpp"

Device::Device(QObject *parent) :
    QObject(parent), sector(""), serial(""){
}

Device::~Device(){
}

Device::Device(const Device& other)
    : id(other.getId()),
      serial(other.getSerial()),
      sector(other.getSector()),
      location(other.location){

}

Device& Device::operator=(const Device& other){
    location = other.location;
    id = other.getId();
    serial = other.getSerial();
    sector = other.getSector();
    return *this;
}

int Device::getId() const{
    return id;
}

QString Device::getSerial() const{
    return serial;
}

QString Device::getSector() const{
    return sector;
}

void Device::setId(int arg){
    if (id != arg) {
        id = arg;
        emit idChanged(arg);
    }
}

void Device::setSerial(const QString& arg){
    if (serial != arg) {
        serial = arg;
        emit serialChanged(arg);
    }
}

void Device::setSector(const QString& arg){
    if (sector != arg) {
        sector = arg;
        emit sectorChanged(arg);
    }
}
