#ifndef FACTORY_HPP
#define FACTORY_HPP

#include "DAO.hpp"

#include <vector>

#include <QObject>
#include <QString>
#include <QList>

struct Factory: public QObject{
	Q_OBJECT
	Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
	Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
	Q_PROPERTY(QString city READ getCity WRITE setCity NOTIFY cityChanged)
	Q_PROPERTY(QString country READ getCountry WRITE setCountry NOTIFY countryChanged)
	Q_PROPERTY(QString company READ getCompany WRITE setCompany NOTIFY companyChanged)
	Q_PROPERTY(double gpsLatitude READ getGpsLatitude WRITE setGpsLatitude NOTIFY gpsLatitudeChanged)
	Q_PROPERTY(double gpsLongitude READ getGpsLongitude WRITE setGpsLongitude NOTIFY gpsLongitudeChanged)
	Q_PROPERTY(QList<QString> brands READ getBrands WRITE setBrands NOTIFY brandsChanged)
	Q_PROPERTY(unsigned int staff READ getStaff WRITE setStaff NOTIFY staffChanged)
	Q_PROPERTY(unsigned int vehicles READ getVehicles WRITE setVehicles NOTIFY vehiclesChanged)
signals:
	void idChanged();
	void nameChanged();
	void cityChanged();
	void countryChanged();
	void companyChanged();
	void gpsLatitudeChanged();
	void gpsLongitudeChanged();
	void brandsChanged();
	void staffChanged();
	void vehiclesChanged();
public:
	int id;
	int getId()const{return id;}
	void setId(int id){this->id = id;}
	QString name;
	QString getName()const{return name;}
	void setName(const QString& name){this->name = name; emit nameChanged();}
	QString city;
	QString getCity()const{return city;}
	void setCity(const QString& city){this->city = city;}
	QString country;
	QString getCountry()const{return country;}
	void setCountry(const QString& country){this->country = country;}
	QString company;
	QString getCompany()const{return company;}
	void setCompany(const QString& company){this->company = company;}
	double gpsLatitude;
	double getGpsLatitude()const{return gpsLatitude;}
	void setGpsLatitude(double lat){this->gpsLatitude = lat;}
	double gpsLongitude;
	double getGpsLongitude()const{return gpsLongitude;}
	void setGpsLongitude(double lon){this->gpsLongitude = lon;}
	QList<QString> brands;
	QList<QString>& getBrands(){return brands;}
	QList<QString> getBrands()const{return brands;}
	void setBrands(const QList<QString>& brands){this->brands = brands;}
	unsigned int staff;
	unsigned int getStaff()const{return staff;}
	void setStaff(unsigned int staff){this->staff = staff;}
	unsigned int vehicles;
	unsigned int getVehicles()const{return vehicles;}
	void setVehicles(unsigned int vehicles){this->vehicles = vehicles;}

	Factory(QObject* parent = 0);
	Factory(const Factory& other);
	Factory& operator=(const Factory& other);
	virtual ~Factory();
};

class FactoryDAO: public DAO{
	Q_OBJECT
public:
	virtual ~FactoryDAO();
	static FactoryDAO& getInstance();

	Q_INVOKABLE static Factory findById(unsigned int id);
	static QList<Factory> findAll();
public slots:
	static void insert(Factory* factory);
	static void update(Factory* factory);
	static void del(Factory* factory);
	
	static void create();
	static void del();
private:
	FactoryDAO();
};


#endif /* FACTORY_HPP */
