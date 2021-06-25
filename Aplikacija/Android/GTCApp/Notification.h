#ifndef NOTIFICATION_H
#define NOTIFICATION_H

#include <QObject>
#include<MySqlService.h>
#include<LOCALDATA.h>
#include<zahtevimodel.h>
#include<LINKS.h>
#include <QTimer>

class Notification : public QObject
{
    Q_OBJECT
    Q_PROPERTY(NOTIFY DataChanged)

private:
     QTimer *timer;
   static Notification* instance;

    static QNetworkAccessManager *manager;
    static int NewNotification;
        Notification(){
        timer = new QTimer(this);
        connect(timer, &QTimer::timeout, this, QOverload<>::of(&Notification::AsyncNotification));
        timer->start(5000);

        manager = new QNetworkAccessManager(this);
        QObject::connect(manager, &QNetworkAccessManager::finished, this, &Notification::ReplyNotificationData);
    }



    static void SendRequest(QString query)
    {
        QUrlQuery params;
        params.addQueryItem("query", query);
        params.addQueryItem("proba", "request");

        QUrl ur(LINKS::APILINK+"/Database/GtcService.php");
        QNetworkRequest req(ur);

        req.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
        manager->post(req, params.query().toUtf8());
    }

public:
    static void ReplyNotificationData(QNetworkReply * reply)
    {
        MySqlTable t;
        t = reply->readAll();
        if(t.isSuccessfully())
        {
            NewNotification = t.Rows[0][0].toInt();
            //emit GetInstance().DataChanged();
            emit GetInstance().nekiNasSignal(NewNotification);
            qDebug()<<"Broj notifikacija: "<<NewNotification;
        }
    }

    static void AsyncNotification(){
        MyQuery query;
        query="SELECT count(*) FROM `Zahtev` WHERE primalac='%1' and vidjen='0'";
        query<<LOCALDATA::mProfil->getKorisnickoIme();
       SendRequest(query.toStr());
    }

    //explicit Notification(QObject *parent = nullptr);

     static Notification& GetInstance()
     {
        if(instance ==NULL)
            instance = new Notification();

        return *instance;
     }
     Q_INVOKABLE
     void ucitajZahtevi()
     {
         MySqlService &s = MySqlService::MySqlInstance();

         MySqlTable t;
         MyQuery query;
         query="SELECT Korisnik.*,Zahtev.vidjen FROM `Zahtev` INNER join Korisnik on Zahtev.posiljalac=Korisnik.korisnickoIme WHERE primalac='%1' order by vidjen asc";
         query<<LOCALDATA::mProfil->getKorisnickoIme();

         t =s.WSendQuery(query);
         if(t.isSuccessfully())
         {
             ZahteviModel &zm=ZahteviModel::GetInstance();
             zm.removeAll();
             for(int i =0;i<t.Count();i++)
             {
              zm.dodajzahtev(zahtev((t.Rows[i]["slika"].toInt() == 0? LINKS::getProfileDefaultPicture():LINKS::getProfilePicture(t.Rows[i]["korisnickoIme"])),t.Rows[i]["ime"]+" "+t.Rows[i]["prezime"],t.Rows[i]["korisnickoIme"],t.Rows[i]["vidjen"].toInt(),false));
             }
             zm.setVidjeni();
         }

     }
     Q_INVOKABLE
     static int getBrNovihZahteva()
     {
         return NewNotification;
     }


signals:
void nekiNasSignal(int br);

};

#endif // NOTIFICATION_H
