#ifndef DOGADJAJ_H
#define DOGADJAJ_H

#include <QAbstractListModel>
#include <QStringList>


class Dogadjaj
{
public:
    Dogadjaj();
   Dogadjaj(const int &idDogadjaja, const int &idLokacije,const QString &vreme,const QString &opis,const QString &tip,const QString &username, const QString razlog);

   int idDogadjaja() const;
    int idLokacije() const;
    QString vreme() const;
    QString opis() const;
    QString tip() const;
    QString username() const;
    QString razlog() const;

private:

   int _idDogadjaja;
    int _idLokacije;
    QString _vreme;
    QString _opis;
    QString _tip;
    QString _username;
    QString _razlog;
};

#endif // DOGADJAJ_H
