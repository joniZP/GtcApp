#ifndef UCITAVANJELOKACIJE_H
#define UCITAVANJELOKACIJE_H

#include <QObject>
#include <MLokacija.h>
#include <MySqlService.h>
#include<komentarimodel.h>
#include<LINKS.h>
#include<slikamodel.h>
#include<LOCALDATA.h>
#include<Like.h>


class UcitavanjeLokacije : public QObject
{
    Q_OBJECT
   private:
    static MLokacija* lokacija;
    static UcitavanjeLokacije * instance;
    UcitavanjeLokacije()
    {

    }

public:
   // explicit UcitavanjeLokacije(QObject *parent = nullptr);

    static UcitavanjeLokacije & GetInstance()
    {
        if(instance == NULL)
            instance = new UcitavanjeLokacije();
        return *instance;
    }


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

                  Like::setParameters(id,Tip::LokacijaTip);
               }
           }

           return lokacija;

    }

    Q_INVOKABLE
    void dodajKomentar(int idLokacije,QString text)
    {
        if(text.length() > 0 && idLokacije != -1)
        {
            MySqlService &s = MySqlService::MySqlInstance();
            MySqlTable t;
            MyQuery query("INSERT INTO KomentariLokacije (tekstKomentara,idKorisnika,idLokacije) VALUES('%1','%2',%3)");//text, id korisnika, id lokacije
            query<<text<<LOCALDATA::mProfil->getKorisnickoIme()<<idLokacije;
            t = s.WSendQuery(query);
            if(t.isSuccessfully())
            {
                MySqlTable t1;
                t1 = s.WSendQuery("SELECT max(IdKomentara) FROM KomentariLokacije");
                if(t1.isSuccessfully())
                {
                     KomentariModel& kom =  KomentariModel::GetInstance();
                     kom.dodajkomentar(Komentar(LOCALDATA::mProfil->getSlikaURL(),text, LOCALDATA::mProfil->getIme() + " "+ LOCALDATA::mProfil->getPrezime(),t1.Rows[0][0].toInt()));
                }
            }


        }

    }
    Q_INVOKABLE
    void ucitajKomentare(int idLokacije)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        KomentariModel& kom =  KomentariModel::GetInstance();
        MySqlTable t1;
        MyQuery query("SELECT KomentariLokacije.*,Korisnik.ime,Korisnik.prezime,Korisnik.slika  FROM `KomentariLokacije` inner join Korisnik on KomentariLokacije.idKorisnika = Korisnik.korisnickoIme WHERE idLokacije='%1'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
        query<<idLokacije;
         t1 = s.WSendQuery(query);

        if(t1.isSuccessfully())
        {
            kom.removeAll();
            for(int i = 0; i < t1.Count();i++)
            {
                kom.dodajkomentar(Komentar( t1.Rows[i]["slika"].toInt() == 0? LINKS::getProfileDefaultPicture(): LINKS::getProfilePicture(t1.Rows[i]["idKorisnika"]),t1.Rows[i]["tekstKomentara"],t1.Rows[0]["ime"]+" "+ t1.Rows[0]["prezime"],t1.Rows[0]["idKomentara"].toInt()));
            }
        }

    }


};

#endif // UCITAVANJELOKACIJE_H
