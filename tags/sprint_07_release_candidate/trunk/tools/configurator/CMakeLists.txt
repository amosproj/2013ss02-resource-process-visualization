CMAKE_MINIMUM_REQUIRED(VERSION 2.8.9)

PROJECT(AMOS_Configurator)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})
INCLUDE_DIRECTORIES(src)
INCLUDE_DIRECTORIES(src/model)
INCLUDE_DIRECTORIES(src/model/dao)
INCLUDE_DIRECTORIES(src/model/listmodels)
SET(AUTOMOC_MOC_OPTIONS "-I${CMAKE_SOURCE_DIR}/src")
SET(CMAKE_AUTOMOC ON)
SET(CMAKE_INCLUDE_CURRENT_DIR ON)
#FIND_PACKAGE(Qt5Widgets REQUIRED)
FIND_PACKAGE(Qt5Core REQUIRED)
#FIND_PACKAGE(Qt5Quick REQUIRED)

FILE(GLOB QmlFiles ${CMAKE_SOURCE_DIR}/src/qml/*.qml)
SOURCE_GROUP("Qml" FILES ${QmlFiles})

QT5_ADD_RESOURCES(Resources ${CMAKE_SOURCE_DIR}/src/resources.qrc)

FILE(GLOB CppFiles ${CMAKE_SOURCE_DIR}/src/*.hpp
	${CMAKE_SOURCE_DIR}/src/*.cpp)
FILE(GLOB ModelFiles ${CMAKE_SOURCE_DIR}/src/model/*.hpp
	${CMAKE_SOURCE_DIR}/src/model/*.cpp)
FILE(GLOB DAOFiles ${CMAKE_SOURCE_DIR}/src/model/dao/*.hpp
	${CMAKE_SOURCE_DIR}/src/model/dao/*.cpp)
FILE(GLOB ListModelFiles ${CMAKE_SOURCE_DIR}/src/model/listmodels/*.hpp
	${CMAKE_SOURCE_DIR}/src/model/listmodels/*.cpp)

ADD_EXECUTABLE(configurator ${CppFiles} ${QmlFiles} ${ModelFiles} ${Resources} ${DAOFiles} ${ListModelFiles})
qt5_use_modules(configurator Qml Declarative Quick Sql Core Gui Xml)

#MESSAGE(STATUS ${AUTOMOC_FOUND})
#FILE(COPY ${QmlFiles} DESTINATION ${CMAKE_BINARY_DIR})
