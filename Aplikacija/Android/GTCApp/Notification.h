#ifndef NOTIFICATION_H
#define NOTIFICATION_H

#include <QObject>
#include<MySqlService.h>
#include<LOCALDATA.h>
#include<zahtevimodel.h>
#include<LINKS.h>
#include <QTimer>
#include"QtAndroidExtras/QtAndroid"

class Notification : public QObject
{
    Q_OBJECT
    Q_PROPERTY(NOTIFY DataChanged)

private:
     QTimer *timer;
    static Notification* instance;

    static QNetworkAccessManager *manager;
    static int NewFriendNotification;
    static int NewShareNotification;

        Notification();



    static void SendRequest(QString query);

public:
    static void ReplyNotificationData(QNetworkReply * reply);

    static void AsyncNotification();

    //explicit Notification(QObject *parent = nullptr);

     static Notification& GetInstance();
     Q_INVOKABLE
     void ucitajZahtevi();
     Q_INVOKABLE
     static int getBrNovihZahteva();

     Q_INVOKABLE
     static void podeliLokaciju(int id,QString username);

     Q_INVOKABLE
     static void podeliDogadjaj(int id,QString username);

     static void deljenje(int id, QString username, int tip);

     Q_INVOKABLE
     void setVidjeni(int id);

     Q_INVOKABLE
     void ucitajObavestenja();

     static void sendPushNotification(QString text,QString naslov);




signals:
void nekiNasSignal(int br);
void updateFriendNotification(int num);
void updateSharedNotification(int num);

};

#endif // NOTIFICATION_H
