#include "LogModel.hpp"

LogEntry::LogEntry(const QString& msg, Log::SEVERITY severity)
	: msg(msg), severity(severity){
}

QString LogEntry::getMessage()const{
	return msg;
}

Log::SEVERITY LogEntry::getSeverity()const{
	return severity;
}

LogModel::LogModel(QObject* parent)
	: QAbstractListModel(parent){
	Log* log = &(Log::getLog());
	QObject::connect(log, &Log::message, 
		this, &LogModel::recieveMessage);
}

int LogModel::rowCount(const QModelIndex & parent) const{
	return entries.count();
}

QVariant LogModel::data(const QModelIndex & index, int role) const{
	if(index.row() < 0 || index.row() >= entries.size()){
		return QVariant();
	}
	const LogEntry& entry = entries[index.row()];
	switch(role){
	case MessageRole:
		return entry.getMessage();
	case SeverityRole:
		switch(entry.getSeverity()){
		case Log::SEVERITY::DEBUG:
			return "Debug";
		case Log::SEVERITY::INFO:
			return "Info";
		case Log::SEVERITY::WARNING:
			return "Warning";
		default:
			return "Critical";
		}
	}
	return QVariant();
}

#include <iostream>
void LogModel::recieveMessage(const QString& msg, Log::SEVERITY severity){
	beginInsertRows(QModelIndex(), rowCount(), rowCount());
	entries.append(LogEntry(msg, severity));
	endInsertRows();
}

QHash<int, QByteArray> LogModel::roleNames() const{
	QHash<int, QByteArray> roles;
	roles[MessageRole] = "message";
	roles[SeverityRole] = "severity";
	return roles;
}