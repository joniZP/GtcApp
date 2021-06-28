#ifndef REPORT_H
#define REPORT_H

#include <QObject>
#include<MySqlService.h>
#include<LOCALDATA.h>

class Report : public QObject
{
    Q_OBJECT
private:
    static int tipPrijave;
    static int idEntiteta;


   static void prijaviLokaciju(int idLokacije, QString razlog)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query("INSERT INTO `ReportLokacija`(username,idLokacija,razlog) VALUES ('%1',%2,'%3')");
        query<<LOCALDATA::mProfil->getKorisnickoIme()<<idLokacije<<razlog;
        s.SendQuery(query);
        //qDebug()<<"|aeqwt"<<query.toStr();
    }

   static void prijaviKomentar(int idkom,QString razlog, int tip)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query("INSERT INTO `ReportKomentar`(idKomentara,LokDog,username,razlog) VALUES (%1,%2,'%3','%4')");//;0 za lokaciju
        query<<idkom<<tip<<LOCALDATA::mProfil->getKorisnickoIme()<<razlog;
        s.SendQuery(query);
       // qDebug()<<"|aeqwt"<<query.toStr();
    }



    static void prijaviDogadjaj(int idDogadjaja, QString razlog)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query("INSERT INTO `ReportDogadjaj`(username,idDogadjaj,razlog) VALUES ('%1',%2,'%3')");
        query<<LOCALDATA::mProfil->getKorisnickoIme()<<idDogadjaja<<razlog;
        s.SendQuery(query);
        //qDebug()<<"|aeqwt"<<query.toStr();
    }



public:
    explicit Report(QObject *parent = nullptr);

    Q_INVOKABLE
   static void setParameters(int idEntiteta, int tip)
   {
       tipPrijave = tip;
       Report::idEntiteta = idEntiteta;
   }
   Q_INVOKABLE
   static void prijavi(QString razlog)
   {
       qDebug()<< razlog<< " ||" << idEntiteta<<" ||"<<tipPrijave;
       switch(Report::tipPrijave)
       {
       case 0: prijaviLokaciju(idEntiteta,razlog); break;
       case 1:prijaviDogadjaj(idEntiteta,razlog); break;
       case 2:prijaviKomentar(idEntiteta,razlog,0); break;
       case 3: prijaviKomentar(idEntiteta,razlog,1); break;
       default: qDebug()<<"Greska ID";break;
       }
   }




signals:

};

#endif // REPORT_H
