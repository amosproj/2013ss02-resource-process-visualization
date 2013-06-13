#include <QtSql>
#include <QtXml>

#include "LineDAO.hpp"
#include "Log.hpp"

LineDAO::LineDAO(): DAO("line"){
}

LineDAO::~LineDAO(){
}

LineDAO& LineDAO::getInstance(){
    static LineDAO instance;
    return instance;
}

Line LineDAO::findById(int id){
    Line line;
    QString queryString("SELECT "
        "id, name, series, "
        "capacity, path, parent "
        "FROM line WHERE id = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", id);
    query.exec();
    if(query.next()){
        line.setId(query.value(0).toInt());
        line.setName(query.value(1).toString());
        line.setSeries(query.value(2).toString());
        line.setCapacity(query.value(3).toInt());
        line.setPath(query.value(4).toString());
        line.hall = query.value(5).toInt();
    }else {
        Log::warning(query.lastError().text());
    }
    return line;
}

QList<Line> LineDAO::findAll(int hallId){
    QList<Line> list;
    QString queryString("SELECT id FROM line WHERE parent = :id");
    QSqlQuery query;
    query.prepare(queryString);
    query.bindValue(":id", hallId);
    query.exec();
    while(query.next()){
        list.append(findById(query.value(0).toInt()));
    }
    return list;
}

bool LineDAO::create(){
    QSqlQuery query(
        "CREATE TABLE IF NOT EXISTS line"
        "("
        "id INT DEFAULT nextval('ids') PRIMARY KEY, "
        "name VARCHAR(50), "
        "series VARCHAR(50), "
        "capacity INTEGER, "
        "path VARCHAR(250), "
        "parent INTEGER REFERENCES hall(id) ON DELETE CASCADE"
        ")");
    if(QSqlError::NoError == query.lastError().type()){
        getInstance().tableCreated();
        return true;
    }else return false;
}

void LineDAO::insert(Line* line){
    QSqlQuery query;
    query.prepare("INSERT INTO line "
        "(id, name, series, capacity, path, parent) "
        "VALUES "
        "(DEFAULT, :name, :series, :capacity, :path, :parent)"
        "RETURNING id");
    query.bindValue(":name", line->name);
    query.bindValue(":series", line->series);
    query.bindValue(":capacity", line->capacity);
    query.bindValue(":path", line->path);
    query.bindValue(":parent", line->hall);
    query.exec();
    if(query.next()){
        int id = query.value(0).toInt();
        line->id = id;
        getInstance().elementInserted();
    }else{
        Log::warning(query.lastError().text());
    }
}

void LineDAO::update(Line *line){
    QSqlQuery query;
    query.prepare("UPDATE line "
      "SET "
          "name = :name, series = :series, "
          "path = :path, capacity = :capacity "
      "WHERE id = :id");
    query.bindValue(":name", line->getName());
    query.bindValue(":series", line->getSeries());
    query.bindValue(":path", line->getPath());
    query.bindValue(":capacity", line->getCapacity());
    query.bindValue(":id", line->getId());
    query.exec();
    if(QSqlError::NoError != query.lastError().type()){
        Log::warning(query.lastError().text());
    }
}

bool LineDAO::del(){
    getInstance().wipe();
    return true;
}

void LineDAO::del(Line *line){
    QSqlQuery query;
    query.prepare("DELETE FROM line WHERE id = :id");
    query.bindValue(":id", line->getId());
    query.exec();
    getInstance().elementDeleted();
}

void LineDAO::createLineList(int hallId, QString pathFile){
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
        Line line;
        QString path = pathList.at(pathNo).attributes().namedItem("d").nodeValue();
        line.setPath(path);
        QString hallname("L");
        hallname.append(QString::number(pathNo));
        line.setName(hallname);
        line.hall = hallId;
        insert(&line);
    }
}
