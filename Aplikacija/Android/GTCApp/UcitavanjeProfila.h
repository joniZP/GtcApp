#ifndef UCITAVANJEPROFILA_H
#define UCITAVANJEPROFILA_H

#include <QObject>
#include<MProfil.h>
#include<MySqlService.h>
#include<LINKS.h>
#include<korisnikdogadjajmodel.h>
#include<korisniklokacijamodel.h>
#include<LOCALDATA.h>

class UcitavanjeProfila : public QObject
{
    Q_OBJECT
private:
    static int ocena;
    static bool ocenio;
    static int loadOcena;
    static int prvaocena;
    static QTimer *ocenatimer;
    static MProfil *profil;
public:

    UcitavanjeProfila()
    {
        ocenatimer = new QTimer(this);
        connect(ocenatimer, &QTimer::timeout, this, QOverload<>::of(&UcitavanjeProfila::sacuvajOcenuUBazu));
    }
    Q_INVOKABLE
    MProfil* getProfil(QString korisnickoime)
    {

        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;

        MyQuery query("SELECT Korisnik.*,(SELECT ocena from KorisnikOcene WHERE ocenio='%1' and ocenjen='%2') as ocenio, (SELECT AVG(ocena) from KorisnikOcene WHERE ocenjen='%2') as prosecnaocena,(SELECT count(*) from KorisnikOcene WHERE ocenjen='%2') as brojocena  FROM Korisnik WHERE korisnickoIme='%2'");//("SELECT * FROM Lokacija WHERE Id='%1'");
        query<<LOCALDATA::mProfil->getKorisnickoIme()<<korisnickoime;
          t = s.WSendQuery(query);

           if(t.isSuccessfully())
           {
               if(t.Count()>0)
               {
                   profil = new MProfil(t.Rows[0]["korisnickoIme"],t.Rows[0]["ime"],t.Rows[0]["prezime"],t.Rows[0]["email"],t.Rows[0]["lozinka"],t.Rows[0]["prosecnaocena"]=="NULL"?0:t.Rows[0]["prosecnaocena"].toFloat(),t.Rows[0]["verifikovan"].toInt(),t.Rows[0]["brojocena"].toInt(),t.Rows[0]["telefon"], t.Rows[0]["slika"].toInt());
                   if(profil->getSlika() == 1)
                   {
                       profil->setSlikaURL(LINKS::getProfilePicture(korisnickoime));
                   }
                   else
                   {
                       profil->setSlikaURL(LINKS::getProfileDefaultPicture());
                   }
                   loadOcena = t.Rows[0]["ocenio"]==""? -1: t.Rows[0]["ocenio"].toInt();
                  // qDebug()<<"dsfgvergertgh"<<t.Rows[0]["ocenio"];
                   ocenio=t.Rows[0]["ocenio"]==""? false:true;
                   ocena = loadOcena;
                   prvaocena=ocena;
                   ucitajLokacijeiDogadjaje(korisnickoime);

               }
            }
        return profil;
    }
     Q_INVOKABLE
    QString ocenjen()
     {
        if(ocenio==false)
        {
            qDebug()<<profil->getOcena();
              qDebug()<<profil->getBrojOcena();
                qDebug()<<ocena;

            return QString::number((profil->getOcena()*profil->getBrojOcena()+ocena)/(profil->getBrojOcena()+1));

        }
        else
        {
            return QString::number((profil->getOcena()*profil->getBrojOcena()-prvaocena+ocena)/(profil->getBrojOcena()));
        }
     }

    Q_INVOKABLE
    void ucitajLokacijeiDogadjaje(QString korisnickoime)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
        MySqlTable lokacijatable;
        query = "SELECT * FROM Lokacija WHERE idKorisnika='%1' and Verifikovana=1";
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
    static void sacuvajOcenuUBazu(){
              ocenatimer->stop();
             if(ocena != loadOcena)
             {
                  loadOcena = ocena;
                  insertOrUpdateOcena();
             }
        }
        Q_INVOKABLE
        static int vratiOcenu()
        {
            return ocena;
        }

        Q_INVOKABLE
        static void clickOnOcena(int o)
        {
            ocena = o;
            ocenatimer->stop();
            ocenatimer->start(2000);
        }



        static void insertOrUpdateOcena()
        {
            MySqlService &s = MySqlService::MySqlInstance();
            MyQuery query("INSERT INTO KorisnikOcene VALUES('%1','%2','%3') ON DUPLICATE KEY UPDATE ocena='%3'");
            query<<LOCALDATA::mProfil->getKorisnickoIme()<<profil->getKorisnickoIme()<<ocena;
            s.SendQuery(query);
        }

signals:

};

#endif // UCITAVANJEPROFILA_H
