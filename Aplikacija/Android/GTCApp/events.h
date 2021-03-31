#ifndef EVENTS_H
#define EVENTS_H

#include <QObject>
#include<qquickview.h>
#include<qquickitem.h>
#include<qqmlengine.h>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QSqlDatabase>
#include<QtSql>
#include<QSqlQuery>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include "MySqlKrsta.h"

class events : public QObject
{
    Q_OBJECT
public:
    explicit events(QObject *parent = nullptr);
    Q_INVOKABLE void fun1(QObject *o)
    {
        o->setProperty("color","blue");
    }
signals:
   // QSqlDatabase db = QSqlDatabase::addDatabase("QOD");


public slots:

    bool registracija(QString ime,QString korisnickoime,QString email,QString sifra)
    {

        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;

        QString query="INSERT INTO Users VALUES('"+ime+"','"+korisnickoime+"','"+email+"','"+sifra+"','')";
        QString q="SELECT * FROM Users WHERE KorisnickoIme='"+korisnickoime+"'";
qDebug()<<query;
           t = s.WSendQuery(q);
           if(t.isSuccessfully())
           {

           if(t.Count()>1)
           {
               return false;
           }
           }
           s.SendQuery(query);
           return true;

    }
    void prijava(QString username,QString password)
    {

    }

};

#endif // EVENTS_H
