#ifndef LOCATION_DAO_HPP
#define LOCATION_DAO_HPP

#include "DAO.hpp"
#include "Location.hpp"

class LocationDAO: public DAO {
    Q_OBJECT
public:
    virtual ~LocationDAO();

    static Location findById(int id);
    static QList<Location> findAll(int lineId);
    static LocationDAO& getInstance();
public slots:
    static bool create();
    static bool del();

    static void insert(Location *loc);
    static void update(Location* loc);
    static void del(Location* loc);
private:
    LocationDAO();
};

#endif /* LOCATION_DAO_HPP */
