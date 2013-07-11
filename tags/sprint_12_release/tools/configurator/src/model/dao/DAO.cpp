#include "DAO.hpp"
#include "Log.hpp"

#include <QtSql>

DAO::DAO(QString tablename)
	:tablename(tablename){
}

DAO::~DAO(){
}

bool DAO::wipe(){
	QSqlQuery query("DROP TABLE IF EXISTS " + tablename);
	setStatus(false);
	Log::info("Wiped " + tablename + " table");
	tableDeleted();
	return true;
}

bool DAO::getStatus(){
	QSqlQuery query("SELECT COUNT(*) "
		"FROM pg_tables "
		"WHERE schemaname='public' "
		"AND tablename='" 
		+ tablename + "'");
	if(query.next()){
		int count = query.value(0).toInt();
		status = count == 1; 
		return status;
	} else {
		qWarning() << query.lastError();
		return false;
	}
}

void DAO::setStatus(bool status){
	this->status = status;
	emit statusChanged(status);
}

int DAO::getCount(){
	QSqlQuery query("SELECT COUNT(*) "
		"FROM " + tablename);
	if(query.next()){
		count = query.value(0).toInt();
		return count;
	}else {
		return -1;
	}
}

void DAO::update(){
	emit countChanged();
}

void DAO::tableCreated(){
	setStatus(true);
	emit countChanged();
}

void DAO::tableDeleted(){
	setStatus(false);
	emit countChanged();
}

void DAO::elementInserted(){
	emit countChanged();
}

void DAO::elementDeleted(){
	emit countChanged();
}