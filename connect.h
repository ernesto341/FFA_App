#ifndef CONNECT_H
#define CONNECT_H


#include "dbase_connector.h"
#include <string>
#include <vector>

Dbase_connector * getConnector();
vector<string> connect(string e);

#endif // CONNECT_H

