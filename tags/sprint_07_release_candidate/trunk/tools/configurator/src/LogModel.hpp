#ifndef LOG_MODEL_HPP
#define LOG_MODEL_HPP

#include <QAbstractListModel>
#include <QStringList>

#include "Log.hpp"

class LogEntry {
public:
	LogEntry(const QString& msg, Log::SEVERITY severity);
	QString getMessage()const;
	Log::SEVERITY getSeverity()const;
private:
	QString msg;
	Log::SEVERITY severity;
};

class LogModel: public QAbstractListModel {
	Q_OBJECT
public:
	enum LogRoles {
		MessageRole = Qt::UserRole + 1,
		SeverityRole
	};

	LogModel(QObject* parent = 0);

	int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

public slots:
	void recieveMessage(const QString& msg, Log::SEVERITY severity);
protected:
	QHash<int, QByteArray> roleNames() const;
private:
	QList<LogEntry> entries;
};

#endif /* LOG_MODEL_HPP */
