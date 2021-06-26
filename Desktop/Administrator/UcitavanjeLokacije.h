#ifndef UCITAVANJELOKACIJE_H
#define UCITAVANJELOKACIJE_H
#include <QObject>
#include<MySqlService.h>
#include<lokacijaModel.h>
#include<LINKS.h>
#include<slikaModel.h>
#include <lokacija.h>
#include <mlokacija.h>
class UcitavanjeLokacije : public QObject
{
private:
       MLokacija* lokacija;

    Q_OBJECT
public:
    explicit UcitavanjeLokacije(QObject *parent = nullptr);
  Q_INVOKABLE
  void ucitaj()
  {
      MySqlService &s = MySqlService::MySqlInstance();
      QString query;
      MySqlTable Lokacijatable;
      query = "SELECT * FROM Lokacija INNER JOIN ReportLokacija ON Lokacija.id = ReportLokacija.idLokacija ";


      Lokacijatable = s.WSendQuery(query);

      if(Lokacijatable.isSuccessfully())
      {
          //  qDebug() << "kveri:" << Lokacijatable.Count();
        LokacijaModel &klmodel = LokacijaModel::GetInstance();
          klmodel.removeAll();
          for(int i=0;i<Lokacijatable.Count();i++)
          {
              QString slikapom =  (Lokacijatable.Rows[i]["brojSlika"].toInt()) > 0 ? LINKS::getLocationPicture(Lokacijatable.Rows[i]["id"].toInt(),0) : LINKS::getNoImageAvailable();
              qDebug() << slikapom;
               klmodel.dodajlokaciju(Lokacija(Lokacijatable.Rows[i]["id"].toInt(),slikapom, Lokacijatable.Rows[i]["naziv"], Lokacijatable.Rows[i]["grad"],Lokacijatable.Rows[i]["idkorisnika"],Lokacijatable.Rows[i]["razlog"],Lokacijatable.Rows[i]["username"]));
           }
      }
  }
  Q_INVOKABLE
  MLokacija* getLokacija(int id)
  {
      MySqlService &s = MySqlService::MySqlInstance();
      MySqlTable t;
      lokacija = NULL;
       MyQuery query("SELECT Lokacija.*,Korisnik.ime,Korisnik.prezime FROM Lokacija inner join Korisnik on Lokacija.idkorisnika = Korisnik.korisnickoIme WHERE Id='%1'");//("SELECT * FROM Lokacija WHERE Id='%1'");
        query<<id;
        qDebug()<<id;

         t = s.WSendQuery(query);

         if(t.isSuccessfully())
         {
             if(t.Count()>0)
             {
                 // MLokacija(int id, QString kreator,QString punoime,QString naziv,QString opis,QString grad,int like, double xcoo,double ycoo)
                lokacija = new MLokacija(id,t.Rows[0]["idkorisnika"],t.Rows[0]["ime"] +" " + t.Rows[0]["prezime"],t.Rows[0]["naziv"],t.Rows[0]["opis"],t.Rows[0]["grad"],t.Rows[0]["likes"].toInt(),t.Rows[0]["x"].toDouble(),t.Rows[0]["y"].toDouble());
               SlikaModel &sm =  SlikaModel::GetInstance();
                sm.removeAll();
                  qDebug()<< t.Rows[0]["naziv"];
                  qDebug()<<t.Rows[0]["opis"];
                if(t.Rows[0]["brojSlika"].toInt() == 0)
                {
                    sm.dodajSliku(LINKS::APILINK+"/upload/noimageavailable.jpeg");
                }
                else
                {
                    for(int i=0;i< t.Rows[0]["brojSlika"].toInt();i++)
                    {
                        sm.dodajSliku(LINKS::getLocationPicture(id,i));
                        qDebug()<<"UCITAVA: "<<LINKS::getLocationPicture(id,i);
                    }
                }

             }
         }
         return lokacija;

  }
};
#endif // UCITAVANJELOKACIJE_H
