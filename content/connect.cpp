

#include <string>
#include <vector>

vector<string> connect (string e)
{
    Dbase_connector conn;
    return (conn.query(e));
}
