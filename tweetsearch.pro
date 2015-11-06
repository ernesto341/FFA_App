TEMPLATE = app

QT += quick qml sql positioning
SOURCES += main.cpp \
    Connector.cpp

RESOURCES += tweetsearch.qrc

HEADERS +=    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/build_config.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/config.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/connection.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/datatype.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/driver.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/exception.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/metadata.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/parameter_metadata.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/prepared_statement.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/resultset.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/resultset_metadata.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/sqlstring.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/statement.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/variant.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/version_info.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/warning.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/mysql_connection.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/mysql_driver.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/mysql_error.h \
    mysql-connector-c++-noinstall-1.1.6-win32/include/boost/shared_ptr.hpp \
    mysql-connector-c++-noinstall-1.1.6-win32/include/boost/scoped_ptr.hpp \
    Connector.h \
    ../../../../Qt/Examples/Qt-5.5/quick/shared/shared.h

OTHER_FILES = tweetsearch.qml \
              content/*.qml \
              content/*.js \
              content/resources/*

target.path = $$[QT_INSTALL_EXAMPLES]/quick/demos/tweetsearch
INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/mysql-connector-c++-noinstall-1.1.6-win32/lib/ -lmysqlcppconn
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/mysql-connector-c++-noinstall-1.1.6-win32/lib/ -lmysqlcppconn
else:unix: LIBS += -L$$PWD/mysql-connector-c++-noinstall-1.1.6-win32/lib/ -lmysqlcppconn

INCLUDEPATH += $$PWD/mysql-connector-c++-noinstall-1.1.6-win32/include
DEPENDPATH += $$PWD/mysql-connector-c++-noinstall-1.1.6-win32/include
DEPENDPATH += $$PWD/mysql-connector-c++-noinstall-1.1.6-win32/lib

unix|win32: LIBS += -L$$PWD/mysql-connector-c++-noinstall-1.1.6-win32/lib/ -lmysqlcppconn-static

INCLUDEPATH += $$PWD/mysql-connector-c++-noinstall-1.1.6-win32/include
DEPENDPATH += $$PWD/mysql-connector-c++-noinstall-1.1.6-win32/include
