#ifndef DEVICE_DAO_HPP
#define DEVICE_DAO_HPP

#include "DAO.hpp"

#include "Device.hpp"

class DeviceDAO : public DAO
{
    Q_OBJECT
public:
    virtual ~DeviceDAO();
    static DeviceDAO& getInstance();

    static QList<Device> findAll(int locationId);
    static Device findById(int id);
public slots:
    static void insert(Device* device);
    static void update(Device* device);
    static void del(Device* device);

    static bool create();
    static bool del();
private:
    DeviceDAO();
    
};

#endif /* DEVICE_DAO_HPP */
