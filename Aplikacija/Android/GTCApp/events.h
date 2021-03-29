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
   // QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");


public slots:
    void fun(QObject *t)
    {
        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL"); // VERY IMPORTANT INSERT QODBC3 AND NOT QODBC
        //db.setDatabaseName("Driver={MySQL ODBC 5.3 Unicode Driver};DATABASE=ZBdhQkqfvG;");
        db.setHostName("remotemysql.com");
        db.setUserName("ZBdhQkqfvG");
        db.setDatabaseName("ZBdhQkqfvG");
        db.setPassword("MhVT5jPGB3");
        db.setPort(3306);
        if(db.open())
        {
             t->setProperty("color","green");
        }
        else
        {
            t->setProperty("color","red");
        }
    }
};

#endif // EVENTS_H
