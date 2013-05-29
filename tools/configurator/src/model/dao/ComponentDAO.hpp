#ifndef COMPONENT_DAO_HPP
#define COMPONENT_DAO_HPP

#include "Component.hpp"
#include "DAO.hpp"

class ComponentDAO : public DAO{
    Q_OBJECT
public:
    virtual ~ComponentDAO();
    static ComponentDAO& getInstance();

    static Component findById(unsigned int id);
    static QList<Component> findAll(int deviceId);
public slots:
    static void insert(Component* component);
    static void update(Component* component);
    static void del(Component* component);

    static void create();
    static void del();
private:
    ComponentDAO();
};

#endif /* COMPONENT_DAO_HPP */
