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

    UcitavanjeProfila();
    Q_INVOKABLE
    MProfil* getProfil(QString korisnickoime);
    Q_INVOKABLE
    QString ocenjen();

    Q_INVOKABLE
    void ucitajLokacijeiDogadjaje(QString korisnickoime);
    static void sacuvajOcenuUBazu();
    Q_INVOKABLE
    static int vratiOcenu();
    Q_INVOKABLE
    static void clickOnOcena(int o);
    static void insertOrUpdateOcena();

signals:

};

#endif // UCITAVANJEPROFILA_H
