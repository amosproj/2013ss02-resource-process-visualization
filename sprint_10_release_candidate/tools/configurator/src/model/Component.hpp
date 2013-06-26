#ifndef COMPONENT_HPP
#define COMPONENT_HPP

#include <QObject>

class Component : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int id
        READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString serial
               READ getSerial WRITE setSerial NOTIFY serialChanged)
    int id;
    QString serial;

public:
    int device;

    Component(QObject *parent = 0);
    Component(const Component& other);
    virtual ~Component();

    Component& operator=(const Component& other);

    int getId() const;
    QString getSerial() const;

signals:
    void idChanged(int arg);
    void serialChanged(QString arg);

public slots:
    void setId(int arg);
    void setSerial(QString arg);
};

#endif /* COMPONENT_HPP */
