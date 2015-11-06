#include "Connector.h"

Connector::Connector(QObject *parent) : QObject(parent)
{

}

QString Connector::connect(QString e)
{
    QString data = "";
    //QSqlDriver * driver = new QSqlDriver();
    QSqlDatabase db;
    db.addDatabase("FFA_PROD");
    db.setHostName("ffaapp.ddns.net");
    db.setDatabaseName("FFA_PROD");
    db.setUserName("test");
    db.setPassword("test");
    //QSqlDriverCreatorBase dbcb;
    //db.registerSqlDriver("MYSQL", new QSqlDriverCreator<MYSQL>);
    
    if (!db.open())
    {
        //qDebug() << db.lastError();
        return (data);
    }
    QSqlQuery query;
    query.prepare(e);
    qDebug() << "Size of result: " << query.size();
    while(query.next())
        qDebug() << query.value(1).toString();

    db.close();
    return (data);
}

/*
QString Connector::connect(QString e)
{
    std::string server;
    std::string port;
    std::string u;
    std::string p;
    std::string schema;
    server = "ffaapp.ddns.net";
    port = "32798";
    u = "root";
    p = "FFA-Ay@l@_R!ch@rd@-3323";
    schema = "FFA_PROD";
    QString data = "";
    if (server.length() < 7 || port.length() < 4 || u.length() < 1 || p.length() < 1 || schema.length() < 1 || e.length() < 5)
    {
        return (data);
    }
    try
    {
        sql::Driver *driver = 000;
        sql::Connection *con = 000;
        sql::Statement *stmt = 000;
        sql::ResultSet *res = 000;
        std::string address = "";

        driver = get_driver_instance();
        if (!driver)
        {
            return (data);
        }
        address += "tcp://";
        address += server;
        address += ":";
        address += port;
        address.push_back('\0');
        u.push_back('\0');
        p.push_back('\0');
        qDebug() << "driver address: " << driver <<"\n"\
        << "Major Version: " << driver->getMajorVersion()\
        << " Minor Version: " << driver->getMinorVersion() << "\n";
        qDebug() << "Address: " << address.c_str() << "\n";
        qDebug() << "User: " << u.c_str() << "\n";
        qDebug() << "Password: " << p.c_str() << "\n";
        //sql::ConnectOptionsMap options;
        //options.insert( std::pair<sql::SQLString, sql::ConnectPropertyVal>(address,"hostName") );
        //options.insert( std::pair<sql::SQLString, sql::ConnectPropertyVal>(u,"userName") );
        //options.insert( std::pair<sql::SQLString, sql::ConnectPropertyVal>(p,"password") );
        //con = driver->connect(options);
        con = driver->connect("tcp://40.122.202.64", "test", "test");
//        con = driver->connect(address.c_str(), u.c_str(), p.c_str());
        if (!con)
        {
            return (data);
        }
//        con->setSchema(schema.c_str());

//        std::string tmp = e.toStdString();
//        stmt = con->createStatement();
//        res = stmt->executeQuery(tmp);
//        while (res->next())
//        {
//            data.append("\n==============\n");
//           tmp = (res->getString("_message"));
//            data.append(tmp.c_str());
//            tmp = (res->getString(1));
//            data.append(tmp.c_str());
//            data.append("\n==============\n");
//        }
//        delete (res);
//        delete (stmt);
        delete (con);

    }
    catch (sql::SQLException &e)
    {
        qDebug() << "# ERR: SQLException in " << __FILE__;
        qDebug() << "(" << __func__ << ") on line " << __LINE__ << "\n";
        qDebug() << "# ERR: " << e.what();
        qDebug() << " (MySQL error code: " << e.getErrorCode();
        //qDebug() << ", SQLState: " << e.getSQLState() << " )\n";
    }
    return (data);
}

        */
