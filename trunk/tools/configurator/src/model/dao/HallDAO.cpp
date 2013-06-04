#include <QtSql>
#include <QtXml>

#include "HallDAO.hpp"
#include "Log.hpp"

HallDAO::HallDAO()
    : DAO("hall"){
}

HallDAO::~HallDAO(){
}

HallDAO& HallDAO::getInstance(){
    static HallDAO instance;
    return instance;
}

Hall HallDAO::findById(int id){
    Hall hall;
    QString queryString("SELECT "
            "id, name, staff, "
            "capacity, path, parent "
        "FROM hall "
        "WHERE id = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", id);
    query.exec();
    if(query.next()){
        hall.setId(query.value(0).toInt());
        hall.setName(query.value(1).toString());
        hall.setStaff(query.value(2).toInt());
        hall.setCapacity(query.value(3).toInt());
        hall.setPath(query.value(4).toString());
        hall.factory =query.value(5).toInt();
    }else {
        Log::warning(query.lastError().text());
    }
    return hall;
}

void HallDAO::createHallList(int factoryId, QString pathFile){
    QDomDocument doc("pathes");
    QFile file(pathFile);
    if(!file.open(QIODevice::ReadOnly)){
        Log::warning("Can't open path file.");
        return;
    }
    if(!doc.setContent(&file)){
        file.close();
        return;
    }
    file.close();
    QDomElement root = doc.documentElement();
    QDomNodeList pathList = root.elementsByTagName("path");
    for(int pathNo = 0; pathNo < pathList.size(); ++pathNo){
        Hall hall;
        QString path = pathList.at(pathNo).attributes().namedItem("d").nodeValue();
        hall.setPath(path);
        QString hallname("H");
        hallname.append(QString::number(pathNo));
        hall.setName(hallname);
        hall.factory = factoryId;
        insert(&hall);
    }
}

QList<Hall> HallDAO::findAll(int factoryId){
    QList<Hall> list;
    QString queryString("SELECT id FROM hall WHERE parent = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", factoryId);
    query.exec();
    while(query.next()){
        list.append(findById(query.value(0).toInt()));
    }
    return list;
}

bool HallDAO::create(){
    QSqlQuery query;
    query.exec("CREATE TABLE IF NOT EXISTS hall"
               "("
               "id INT DEFAULT nextval('ids') PRIMARY KEY, "
               "name VARCHAR(50) NOT NULL, "
               "staff INTEGER NOT NULL DEFAULT 0, "
               "capacity INTEGER NOT NULL DEFAULT 0, "
               "path TEXT NOT NULL DEFAULT '', "
               "upsServer INTEGER NOT NULL DEFAULT 0, "
               "type VARCHAR(100) NOT NULL DEFAULT '', "
               "parent INTEGER REFERENCES factory(id) ON DELETE CASCADE"
               ")");
    if(QSqlError::NoError == query.lastError().type()){
        getInstance().tableCreated();
        return true;
    }else return false;
}

void HallDAO::insert(Hall* hall){
    QSqlQuery query;
    query.prepare("INSERT INTO hall "
                  "(id, name, staff, capacity, path, parent, type) "
                  "VALUES "
                  "(DEFAULT, :name, :staff, :capacity, :path, :parent, :type)"
                  "RETURNING id");
    query.bindValue(":name", hall->name);
    query.bindValue(":staff", hall->staff);
    query.bindValue(":capacity", hall->capacity);
    query.bindValue(":path", hall->path);
    query.bindValue(":parent", hall->factory);
    query.bindValue(":type", hall->getType());
    query.exec();
    if(query.next()){
        int id = query.value(0).toInt();
        hall->id = id;
        getInstance().elementInserted();
    }else{
        qWarning() << query.lastError();
    }
}

void HallDAO::update(Hall *hall){
    QSqlQuery query;
    query.prepare("UPDATE hall "
      "SET "
          "name = :name, staff = :staff, "
          "capacity = :capacity, path = :path "
      "WHERE id = :id");
    query.bindValue(":name", hall->getName());
    query.bindValue(":staff", hall->getStaff());
    query.bindValue(":capacity", hall->getCapacity());
    query.bindValue(":path", hall->getPath());
    query.bindValue(":id", hall->getId());
    query.exec();
    if(QSqlError::NoError != query.lastError().type()){
        Log::warning(query.lastError().text());
    }
}

void HallDAO::del(Hall *hall){
    QSqlQuery query;
    query.prepare("DELETE FROM hall WHERE id = :id");
    query.bindValue(":id", hall->getId());
    query.exec();
    getInstance().elementDeleted();
}

bool HallDAO::del(){
    getInstance().wipe();
    return true;
}
