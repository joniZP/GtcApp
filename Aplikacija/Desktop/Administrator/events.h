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
//#include<LokacijaModel.h>


class events : public QObject
{
    Q_OBJECT
public:
    explicit events(QObject *parent = nullptr);

signals:

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

};

#endif // EVENTS_H
