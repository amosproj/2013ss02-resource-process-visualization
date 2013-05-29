#ifndef MODEL_HPP
#define MODEL_HPP

#include <QObject>
#include <QString>

class DAO: public QObject{
	Q_OBJECT
	Q_PROPERTY(bool status 
		READ getStatus WRITE setStatus 
		NOTIFY statusChanged)
	Q_PROPERTY(int count
		READ getCount
		NOTIFY countChanged)
public:
	DAO(QString tablename);
	virtual ~DAO();
	bool getStatus();
	int getCount();
public slots:
	void update();
signals:
	void statusChanged(bool status);
	void countChanged();
private:
	bool status;
	int count;
protected:
	bool wipe();
	void setStatus(bool status);
	QString tablename;
	void tableCreated();
	void tableDeleted();
	void elementInserted();
	void elementDeleted();
};

#endif /* MODEL_HPP */
