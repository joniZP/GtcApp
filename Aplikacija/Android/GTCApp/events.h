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

    void fun()
    {
      /*  QNetworkAccessManager *manager = new QNetworkAccessManager(this);
        QObject::connect(manager, &QNetworkAccessManager::finished, this, &events::Proba);
       // manager->get(QNetworkRequest(QUrl("http://humanads.000webhostapp.com/webapi.php")));
        QUrlQuery params;
        params.addQueryItem("ime", "Sasfe");
        params.addQueryItem("sifra", "000000");
        params.addQueryItem("pol", "M");
        params.addQueryItem("godine", "21");

        QUrl ur("http://humanads.000webhostapp.com/webapi.php");
        QNetworkRequest request(ur);

        request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
        manager->post(request, params.query().toUtf8());*/

        MySqlService &s = MySqlService::MySqlInstance();



        MySqlTable t;

       t = s.WSendQuary("INSERT INTO Users VALUES('Ime','Sifra','M',19)");
           if(t.isSuccessfully())
           {
           qDebug()<<"RADI";
           }
        //t = s.WSendQuary("SELECT * From Users");

      // if(t.isSuccessfully())
     //  {
      //     qDebug()<<"RADI"<<t.Rows[0][0]<<t.Rows[0]["Pol"];
     //  }


    }

};

#endif // EVENTS_H
