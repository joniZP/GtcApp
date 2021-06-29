#ifndef UCITAVANJEDOGADJAJA_H
#define UCITAVANJEDOGADJAJA_H

#include <QObject>
#include <MySqlService.h>
#include<komentarimodel.h>
#include<LINKS.h>
#include<LOCALDATA.h>
#include<MDogadjaj.h>
#include<Like.h>

class UcitavanjeDogadjaja : public QObject
{
    Q_OBJECT

        private:
         static MDogadjaj* dogadjaj;
         static UcitavanjeDogadjaja * instance;
         static int brslika;
         UcitavanjeDogadjaja()
         {
            // connect(liketimer, &QTimer::timeout, this, QOverload<>::of(&UcitavanjeLokacije::sacuvajLikeUBazu));
         }


public:
   // explicit UcitavanjeDogadjaja(QObject *parent = nullptr);
         static UcitavanjeDogadjaja & GetInstance()
         {
             if(instance == NULL)
                 instance = new UcitavanjeDogadjaja();
             return *instance;
         }

         Q_INVOKABLE
         MDogadjaj* getDogadjaj(int id)
         {
             MySqlService &s = MySqlService::MySqlInstance();
             MySqlTable t;
             dogadjaj = NULL;
              MyQuery query("SELECT Dogadjaj.*,Lokacija.naziv,Lokacija.grad,Lokacija.brojSlika,Korisnik.ime,Korisnik.prezime,Korisnik.slika from Dogadjaj INNER JOIN Lokacija on Dogadjaj.idLokacije=Lokacija.id INNER join Korisnik on Dogadjaj.idKorisnika = Korisnik.korisnickoIme WHERE idDogadjaja=%1");
               query<<id;
                t = s.WSendQuery(query);

                if(t.isSuccessfully())
                {
                    if(t.Count()>0)
                    {
                       dogadjaj = new MDogadjaj(id,t.Rows[0]["idLokacije"].toInt(),t.Rows[0]["idKorisnika"],t.Rows[0]["opis"],t.Rows[0]["svidjanja"].toInt(),t.Rows[0]["tip"],t.Rows[0]["vreme"]);
                       dogadjaj->lokacija->setIme(t.Rows[0]["naziv"]);
                       dogadjaj->lokacija->setGrad(t.Rows[0]["grad"]);
                       dogadjaj->lokacija->setBrSlika(t.Rows[0]["brojSlika"].toInt());
                       dogadjaj->setImeKorisnika(t.Rows[0]["ime"]+" "+t.Rows[0]["prezime"]);
                        brslika = t.Rows[0]["slika"].toInt();

                       Like::setParameters(id,Tip::DogadjajTip);
                    }
                }

                return dogadjaj;

         }

         Q_INVOKABLE
         QString getKorisnikSlika()
         {
             if(brslika == 0)
                 return LINKS::getProfileDefaultPicture();
             else
                 return LINKS::getProfilePicture(dogadjaj->getIdKorisnika());
         }

         Q_INVOKABLE
         QString getLokacijaSlika()
         {
             if(dogadjaj->lokacija->getBrSlika() > 0)
             {
                 return LINKS::getLocationPicture(dogadjaj->getIdLokacije(),0);
             }
             else
             {
                 return LINKS::getNoImageAvailable();
             }

         }


         Q_INVOKABLE
         void dodajKomentar(int idDogadjaja,QString text)
         {
             if(text.length() > 0 && idDogadjaja != -1)
             {
                 MySqlService &s = MySqlService::MySqlInstance();
                 MySqlTable t;
                 MyQuery query("INSERT INTO KomentariDogadjaj (tekstKomentara,idKorisnika,idDogadjaja) VALUES('%1','%2',%3)");//text, id korisnika, id lokacije
                 query<<text<<LOCALDATA::mProfil->getKorisnickoIme()<<idDogadjaja;

                 t = s.WSendQuery(query);
                 if(t.isSuccessfully())
                 {
                     MySqlTable t1;
                     t1 = s.WSendQuery("SELECT max(IdKomentara) FROM KomentariDogadjaj");
                     if(t1.isSuccessfully())
                     {
                          KomentariModel& kom =  KomentariModel::GetInstance();
                          kom.dodajkomentar(Komentar(LOCALDATA::mProfil->getSlikaURL(),text, LOCALDATA::mProfil->getIme() + " "+ LOCALDATA::mProfil->getPrezime(),t1.Rows[0][0].toInt()));
                     }
                 }


             }

         }
         Q_INVOKABLE
         void ucitajKomentare(int idDogadjaja)
         {
             MySqlService &s = MySqlService::MySqlInstance();
             KomentariModel& kom =  KomentariModel::GetInstance();
             MySqlTable t1;
             MyQuery query("SELECT KomentariDogadjaj.*,Korisnik.ime,Korisnik.prezime,Korisnik.slika  FROM `KomentariDogadjaj` inner join Korisnik on KomentariDogadjaj.idKorisnika = Korisnik.korisnickoIme WHERE idDogadjaja='%1'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
             query<<idDogadjaja;
              t1 = s.WSendQuery(query);

             if(t1.isSuccessfully())
             {
                 kom.removeAll();
                 for(int i = 0; i < t1.Count();i++)
                 {
                     kom.dodajkomentar(Komentar( t1.Rows[i]["slika"].toInt() == 0? LINKS::getProfileDefaultPicture(): LINKS::getProfilePicture(t1.Rows[i]["idKorisnika"]),t1.Rows[i]["tekstKomentara"],t1.Rows[i]["ime"]+" "+ t1.Rows[i]["prezime"],t1.Rows[i]["idKomentara"].toInt()));
                 }
             }

         }



signals:

};

#endif // UCITAVANJEDOGADJAJA_H
