#ifndef LOCATION_HPP
#define LOCATION_HPP

#include <QObject>

#include "DAO.hpp"

class Location: public QObject {
	Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged);
public:
	int id;
	QString name;
    int line;

    Location();
    Location(const Location& other);
	virtual ~Location(){}

    Location& operator=(const Location& other);

    int getId() const;
    void setId(int id);
    QString getName() const;
    void setName(const QString &value);
signals:
    void idChanged();
    void nameChanged();
};

#endif /* LOCATION_HPP */
