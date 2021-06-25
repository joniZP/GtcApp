#ifndef UCITAVANJELOKACIJE_H
#define UCITAVANJELOKACIJE_H

#include <QObject>
#include <MLokacija.h>
#include <MySqlService.h>
#include<komentarimodel.h>
#include<LINKS.h>
#include<slikamodel.h>
#include<LOCALDATA.h>


class UcitavanjeLokacije : public QObject
{
    Q_OBJECT
   private:
    MLokacija* lokacija;
    bool liked =false;
    QTimer *liketimer;
    UcitavanjeLokacije()
    {
        liketimer = new QTimer(this);
        connect(liketimer, &QTimer::timeout, this, QOverload<>::of(&UcitavanjeLokacije::sacuvajLikeUBazu));
    }

public:
    explicit UcitavanjeLokacije(QObject *parent = nullptr);


    static void sacuvajLikeUBazu(){

        // liketimer->stop();
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

                  liked = isLiked(lokacija->getId());
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
                 KomentariModel& kom =  KomentariModel::GetInstance();
                kom.dodajkomentar(Komentar(LOCALDATA::mProfil->getSlikaURL(),text, LOCALDATA::mProfil->getIme() + " "+ LOCALDATA::mProfil->getPrezime()));
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
                kom.dodajkomentar(Komentar( t1.Rows[i]["slika"].toInt() == 0? LINKS::getProfileDefaultPicture(): LINKS::getProfilePicture(t1.Rows[i]["idKorisnika"]),t1.Rows[i]["tekstKomentara"],t1.Rows[0]["ime"]+" "+ t1.Rows[0]["prezime"]));
            }
        }

    }

    bool isLiked(int idLokacije)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        MyQuery query("SELECT * FROM LokacijaLikes WHERE idLokacije=%1 and idProfila='%2'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
        query<<idLokacije<<LOCALDATA::mProfil->getKorisnickoIme();
         t = s.WSendQuery(query);
        if(t.isSuccessfully())
        {
            return t.Count() > 0;
        }
    }

    Q_INVOKABLE
    QString vratiIkonicu()
    {
        if(liked)
        {
            return "../new/prefix1/like.png";
        }
        else
        {
            return "../new/prefix1/heart.png";
        }
    }

    Q_INVOKABLE
    void clickOnLike()
    {
        liked = !liked;
        liketimer->stop();
        liketimer->start(5000);
    }


    void insertLike(int idLokacije)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query("INSERT INTO LokacijaLikes SET idLokacije=%1, idProfila='%2'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
        query<<idLokacije<<LOCALDATA::mProfil->getKorisnickoIme();
        s.SendQuery(query);
    }

    void deleteLike(int idLokacije)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query("DELETE FROM LokacijaLikes WHERE idLokacije=%1 and idProfila='%2'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
        query<<idLokacije<<LOCALDATA::mProfil->getKorisnickoIme();
        s.SendQuery(query);
    }



};

#endif // UCITAVANJELOKACIJE_H
