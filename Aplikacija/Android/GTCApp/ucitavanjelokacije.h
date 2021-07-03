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
#include<mestomodel.h>
#include<kategorijamodel.h>


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

    static UcitavanjeLokacije & GetInstance();


    Q_INVOKABLE
    MLokacija* getLokacija(int id);
    Q_INVOKABLE
    void dodajKomentar(int idLokacije,QString text);
    Q_INVOKABLE
    void ucitajKomentare(int idLokacije);
    Q_INVOKABLE
    void ucitajKategorije();
    Q_INVOKABLE
    void ucitajGradove();


};

#endif // UCITAVANJELOKACIJE_H
