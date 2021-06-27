#ifndef BACK_H
#define BACK_H

#include<qobject.h>
#include<QDebug>
#include<stdlib.h>
class back :public QObject
{
    Q_OBJECT
    struct struktura
    {
        QString natpis;
        QString stranica;
    };

public:
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
            if(pom.stranica==tr)
            {
                if(lista->count()>1)
                {
                    pom=lista->back();
                    lista->pop_back();
                }
                else
                {
                    pom=lista->back();
                }
            }
        }
        natpis=pom.natpis;
        back_=true;
        qDebug()<<"natpis" <<natpis;
        return pom.stranica;

    }
    Q_INVOKABLE
    void napred(QString p,QString n)
    {
        if(back_==false)
        {
            struktura pom;
            natpis=n;
            pom.natpis=n;
            pom.stranica=p;
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
