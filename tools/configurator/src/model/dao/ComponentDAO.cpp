#include <QtSql>

#include "ComponentDAO.hpp"
#include "Log.hpp"

ComponentDAO::ComponentDAO()
    : DAO("component"){
}


ComponentDAO::~ComponentDAO(){
}

ComponentDAO& ComponentDAO::getInstance(){
    static ComponentDAO instance;
    return instance;
}

Component ComponentDAO::findById(unsigned int id){
    Component comp;
    QString queryString("SELECT "
        "id, serialnumber, parent "
        "FROM component "
        "WHERE id = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", id);
    query.exec();
    if(query.next()){
        comp.setId(query.value(0).toInt());
        comp.setSerial(query.value(1).toString());
        comp.device = query.value(2).toInt();
    }else{
        Log::warning(query.lastError().text());
    }
    return comp;
}

QList<Component> ComponentDAO::findAll(int deviceId){
    QList<Component> list;
    QString queryString("SELECT id FROM component WHERE parent = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", deviceId);
    query.exec();
    while(query.next()){
        list.append(findById(query.value(0).toInt()));
    }
    return list;
}

void ComponentDAO::insert(Component *component){
    QString queryString("INSERT INTO component"
        "(id, serialnumber, parent)"
        "VALUES "
        "(DEFAULT, :serial, :parent)"
        "RETURNING id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":serial", component->getSerial());
    query.bindValue(":parent", component->device);
    query.exec();
    if(query.next()){
        int id = query.value(0).toInt();
        component->setId(id);
        getInstance().elementInserted();
    }else{
        Log::warning(query.lastError().text());
    }
}

void ComponentDAO::update(Component *component){
    QSqlQuery query;
    query.prepare("UPDATE component "
      "SET "
      "serialnumber = :serial "
      "WHERE id = :id");
    query.bindValue(":serial", component->getSerial());
    query.bindValue(":id", component->getId());
    query.exec();
    if(QSqlError::NoError != query.lastError().type()){
        Log::warning(query.lastError().text());
    }
}

void ComponentDAO::del(Component *component){
    QSqlQuery query;
    query.prepare("DELETE FROM component WHERE id = :id");
    query.bindValue(":id", component->getId());
    query.exec();
    getInstance().elementDeleted();
}

void ComponentDAO::create(){
    QSqlQuery query(
        "CREATE TABLE IF NOT EXISTS component "
        "("
            "id INT DEFAULT nextval('ids') PRIMARY KEY, "
            "serialnumber VARCHAR(60), "
            "category VARCHAR(50), "
            "troubletime TIMESTAMP, "
            "sector VARCHAR(50), "
            "troublesite VARCHAR(50), "
            "responsible VARCHAR(50), "
            "parent INTEGER REFERENCES device(id) ON DELETE CASCADE"
        ")");
    getInstance().tableCreated();
}

void ComponentDAO::del(){
    getInstance().wipe();
}
