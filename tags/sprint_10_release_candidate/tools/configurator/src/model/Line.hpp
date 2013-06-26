#ifndef LINE_HPP
#define LINE_HPP

#include <QObject>

#include "DAO.hpp"

class Line: public QObject {
	Q_OBJECT
	Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
	Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
	Q_PROPERTY(QString series READ getSeries WRITE setSeries NOTIFY seriesChanged)
	Q_PROPERTY(QString path READ getPath WRITE setPath NOTIFY pathChanged)
	Q_PROPERTY(int capacity READ getCapacity WRITE setCapacity NOTIFY capacityChanged)
public:
	int id;
	int getId()const{return id;}
	void setId(int id){this->id = id;}
	QString name;
	QString getName()const{return name;}
	void setName(const QString& name){this->name = name;}
	QString series;
	QString getSeries()const{return series;}
	void setSeries(const QString& series){this->series = series;}
	QString path;
	QString getPath()const{return path;}
	void setPath(const QString& path){this->path = path;}
	int capacity;
	int getCapacity()const{return capacity;}
	void setCapacity(int capacity){this->capacity = capacity;}
    int hall;

    Line(QObject* hall = 0);
	Line(const Line& other);
	virtual ~Line(){}

	Line& operator=(const Line& other);
signals:
	void idChanged();
	void nameChanged();
	void seriesChanged();
	void pathChanged();
	void capacityChanged();
};

#endif /* LINE_HPP */
