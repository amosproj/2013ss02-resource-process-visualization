#include "Log.hpp"

Log::Log(){
}

Log::~Log(){
}

Log& Log::getLog(){
	static Log log;
	return log;
}

void Log::debug(const QString& msg){
	getLog().sendMessage(msg, DEBUG);
}
void Log::info(const QString& msg){
	getLog().sendMessage(msg, INFO);
}

void Log::warning(const QString& msg){
	getLog().sendMessage(msg, WARNING);
}

void Log::critical(const QString& msg){
	getLog().sendMessage(msg, CRITICAL);
}

void Log::sendMessage(const QString& msg, SEVERITY severity){
	emit message(msg, severity);
}