#include "Location.hpp"

Location::Location()
    : id(-1), line(0){

}

Location::Location(const Location& other)
    : id(other.getId()),
      name(other.getName()),
      line(other.line){

}

Location& Location::operator=(const Location& other){
    id = other.getId();
    name = other.getName();
    line = other.line;
    return *this;
}

int Location::getId()const{
    return id;
}

void Location::setId(int id){
    this->id = id;
}

QString Location::getName()const{
    return name;
}

void Location::setName(const QString &name){
    this->name = name;
}
