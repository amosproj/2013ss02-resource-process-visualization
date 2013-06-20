#include "Line.hpp"

#include <QtSql>

Line::Line(QObject* parent)
	:QObject(parent), id(-1),
	capacity(0){
}

Line::Line(const Line& other)
	:id(other.getId()),
	name(other.getName()),
	series(other.getSeries()),
	path(other.getPath()),
	capacity(other.getCapacity()){
}

Line& Line::operator=(const Line& other){
	id = other.getId();
	name = other.getName();
	series = other.getSeries();
	path = other.getPath();
	capacity = other.getCapacity();
	return *this;
}
