#ifndef KLASA_H
#define KLASA_H

#include <QObject>
#include <QObject>
#include<qquickview.h>
#include<qquickitem.h>
#include<qqmlengine.h>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QSqlDatabase>
#include<QtSql>
#include<qlist.h>
#include <QFile>
#include <string>
#include <QHttpMultiPart>
#include <QLoggingCategory>
#include <QTextStream>
class klasa: public QObject
{
    Q_OBJECT
public:
    int promenljiva;
    int promenljiva2;
    int promenljiva3;
    klasa(int a)
    {
        promenljiva=a;
    }
    explicit klasa(QObject *parent = nullptr);
    Q_INVOKABLE void fun1(QObject *o)
    {
        o->setProperty("color","blue");
    }
    Q_INVOKABLE int getp1()
    {
        return promenljiva;
    }
    Q_INVOKABLE int setp1(int a)
    {
        promenljiva=a;
    }
signals:
   // QSqlDatabase db = QSqlDatabase::addDatabase("QOD");


};

#endif // KLASA_H
