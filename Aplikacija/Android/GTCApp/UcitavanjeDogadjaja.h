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
         static int brprijava;
         static bool prijavljen;
         static bool loadPrijavljen;
         static QTimer *prijavljentimer;
         UcitavanjeDogadjaja();


public:
   // explicit UcitavanjeDogadjaja(QObject *parent = nullptr);
         static UcitavanjeDogadjaja & GetInstance();

         Q_INVOKABLE
         MDogadjaj* getDogadjaj(int id);

         Q_INVOKABLE
         QString getKorisnikSlika();

         Q_INVOKABLE
         QString getLokacijaSlika();

         Q_INVOKABLE
         void dodajKomentar(int idDogadjaja,QString text);

         Q_INVOKABLE
         void ucitajKomentare(int idDogadjaja);


        static void sacuvajPrijavuUBazu();
        static void insertPrijava();
        static void deletePrijava();
        static bool loadStatus();

        Q_INVOKABLE
        static bool isPrijavljen();

        Q_INVOKABLE
        static int getBrPrijava();

        Q_INVOKABLE
        static void clickOnPrijava();

signals:

};

#endif // UCITAVANJEDOGADJAJA_H
