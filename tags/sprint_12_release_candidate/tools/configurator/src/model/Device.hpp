#ifndef DEVICE_HPP
#define DEVICE_HPP

#include <QObject>

class Device : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int id
               READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString serial
               READ getSerial WRITE setSerial NOTIFY serialChanged)
    Q_PROPERTY(QString sector
               READ getSector WRITE setSector NOTIFY sectorChanged)

    int id;
    QString serial;
    QString sector;

public:
    int location;

    Device(QObject *parent = 0);
    Device(const Device& other);
    virtual ~Device();

    Device& operator=(const Device& other);

    int getId() const;
    QString getSerial() const;
    QString getSector() const;

signals:
    void idChanged(int arg);
    void serialChanged(QString arg);
    void sectorChanged(QString arg);

public slots:
    void setId(int arg);
    void setSerial(const QString& arg);
    void setSector(const QString& arg);
};

#endif /* DEVICE_HPP */
