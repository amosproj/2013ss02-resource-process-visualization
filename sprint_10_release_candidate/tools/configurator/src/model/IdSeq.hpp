#ifndef ID_SEQ_HPP
#define ID_SEQ_HPP

#include <QObject>

class IdSeq: public QObject{
	Q_OBJECT
public:
	virtual ~IdSeq();
	static IdSeq& getInstance();
public slots:
	static bool create();
	static bool del();
private:
	IdSeq();
};

#endif /* ID_SEQ_HPP */
