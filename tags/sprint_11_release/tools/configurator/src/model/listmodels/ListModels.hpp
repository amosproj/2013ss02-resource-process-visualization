#ifndef LIST_MODELS_HPP
#define LIST_MODELS_HPP

#include <QAbstractListModel>
#include <QObject>

#include "Factory.hpp"
#include "HallDAO.hpp"
#include "LineDAO.hpp"
#include "LocationDAO.hpp"
#include "DeviceDAO.hpp"
#include "ComponentDAO.hpp"

class HierarchyList: public QAbstractListModel {
    Q_OBJECT
    Q_PROPERTY(int parentId
               READ getParentId
               WRITE setParentId
               NOTIFY parentIdChanged)
public:
    enum Roles{
        IdRole = Qt::UserRole + 1,
        NameRole
    };

    HierarchyList(QObject* parent = 0): QAbstractListModel(parent){}
    virtual ~HierarchyList(){}
    int getParentId()const{
        return parentId;
    }
public slots:
    void setParentId(int id){
        if(parentId != id){
            parentId = id;
            update();
            emit parentIdChanged();
        }
    }
signals:
    void parentIdChanged();

protected:
    int parentId;
    QHash<int, QByteArray> roleNames() const{
        QHash<int, QByteArray> roles;
        roles[IdRole] = "id";
        roles[NameRole] = "name";
        return roles;
    }
    virtual void update(){}
};

class FactoryList: public HierarchyList {
	Q_OBJECT
private:
	QList<Factory> entries;
public:
    FactoryList(QObject* parent = 0): HierarchyList(parent){
		entries = FactoryDAO::findAll();
	}
	virtual ~FactoryList(){}

	int rowCount(const QModelIndex & parent = QModelIndex()) const{
		return entries.count();
	}

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const{
		if(index.row() < 0 || index.row() >= entries.size()){
			return QVariant();
		}
		const Factory& entry = entries[index.row()];
		switch(role){
		case IdRole:
			return entry.id;
		case NameRole:
			return entry.name;
		}
		return QVariant();
    }
};

class HallList: public HierarchyList {
    Q_OBJECT
private:
    QList<Hall> entries;
public:
    HallList(QObject* parent = 0)
        : HierarchyList(parent){
        //entries = HallDAO::findAll();
    }
    virtual ~HallList(){}

    int rowCount(const QModelIndex & parent = QModelIndex()) const{
        return entries.count();
    }

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const{
        if(index.row() < 0 || index.row() >= entries.size()){
            return QVariant();
        }
        const Hall& entry = entries[index.row()];
        switch(role){
        case IdRole:
            return entry.getId();
        case NameRole:
            return entry.getName();
        }
        return QVariant();
    }
protected:
    virtual void update(){
        entries = HallDAO::findAll(parentId);
    }
};

class LineList: public HierarchyList {
    Q_OBJECT
private:
    QList<Line> entries;
public:
    LineList(QObject* parent = 0)
        : HierarchyList(parent){
    }
    virtual ~LineList(){}

    int rowCount(const QModelIndex & parent = QModelIndex()) const{
        return entries.count();
    }

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const{
        if(index.row() < 0 || index.row() >= entries.size()){
            return QVariant();
        }
        const Line& entry = entries[index.row()];
        switch(role){
        case IdRole:
            return entry.getId();
        case NameRole:
            return entry.getName();
        }
        return QVariant();
    }

protected:
    void update(){
        entries = LineDAO::findAll(parentId);
    }
};

class LocationList: public HierarchyList {
    Q_OBJECT
private:
    QList<Location> entries;
public:
    LocationList(QObject* parent = 0)
        : HierarchyList(parent){
    }
    virtual ~LocationList(){}

    int rowCount(const QModelIndex & parent = QModelIndex()) const{
        return entries.count();
    }

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const{
        if(index.row() < 0 || index.row() >= entries.size()){
            return QVariant();
        }
        const Location& entry = entries[index.row()];
        switch(role){
        case IdRole:
            return entry.getId();
        case NameRole:
            return entry.getName();
        }
        return QVariant();
    }

protected:
    void update(){
        entries = LocationDAO::findAll(parentId);
    }
};

class DeviceList: public HierarchyList {
    Q_OBJECT
private:
    QList<Device> entries;
public:
    DeviceList(QObject* parent = 0)
        : HierarchyList(parent){
    }
    virtual ~DeviceList(){}

    int rowCount(const QModelIndex & parent = QModelIndex()) const{
        return entries.count();
    }

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const{
        if(index.row() < 0 || index.row() >= entries.size()){
            return QVariant();
        }
        const Device& entry = entries[index.row()];
        switch(role){
        case IdRole:
            return entry.getId();
        case NameRole:
            return entry.getSerial();
        }
        return QVariant();
    }

protected:
    void update(){
        entries = DeviceDAO::findAll(parentId);
    }
};

class ComponentList: public HierarchyList {
    Q_OBJECT
private:
    QList<Component> entries;
public:
    ComponentList(QObject* parent = 0)
        : HierarchyList(parent){
    }
    virtual ~ComponentList(){}

    int rowCount(const QModelIndex & parent = QModelIndex()) const{
        return entries.count();
    }

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const{
        if(index.row() < 0 || index.row() >= entries.size()){
            return QVariant();
        }
        const Component& entry = entries[index.row()];
        switch(role){
        case IdRole:
            return entry.getId();
        case NameRole:
            return entry.getSerial();
        }
        return QVariant();
    }

protected:
    void update(){
        entries = ComponentDAO::findAll(parentId);
    }
};

#endif /* LIST_MODELS_HPP */
