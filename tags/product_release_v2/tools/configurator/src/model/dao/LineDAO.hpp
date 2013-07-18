#ifndef LINE_DAO_HPP
#define LINE_DAO_HPP

#include "DAO.hpp"
#include "Line.hpp"

class LineDAO: public DAO {
    Q_OBJECT
public:
    virtual ~LineDAO();

    static LineDAO& getInstance();

    static QList<Line> findAll(int hallId);
    static Line findById(int id);
public slots:
    static bool create();
    static bool del();

    static void insert(Line* line);
    static void update(Line* line);
    static void del(Line* line);

    static void createLineList(int hallId, QString pathFile);
private:
    LineDAO();
};

#endif /* LINEDAO_HPP */
