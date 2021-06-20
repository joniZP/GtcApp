#ifndef UCITAVANJEPROFILA_H
#define UCITAVANJEPROFILA_H

#include <QObject>
#include<MProfil.h>
#include<MySqlService.h>
#include<LINKS.h>
#include<korisnikdogadjajmodel.h>
#include<korisniklokacijamodel.h>

class UcitavanjeProfila : public QObject
{
    Q_OBJECT
public:
    explicit UcitavanjeProfila(QObject *parent = nullptr);

    Q_INVOKABLE
    MProfil* getProfil(QString korisnickoime)
    {

        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;

        MProfil *profil = NULL;

         MyQuery query("SELECT * FROM Korisnik WHERE korisnickoIme='%1'");//("SELECT * FROM Lokacija WHERE Id='%1'");
          query<<korisnickoime;
          t = s.WSendQuery(query);

           if(t.isSuccessfully())
           {
               if(t.Count()>0)
               {
                   profil = new MProfil(t.Rows[0]["korisnickoIme"],t.Rows[0]["ime"],t.Rows[0]["prezime"],t.Rows[0]["email"],t.Rows[0]["lozinka"],t.Rows[0]["ocena"].toFloat(),t.Rows[0]["verifikovan"].toInt(),t.Rows[0]["brojOcena"].toInt(),t.Rows[0]["telefon"], t.Rows[0]["slika"].toInt());

                   if(profil->getSlika() == 1)
                   {
                       profil->setSlikaURL(LINKS::getProfilePicture(korisnickoime));
                   }
                   else
                   {
                       profil->setSlikaURL(LINKS::getProfileDefaultPicture());
                   }

                   ucitajLokacijeiDogadjaje(korisnickoime);
               }

            }


        return profil;
    }

    Q_INVOKABLE
    void ucitajLokacijeiDogadjaje(QString korisnickoime)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
        MySqlTable lokacijatable;
        query = "SELECT * FROM Lokacija WHERE idKorisnika='%1'";
        query<<korisnickoime;

        lokacijatable = s.WSendQuery(query);

        if(lokacijatable.isSuccessfully())
        {
            KorisnikLokacijaModel &klmodel = KorisnikLokacijaModel::GetInstance();
            klmodel.removeAll();
            for(int i=0;i<lokacijatable.Count();i++)
            {
               QString slikapom =  (lokacijatable.Rows[i]["brojSlika"].toInt()) > 0 ? LINKS::getLocationPicture(lokacijatable.Rows[i]["id"].toInt(),0) : LINKS::getNoImageAvailable();
                klmodel.dodajlokaciju(lokacija(lokacijatable.Rows[i]["id"].toInt(),slikapom, lokacijatable.Rows[i]["naziv"], lokacijatable.Rows[i]["grad"]));
            }

        }


        MySqlTable dogadjajitable;

        query = "SELECT * FROM Dogadjaj WHERE idKorisnika='%1'";
        query<<korisnickoime;

        dogadjajitable = s.WSendQuery(query);

        if(dogadjajitable.isSuccessfully())
        {
            KorisnikDogadjajModel &kdmodel = KorisnikDogadjajModel::GetInstance();
            kdmodel.removeAll();
            for(int i = 0; i< dogadjajitable.Count();i++)
            {
                kdmodel.dodajdogadjaj(Dogadjaj(dogadjajitable.Rows[i]["idDogadjaja"].toInt(), dogadjajitable.Rows[i]["tip"], dogadjajitable.Rows[i]["vreme"], dogadjajitable.Rows[i]["opis"]));
            }

        }
    }


signals:

};

#endif // UCITAVANJEPROFILA_H
