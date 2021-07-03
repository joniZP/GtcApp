#ifndef BACK_H
#define BACK_H

#include<qobject.h>
#include<QDebug>
#include<stdlib.h>
#include<MLokacija.h>
#include<MProfil.h>
#include<MDogadjaj.h>

class back :public QObject
{
    Q_OBJECT
    struct struktura
    {
        QString natpis;
        QString stranica;
        QString id;
    };
public:
    static QString idLDP;
    QList<struktura> *lista=new QList<struktura>;

    bool back_=false;
    QString natpis;

    Q_INVOKABLE
    QString getNatpis();
    Q_INVOKABLE
    QString getIcon();

    Q_INVOKABLE
    QString getIdLDP();

    Q_INVOKABLE
    QString nazad(QString tr);
    Q_INVOKABLE
    void napred(QString p,QString n, QString id);

    Q_INVOKABLE
    QString getLastSource();
    Q_INVOKABLE
    QString getLastId();
    explicit back(QObject *parent = nullptr)
    {
      //  struktura pom;
        //pom.stranica="qrc:/pocetna.qml";
       // pom.natpis="Pocetna";
       // lista->push_back(pom);
    }
};

#endif // BACK_H
