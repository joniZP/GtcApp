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
#include "EmailVerificator.h"
#include<LokacijaModel.h>

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
        QString query="INSERT INTO Users VALUES('"+ime+"','"+korisnickoime+"','"+email+"','"+sifra+"',0,'')";
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
           EmailVerificator &ev = EmailVerificator::GetInstance();
           ev.SendVerificationEmail(email,korisnickoime,ime);
           return true;

    }
    int prijava(QString korisnickoime,QString password)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        QString q="SELECT * FROM Users WHERE KorisnickoIme='"+korisnickoime+"'and Password='"+password+"'";
           t = s.WSendQuery(q);
           if(t.isSuccessfully())
           {
           if(t.Count()>1)
           {
               if(t.Rows[0]["Verifikovan"]=="0")
               {
                   return 0;
               }
               return 1;
           }
           return 2;
           }
           return false;
    }
    void fun2()
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        QString q="SELECT * FROM Users";
           t = s.WSendQuery(q);
         qDebug()<<"radi";
         LokacijaModel &model =LokacijaModel::GetInstance();
         for(int i=0;i<t.Count()-1;i++)
         {
         model.dodajlokaciju(lokacija("https://en.wikipedia.org/wiki/File:Vonspee1.JPG",t.Rows[i]["Email"],t.Rows[i]["Password"]));
         }
    }
    void fun3()
    {
        LokacijaModel &model =LokacijaModel::GetInstance();
        model.remove();
    }

};

#endif // EVENTS_H
