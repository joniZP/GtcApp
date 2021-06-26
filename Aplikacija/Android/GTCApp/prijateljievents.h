#ifndef PRIJATELJIEVENTS_H
#define PRIJATELJIEVENTS_H

#include <QObject>
#include<MySqlService.h>
#include<LOCALDATA.h>
#include<prijateljimodel.h>
#include<obavestenjamodel.h>

class PrijateljiEvents : public QObject
{
private:


    static void brisanjeZahteva(QString primalac, QString posiljalac)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
                query="DELETE FROM Zahtev WHERE (primalac='%1' and posiljalac='%2') or (primalac='%2' and posiljalac='%1')";//primalac, posiljalac
                query<<primalac<<posiljalac;
           s.SendQuery(query);
           qDebug()<<"BRISE ZAHTEV" << query.toStr();
    }
    Q_OBJECT
public:
    static int Stanje;
    static QString imeprijatelja;

    explicit PrijateljiEvents(QObject *parent = nullptr);


    Q_INVOKABLE
    static void posaljiZahtev(QString korisnickoimeprijatelja)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
                query="INSERT IGNORE INTO Zahtev VALUES('%1','%2',0)";//primalac, posiljalac
                query<<korisnickoimeprijatelja<<LOCALDATA::mProfil->getKorisnickoIme();
           s.SendQuery(query);
           qDebug()<<"Salje ZAHTEV" << query.toStr();
    }
    Q_INVOKABLE
    static void izbrisiZahtev(QString korisnickoimeprijatelja)
    {
        brisanjeZahteva(korisnickoimeprijatelja, LOCALDATA::mProfil->getKorisnickoIme());
    }
    Q_INVOKABLE
    static void prihvatiZahtev(QString korisnickoimeprijatelja)
    {
        brisanjeZahteva(LOCALDATA::mProfil->getKorisnickoIme(),korisnickoimeprijatelja);

        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
                query="INSERT IGNORE INTO Prijatelji VALUES('%1','%2')";//prijatelj1, prijatelj2
                query<<korisnickoimeprijatelja<<LOCALDATA::mProfil->getKorisnickoIme();
           s.SendQuery(query);
           qDebug()<<"prihvata ZAHTEV" << query.toStr();
    }
    Q_INVOKABLE
    static void izbrisiPrijatelja(QString korisnickoimeprijatelja)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
                query="DELETE FROM Prijatelji WHERE (prijatelj1='%1' and prijatelj2='%2') or (prijatelj1='%3' and prijatelj2='%4')";//prijatelj1, prijatelj2
                query<<korisnickoimeprijatelja<<LOCALDATA::mProfil->getKorisnickoIme()<<LOCALDATA::mProfil->getKorisnickoIme()<<korisnickoimeprijatelja;
           s.SendQuery(query);
           qDebug()<<"BRISE Prijatelja" << query.toStr();
    }
    Q_INVOKABLE
    void prikaziListuPrijatelja(){
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        MyQuery query;
                query="SELECT Korisnik.* from Korisnik inner join ((SELECT prijatelj2 as prijatelj from Prijatelji WHERE prijatelj1='%1') UNION (SELECT prijatelj1 as prijatelj from Prijatelji WHERE prijatelj2='%1'))  as KImenaPrijatelja Where Korisnik.korisnickoIme = KImenaPrijatelja.prijatelj";
                query<<LOCALDATA::mProfil->getKorisnickoIme();
              t=s.WSendQuery(query);

              qDebug()<<"SKIDA PODACI" << query.toStr() <<"\n\nCOUNT "<< t.Count();

              if(t.isSuccessfully())
              {
                  PrijateljiModel &pm = PrijateljiModel::GetInstance();
                  pm.removeAll();
                  for(int i = 0;i<t.Count();i++)
                  {
                      pm.dodajPrijatelja(profillistelement(t.Rows[i]["ime"],t.Rows[i]["prezime"],t.Rows[i]["korisnickoIme"],t.Rows[i]["slika"].toInt()));
                  }

              }
    }

    Q_INVOKABLE
    int uzmiStanje(QString korisnickoimeprijatelja)
    {

        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        MyQuery query;
                query="SELECT * from (SELECT count(*) as Prijatelji from Prijatelji WHERE (prijatelj1='%1' and prijatelj2='%2') or (prijatelj1='%2' and prijatelj2='%1'))  as t1, (SELECT count(*) as PoslaoZahtev from Zahtev WHERE posiljalac='%1' and primalac='%2') as t2, (SELECT count(*) as PrimioZahtev from Zahtev WHERE posiljalac='%2' and primalac='%1') as t3 ";
                query<<LOCALDATA::mProfil->getKorisnickoIme()<< korisnickoimeprijatelja;
              t=s.WSendQuery(query);

              qDebug()<<"STANJE: "<< query.toStr();

              if(t.isSuccessfully())
              {
                       if(t.Rows.count() > 0)
                       {
                           if(t.Rows[0]["Prijatelji"].toInt() > 0)
                               return 3;
                           if(t.Rows[0]["PoslaoZahtev"].toInt() > 0)
                               return 2;
                           if(t.Rows[0]["PrimioZahtev"].toInt() > 0)
                               return 1;
                       }
               }

    return 0;
    }


      Q_INVOKABLE
    void setStanjeByUsername(QString username)
    {
        Stanje = uzmiStanje(username);
        imeprijatelja = username;
    }

 /*   Q_INVOKABLE
    QString vratiURLIkonice(QString korisnickoimeprijatelja)
    {
        imeprijatelja = korisnickoimeprijatelja;
        int stanje = uzmiStanje(korisnickoimeprijatelja);
        return getSlikaByStanje(stanje);
    }*/

  /*  Q_INVOKABLE
    QString getSlikaByUsername(QString korisnickoimeprijatelja)
    {
        int stanjeid = uzmiStanje(korisnickoimeprijatelja);
        if(stanjeid == 1)//Primio zahtev, odobri zahtev
        {
            return "/new/prefix1/add-friend.png";
        }
        else if(stanjeid == 2)//Poslat zahtev, ponisti zahtev
        {
            return "/new/prefix1/friends.png";
        }
        else if(stanjeid == 3)//Prijatelji, izbrisi prijatelja
        {
            return "/new/prefix1/friends.png";
        }
        else//dodaj prijatelja
        {
            return "/new/prefix1/add-friend.png";
        }
    }*/


    Q_INVOKABLE
    QString getFriendSlika()
    {
        if(Stanje == 1)//Primio zahtev, odobri zahtev
        {
            return "/new/prefix1/add-friend.png";
        }
        else if(Stanje == 2)//Poslat zahtev, ponisti zahtev
        {
            return "/new/prefix1/remove-user.png";
        }
        else if(Stanje == 3)//Prijatelji, izbrisi prijatelja
        {
            return "/new/prefix1/remove-user.png";
        }
        else//dodaj prijatelja
        {
            return "/new/prefix1/add-friend.png";
        }
    }



    Q_INVOKABLE
    void postaviNovoStanje()
    {
        if(Stanje == 0)
        {
           Stanje = 2;
           posaljiZahtev(imeprijatelja);
        }
        else if(Stanje == 1)
        {
            Stanje=3;
            prihvatiZahtev(imeprijatelja);
        }
        else if(Stanje == 2)
        {
            Stanje = 0;
            izbrisiZahtev(imeprijatelja);
        }
        else if(Stanje == 3)
        {
            Stanje =0;
            izbrisiPrijatelja(imeprijatelja);
        }
    }




signals:

};



#endif // PRIJATELJIEVENTS_H
