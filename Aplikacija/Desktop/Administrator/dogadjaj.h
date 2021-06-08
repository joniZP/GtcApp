#ifndef DOGADJAJ_H
#define DOGADJAJ_H

#include <QAbstractListModel>
#include <QStringList>


class Dogadjaj
{
public:
    Dogadjaj();
   Dogadjaj(const int &idDogadjaja, const int &idLokacije,const QString &vreme,const QString &opis,const QString &tip,const int &idKorisnika);

   int idDogadjaja() const;
    int idLokacije() const;
    QString vreme() const;
    QString opis() const;
    QString tip() const;
    int idKorisnika() const;

private:

   int _idDogadjaja;
    int _idLokacije;
    QString _vreme;
    QString _opis;
    QString _tip;
    int _idKorisnika;
};

#endif // DOGADJAJ_H
