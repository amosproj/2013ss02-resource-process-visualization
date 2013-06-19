#include "IdSeq.hpp"
#include "Log.hpp"

#include <QtSql>

IdSeq::IdSeq(){
}

IdSeq::~IdSeq(){
}

IdSeq& IdSeq::getInstance(){
	static IdSeq instance;
	return instance;
}

bool IdSeq::create(){
	QSqlQuery query("CREATE SEQUENCE ids START 1 INCREMENT BY 1");
	Log::info("Created id sequence");
	return true;
}

bool IdSeq::del(){
	QSqlQuery query("DROP SEQUENCE IF EXISTS ids CASCADE");
	Log::info("Deleted id sequence");
	return true;
}