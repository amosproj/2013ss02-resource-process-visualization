#ifndef DATABASE_HPP
#define DATABASE_HPP

#include <QObject>
#include <QQmlEngine>
#include <QString>
#include <QtSql>

#include "Factory.hpp"
#include "Hall.hpp"
#include "Line.hpp"
#include "Location.hpp"
#include "IdSeq.hpp"

class Database: public QObject {
	Q_OBJECT
public:
	Database(QQmlEngine& engine);
	virtual ~Database();

public slots:
	bool init(QString host, QString db, QString user, QString pass);
	bool loadTestData();
private:
	QSqlDatabase db;
	bool connected;
	QQmlEngine& engine;
};

#endif
