#include <QtSql>

#include "DeviceDAO.hpp"
#include "Log.hpp"

DeviceDAO::DeviceDAO() :
    DAO("device"){
}

DeviceDAO::~DeviceDAO(){
}

DeviceDAO& DeviceDAO::getInstance(){
    static DeviceDAO instance;
    return instance;
}

Device DeviceDAO::findById(int id){
    Device device;
    QString queryString("SELECT "
            "id, serial, sector, parent "
        "FROM device "
        "WHERE id = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", id);
    query.exec();
    if(query.next()){
        device.setId(query.value(0).toInt());
        device.setSerial(query.value(1).toString());
        device.setSector(query.value(2).toString());
        device.location = query.value(3).toInt();
    }else{
        Log::warning(query.lastError().text());
    }
    return device;
}

QList<Device> DeviceDAO::findAll(int locationId){
    QList<Device> list;
    QString queryString("SELECT id FROM device WHERE parent = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", locationId);
    query.exec();
    while(query.next()){
        list.append(findById(query.value(0).toInt()));
    }
    return list;
}

bool DeviceDAO::create(){
    QSqlQuery query("CREATE TABLE IF NOT EXISTS device"
        "("
            "id INT DEFAULT nextval('ids') PRIMARY KEY, "
            "serial VARCHAR(60), "
            "sector VARCHAR(50), "
            "parent INTEGER REFERENCES location(id) ON DELETE CASCADE"
        ")");
    if(QSqlError::NoError == query.lastError().type()){
        getInstance().tableCreated();
        return true;
    }else return false;
}

void DeviceDAO::insert(Device* device){
    QSqlQuery query;
    query.prepare("INSERT INTO device "
          "(id, serial, sector, parent) "
          "VALUES "
          "(DEFAULT, :serial, :sector, :parent) "
          "RETURNING id");
    query.bindValue(":serial", device->getSerial());
    query.bindValue(":sector", device->getSector());
    query.bindValue(":parent", device->location);
    query.exec();
    if(query.next()){
        int id = query.value(0).toInt();
        device->setId(id);
        getInstance().elementInserted();
    }else {
        Log::warning(query.lastError().text());
    }
}

void DeviceDAO::update(Device *device){
    QSqlQuery query;
    query.prepare("UPDATE device "
      "SET "
        "serial = :serial, sector = :sector "
      "WHERE id = :id");
    query.bindValue(":serial", device->getSerial());
    query.bindValue(":sector", device->getSector());
    query.bindValue(":id", device->getId());
    query.exec();
}

void DeviceDAO::del(Device *device){
    QSqlQuery query;
    query.prepare("DELETE FROM device WHERE id = :id");
    query.bindValue(":id", device->getId());
    query.exec();
    getInstance().elementDeleted();
}

bool DeviceDAO::del(){
    getInstance().wipe();
    return true;
}
