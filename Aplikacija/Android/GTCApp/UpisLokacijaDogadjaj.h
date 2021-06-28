#ifndef UPISLOKACIJADOGADJAJ_H
#define UPISLOKACIJADOGADJAJ_H

#include <QObject>
#include<MySqlService.h>
#include<LOCALDATA.h>
#include<FileUploader.h>

class UpisLokacijaDogadjaj : public QObject
{
    Q_OBJECT
public:
   // explicit UpisLokacijaDogadjaj(QObject *parent = nullptr);

    QStringList slike;
    double xcoo = 0;
    double ycoo= 0;

    Q_INVOKABLE
    int upisiLokaciju(QString naziv, QString grad,QString opis)
    {
        MySqlService &s = MySqlService::MySqlInstance();
         MyQuery query("INSERT INTO `Lokacija`(`naziv`, `grad`, `opis`, `idkorisnika`, `ocena`, `brojOcena`, `x`, `y`, `brojSlika`, `likes`, `Verifikovana`,`kategorija`) VALUES ('%2','%3','%4','%5',%6,%7,%8,%9,%10,%11,%12,'%13')");
          query<<naziv<<grad<<opis<<LOCALDATA::mProfil->getKorisnickoIme()<<0<<0<<xcoo<<ycoo<<slike.length()<<0<<0<<"Nema";
          MySqlTable tpom;
          tpom = s.WSendQuery(query);
          if(tpom.isSuccessfully())
          {

            qDebug()<<query.toStr();

                  MySqlTable t;
                 t = s.WSendQuery("SELECT max(Id) FROM Lokacija");

        //   MyQuery query1("INSERT INTO `Korisnik_Lokacija`(`idKorisnika`, `idLokacije`) VALUES ('%1',%2)");
         //  query1<<LOCALDATA::mProfil->getKorisnickoIme()<<t.Rows[0][0];
         //  s.WSendQuery(query1);

           FileUploader *f = new FileUploader();
           for(int i=0; i<slike.length();i++)
           {
               MyQuery m("LOK%1SLIKA%2");
               m<<t.Rows[0][0]<<i;
              f->uploadImage(m.toStr(),slike[i]);
           }

           return t.Rows[0][0].toInt();
          }
          return -1;

    }
    Q_INVOKABLE
    void dodajSliku(QString url)
    {
        slike.append(url);
    }
    Q_INVOKABLE
    void setCoo(double x, double y)
    {
        xcoo = x;
        ycoo = y;
    }



    Q_INVOKABLE
    int upisiDogadjaj(int idLokacije, QString vreme, QString opis, QString tip)
    {
        MySqlService &s = MySqlService::MySqlInstance();
         MyQuery query("INSERT INTO `Dogadjaj`(`idLokacije`, `vreme`, `opis`, `tip`, `idKorisnika`, `svidjanja`) VALUES (%1,'%2','%3','%4','%5',%6)");
          query<<idLokacije<<vreme<<opis<<tip<<LOCALDATA::mProfil->getKorisnickoIme()<<0;
          qDebug() << query.toStr();
          MySqlTable t;
          t = s.WSendQuery(query);
          if(t.isSuccessfully())
          {

                 MySqlTable t1;
                 t1 = s.WSendQuery("SELECT max(idDogadjaja) FROM Dogadjaj");
                 if(t1.isSuccessfully())
                 {
                     return t1.Rows[0][0].toInt();
                 }


          }
          return -1;
    }

    Q_INVOKABLE
    QString formatDate(int mesec,int dan, int sat, int minut)
    {
        MyQuery format;
        format = "%1-%2-%3 %4:%5:00";
        format<<QDateTime::currentDateTime().date().year();
        format<<mesec<<dan<<sat<<minut;
        return format.toStr();
    }


signals:

};



#endif // UPISLOKACIJADOGADJAJ_H
