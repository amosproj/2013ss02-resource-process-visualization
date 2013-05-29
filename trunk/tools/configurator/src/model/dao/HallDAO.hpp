#ifndef HALL_DAO_HPP
#define HALL_DAO_HPP

#include <QObject>

#include "Hall.hpp"

class HallDAO: public DAO {
    Q_OBJECT
public:
    virtual ~HallDAO();
    static HallDAO& getInstance();

    static QList<Hall> findAll(int factoryId);
    static Hall findById(int id);
public slots:
    static void createHallList(int factoryId, QString pathFile);
    static void insert(Hall *hall);
    static void update(Hall* hall);
    static void del(Hall* hall);

    static bool create();
    static bool del();
private:
    HallDAO();
};

#endif /* HALL_DAO_HPP */
