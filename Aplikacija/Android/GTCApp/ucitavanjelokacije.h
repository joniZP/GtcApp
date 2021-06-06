#ifndef UCITAVANJELOKACIJE_H
#define UCITAVANJELOKACIJE_H

#include <QObject>
#include <MLokacija.h>
#include <MySqlKrsta.h>
#include<komentarimodel.h>
#include<LINKS.h>
#include<slikamodel.h>

class UcitavanjeLokacije : public QObject
{
    Q_OBJECT
   private:
    MLokacija* lokacija;


public:
    explicit UcitavanjeLokacije(QObject *parent = nullptr);

    Q_INVOKABLE

    MLokacija* getLokacija(int id)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        lokacija = NULL;
         MyQuery query("SELECT Lokacija.*,Korisnik.ime,Korisnik.prezime FROM Lokacija inner join Korisnik on Lokacija.idkorisnika = Korisnik.korisnickoIme WHERE Id='%1'");//("SELECT * FROM Lokacija WHERE Id='%1'");
          query<<id;
           t = s.WSendQuery(query);

           if(t.isSuccessfully())
           {
               if(t.Count()>0)
               {
                  lokacija = new MLokacija(id,t.Rows[0]["idkorisnika"],t.Rows[0]["ime"] +" " + t.Rows[0]["prezime"],t.Rows[0]["naziv"],t.Rows[0]["opis"],t.Rows[0]["grad"],t.Rows[0]["likes"].toInt(),t.Rows[0]["x"].toDouble(),t.Rows[0]["y"].toDouble());
                  SlikaModel &sm = SlikaModel::GetInstance();
                  sm.removeAll();
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

           if(lokacija != NULL)
           {

             KomentariModel& kom =  KomentariModel::GetInstance();
             MySqlTable t1;
             MyQuery query("SELECT KomentariLokacije.*,Korisnik.ime,Korisnik.prezime  FROM `KomentariLokacije` inner join Korisnik on KomentariLokacije.idKorisnika = Korisnik.korisnickoIme WHERE idLokacije='%1'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
             query<<lokacija->id;
              t1 = s.WSendQuery(query);

             if(t1.isSuccessfully())
             {
                 for(int i = 0; i < t1.Count();i++)
                 {
                            kom.dodajkomentar(Komentar(LINKS::getProfilePicture(lokacija->kreator),t1.Rows[i]["tekstKomentara"],t1.Rows[0]["ime"]+" "+ t1.Rows[0]["prezime"]));
                 }
             }
           }



           return lokacija;

    }


};

#endif // UCITAVANJELOKACIJE_H
