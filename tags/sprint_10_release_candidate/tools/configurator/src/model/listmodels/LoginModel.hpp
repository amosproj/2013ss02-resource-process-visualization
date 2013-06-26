#ifndef LOGIN_MODEL_HPP
#define LOGIN_MODEL_HPP

#include <QAbstractListModel>
#include <QObject>

struct LoginData {
	QString host;
	QString db;
	QString user;
	QString pass;
};

class LoginModel: public QAbstractListModel {
	Q_OBJECT
private:
	QList<LoginData> entries;
public:
	enum Roles{
		HostRole = Qt::UserRole + 1,
		DBRole, UserRole, PassRole
	};

	LoginModel(QObject* parent = 0);
	virtual ~LoginModel(){}

	int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
	QHash<int, QByteArray> roleNames() const;
};


#endif /* LOGIN_MODEL_HPP */
