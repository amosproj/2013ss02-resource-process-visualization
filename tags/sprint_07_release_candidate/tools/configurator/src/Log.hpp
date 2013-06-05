#ifndef LOG_HPP
#define LOG_HPP

#include <QObject>
#include <QString>

class Log: public QObject{
	Q_OBJECT
public:
	enum SEVERITY{
		DEBUG, INFO, WARNING, CRITICAL
	};

	static Log& getLog();
public slots:
	static void debug(const QString& msg);
	static void info(const QString& msg);
	static void warning(const QString& msg);
	static void critical(const QString& msg);

	void sendMessage(const QString& msg, SEVERITY severity);
signals:
	void message(const QString& msg, SEVERITY severity);
private:
	Log();
	virtual ~Log();
};

#endif /* LOG_HPP */
