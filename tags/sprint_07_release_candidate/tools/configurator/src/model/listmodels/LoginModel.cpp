#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

#include "Log.hpp"
#include "LoginModel.hpp"

LoginModel::LoginModel(QObject* parent)
	: QAbstractListModel(parent){
	QFile file("login.json");
	if(!file.exists()){
		Log::warning("No default connections configured.");
		return;
	}
	file.open(QIODevice::ReadOnly | QIODevice::Text);
	QString login = file.readAll();
	file.close();

	QJsonParseError err;
	QJsonDocument doc = QJsonDocument::fromJson(login.toUtf8(), &err);
	if(QJsonParseError::NoError != err.error){
		Log::warning("Default connection file corrupted.");
		Log::warning(err.errorString());
		return;
	}
	QJsonArray connections = doc.array();
	for(auto connection = connections.begin();
			connection != connections.end(); ++connection){
		QJsonObject jdata = (*connection).toObject();
		LoginData data;
		data.host = jdata.value("host").toString();
		data.db = jdata.value("db").toString();
		data.user = jdata.value("user").toString();
		data.pass = jdata.value("pass").toString();
		entries.append(data);
	}
}

int LoginModel::rowCount(const QModelIndex & parent) const{
	return entries.count();
}

QVariant LoginModel::data(const QModelIndex & index, int role) const{
	if(index.row() < 0 || index.row() >= entries.size()){
		return QVariant();
	}
	const LoginData& entry = entries[index.row()];
	switch(role){
	case HostRole:
		return entry.host;
	case DBRole:
		return entry.db;
	case UserRole:
		return entry.user;
	case PassRole:
		entry.user;
	}
	return QVariant();
}

QHash<int, QByteArray> LoginModel::roleNames() const{
	QHash<int, QByteArray> roles;
	roles[HostRole] = "host";
	roles[DBRole] = "db";
	roles[UserRole] = "user";
	roles[PassRole] = "pass";
	return roles;
}