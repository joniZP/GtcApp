#include "Notification.h"
Notification* Notification::instance = NULL;
int Notification::NewFriendNotification = 0;
int Notification::NewShareNotification = 0;
QNetworkAccessManager* Notification::manager = NULL;
