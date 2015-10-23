#ifndef CONNECTOR_H
#define CONNECTOR_H

#include <QObject>
#include <QDebug>
#include <vector>
#include <string>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlDriver>

#include "mysql-connector-c++-noinstall-1.1.6-win32/include/mysql_connection.h"
#include "mysql-connector-c++-noinstall-1.1.6-win32/include/mysql_driver.h"
#include "mysql-connector-c++-noinstall-1.1.6-win32/include/mysql_error.h"
#include "mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/driver.h"
#include "mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/resultset.h"
#include "mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/exception.h"
#include "mysql-connector-c++-noinstall-1.1.6-win32/include/cppconn/statement.h"

class Connector : public QObject
{
    Q_OBJECT
public:
    explicit Connector(QObject *parent = 0);
    Q_INVOKABLE QString connect(QString e);

signals:

public slots:
};

#endif // CONNECTOR_H
