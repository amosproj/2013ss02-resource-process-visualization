#ifndef HALL_HPP
#define HALL_HPP

#include "DAO.hpp"

#include <QObject>
#include <QString>

class Hall: public QObject {
	Q_OBJECT
    Q_PROPERTY(int id
               READ getId WRITE setId
               NOTIFY idChanged)
    Q_PROPERTY(QString name
               READ getName WRITE setName
               NOTIFY nameChanged)
    Q_PROPERTY(int staff
               READ getStaff WRITE setStaff
               NOTIFY staffChanged)
    Q_PROPERTY(int capacity
               READ getCapacity WRITE setCapacity
               NOTIFY capacityChanged)
    Q_PROPERTY(QString path
               READ getPath WRITE setPath
               NOTIFY pathChanged)
    Q_PROPERTY(QString type
               READ getType WRITE setType
               NOTIFY typeChanged)


public:
    Hall(QObject* parent = nullptr);
    Hall(const Hall& other);
    virtual ~Hall(){}

    Hall& operator=(const Hall& other);

    int id;
	QString name;
	int staff;
	int capacity;
	QString path;
    int factory;
    QString type;

    int getId() const;
    void setId(int value);
    QString getName() const;
    void setName(const QString &value);
    int getStaff() const;
    void setStaff(int value);
    int getCapacity() const;
    void setCapacity(int value);
    QString getPath() const;
    void setPath(const QString &value);
    QString getType() const;
    void setType(QString arg);

signals:
    void staffChanged(int arg);
    void capacityChanged(int arg);
    void nameChanged(QString arg);
    void idChanged(int arg);
    void pathChanged(QString arg);
    void typeChanged(QString arg);
};

#endif /* HALL_HPP */
