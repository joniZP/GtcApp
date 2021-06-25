#include "Notification.h"

Notification* Notification::instance = NULL;
int Notification::NewNotification = 0;
QNetworkAccessManager* Notification::manager = NULL;
