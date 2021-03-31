#include "MySqlKrsta.h"

#ifndef KRSTA
#define KRSTA
bool MySqlService::WaitAnswer = false;
QString MySqlService::Answer = " ";
MySqlService * MySqlService::instance = NULL;
QEventLoop MySqlService::waitLoop;

#endif
