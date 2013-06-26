#include <QtSql>

#include "LocationDAO.hpp"
#include "Log.hpp"

LocationDAO::LocationDAO(): DAO("location"){
}

LocationDAO::~LocationDAO(){
}

Location LocationDAO::findById(int id){
    Location loc;
    QString queryString(
            "SELECT "
            "id, name, parent "
            "FROM location "
            "WHERE id = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", id);
    query.exec();
    if(query.next()){
        loc.setId(query.value(0).toInt());
        loc.setName(query.value(1).toString());
        loc.line = query.value(2).toInt();
    }else {
        Log::warning(query.lastError().text());
    }
    return loc;
}

QList<Location> LocationDAO::findAll(int lineId){
    QList<Location> list;
    QString queryString("SELECT id FROM location WHERE parent = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", lineId);
    query.exec();
    while(query.next()){
        list.append(findById(query.value(0).toInt()));
    }
    return list;
}

LocationDAO& LocationDAO::getInstance(){
    static LocationDAO instance;
    return instance;
}

bool LocationDAO::create(){
    QSqlQuery query(
        "CREATE TABLE IF NOT EXISTS location"
        "("
        "id INT DEFAULT nextval('ids') PRIMARY KEY, "
        "name VARCHAR(50), "
        "parent INTEGER REFERENCES line(id) ON DELETE CASCADE, "
        "personincharge VARCHAR(100), "
        "description VARCHAR(100)"
        ")");
    if(QSqlError::NoError == query.lastError().type()){
        getInstance().tableCreated();
        return true;
    }else return false;
}

bool LocationDAO::del(){
    getInstance().wipe();
    return true;
}

void LocationDAO::insert(Location* loc){
    QSqlQuery query;
    query.prepare("INSERT INTO location "
        "(id, name, parent) "
        "VALUES "
        "(DEFAULT, :name, :parent)"
        "RETURNING id");
    query.bindValue(":name", loc->name);
    query.bindValue(":parent", loc->line);
    query.exec();
    if(query.next()){
        int id = query.value(0).toInt();
        loc->id = id;
        getInstance().elementInserted();
    }else{
        qWarning() << query.lastError();
    }
}

void LocationDAO::update(Location *loc){
    QSqlQuery query;
    query.prepare("UPDATE location "
          "SET "
            "name = :name "
          "WHERE id = :id");
    query.bindValue(":name", loc->getName());
    query.bindValue(":id", loc->getId());
    query.exec();
}

void LocationDAO::del(Location *loc){
    QSqlQuery query;
    query.prepare("DELETE FROM location WHERE id = :id");
    query.bindValue(":id", loc->getId());
    query.exec();
    getInstance().elementDeleted();
}
