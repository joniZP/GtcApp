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


    static void brisanjeZahteva(QString primalac, QString posiljalac);
    Q_OBJECT
public:
    static int Stanje;
    static QString imeprijatelja;

    explicit PrijateljiEvents(QObject *parent = nullptr);


    Q_INVOKABLE
    static void posaljiZahtev(QString korisnickoimeprijatelja);
    Q_INVOKABLE
    static void izbrisiZahtev(QString korisnickoimeprijatelja);
    Q_INVOKABLE
    static void prihvatiZahtev(QString korisnickoimeprijatelja);
    Q_INVOKABLE
    static void izbrisiPrijatelja(QString korisnickoimeprijatelja);
    Q_INVOKABLE
    void prikaziListuPrijatelja();

    Q_INVOKABLE
    int uzmiStanje(QString korisnickoimeprijatelja);


    Q_INVOKABLE
    void setStanjeByUsername(QString username);


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
