#ifndef LOKACIJA_H
#define LOKACIJA_H
#include <QAbstractListModel>
#include <QStringList>


class Lokacija
{
public:
    Lokacija();
    Lokacija(const QString &naziv,const QString &grad, const QString &opis, int idKorisnika, double ocena,int brojOcena,double x,double y, int brojSlika,int likes);
    QString naziv() const;
    QString grad() const;
    QString opis() const;
    int idKorisnika() const;
    double Ocena() const ;
    int brojOcena() const ;
    double x()const;
    double y()const;
    int brojSlika()const;
    int likes()const;

private:
    QString _naziv;
    QString _grad;
    QString _opis;
    int _idKorisnika;
    double _ocena;
    int _brojOcena;
    double _x;
    double _y;
    int _brojSlika;
    int _likes;

};
#endif // LOKACIJA_H
