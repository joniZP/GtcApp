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
    QString getNatpis()
    {
        return natpis;
    }
    Q_INVOKABLE
    QString getIcon()
    {
        if(natpis=="Pocetna")
        {
            return "qrc:/new/prefix1/dropdown-menu-icon-20.jpg";
        }
        else
        {
            return "qrc:/new/prefix1/arrow-119-64.ico";
        }
    }

    Q_INVOKABLE
    QString getIdLDP()
    {
        return idLDP;
    }

    Q_INVOKABLE
    QString nazad(QString tr)
    {
        struktura pom;
        if(lista->count()==1)
        {
             qDebug()<<"1";
            pom=lista->back();
        }
        else if(lista->count()>1)
        {
             qDebug()<<lista->count();
            pom=lista->back();
            lista->pop_back();
            while(pom.stranica==tr || pom.stranica=="qrc:/prijava.qml" || pom.stranica=="qrc:/registracija.qml" || pom.stranica=="qrc:/DodajLokaciju.qml" || pom.stranica=="qrc:/DodajDogadjaj.qml")// if(source != "qrc:/prijava.qml" && source != "qrc:/registracija.qml" && source != "qrc:/DodajLokaciju.1ml" && source !="qrc:/DodajDogadjaj")
            {
                pom=lista->back();
                if(lista->count()>1)
                {  
                    lista->pop_back();
                }

            }
        }
        natpis=pom.natpis;
        back_=true;
        qDebug()<<"natpis" <<natpis;
        idLDP = pom.id;
        return pom.stranica;

    }
    Q_INVOKABLE
    void napred(QString p,QString n, QString id)
    {
        if(back_==false)
        {
            struktura pom;
            natpis=n;
            pom.natpis=n;
            pom.stranica=p;
            pom.id = id;
            lista->push_back(pom);
        }
        back_=false;
    }
    explicit back(QObject *parent = nullptr)
    {
      //  struktura pom;
        //pom.stranica="qrc:/pocetna.qml";
       // pom.natpis="Pocetna";
       // lista->push_back(pom);
    }
};

#endif // BACK_H
