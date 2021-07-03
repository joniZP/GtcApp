#ifndef PRETRAGALOKACIJA_H
#define PRETRAGALOKACIJA_H

#include <QObject>
#include <MySqlService.h>
#include<kategorijamodel.h>
#include<mestomodel.h>
#include<LINKS.h>
#include<LokacijaModel.h>
#include<korisnikdogadjajmodel.h>
class PretragaLokacija : public QObject
{
    Q_OBJECT
public:
    explicit PretragaLokacija(QObject *parent = nullptr);
    QStringList gradovi;
    QStringList kategorije;

    KategorijaModel &m=KategorijaModel::GetInstance();
    MestoModel &mesto=MestoModel::GetInstance();
    Q_INVOKABLE
    void reset();
    Q_INVOKABLE
    void pretrazi(QString text, int tip);

    void pretraziLokacije(QString text);

    void pretraziDogadjaje(QString text);


    void getGradoviKategorije();

    Q_INVOKABLE
    void ucitavanjeLokacijaPocetna();


signals:

};

#endif // PRETRAGALOKACIJA_H
