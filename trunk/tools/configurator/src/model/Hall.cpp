#include "Hall.hpp"

Hall::Hall(QObject* parent)
    : id(-1), staff(0), capacity(0), factory(0){

}

Hall::Hall(const Hall &other)
    : id(other.getId()),
      name(other.getName()),
      staff(other.getStaff()),
      capacity(other.getCapacity()),
      path(other.getPath()),
      factory(other.factory){

}

Hall& Hall::operator=(const Hall& other){
    id = other.getId();
    name = other.getName();
    staff = other.getStaff();
    capacity = other.getCapacity();
    path = other.getPath();
    factory = other.factory;
    return *this;
}

QString Hall::getPath() const{
    return path;
}

void Hall::setPath(const QString &value){
    path = value;
}

int Hall::getCapacity() const{
    return capacity;
}

void Hall::setCapacity(int value){
    capacity = value;
}

int Hall::getStaff() const{
    return staff;
}

void Hall::setStaff(int value){
    staff = value;
}

QString Hall::getName() const{
    return name;
}

void Hall::setName(const QString &value){
    name = value;
}

int Hall::getId() const{
    return id;
}

void Hall::setId(int value){
    id = value;
}
