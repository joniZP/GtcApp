#ifndef KOMENTAR_H
#define KOMENTAR_H
#include <QAbstractListModel>
#include <QStringList>

class Komentar
{
public:
    Komentar();
   Komentar(const int &idKomentara, const int &idKorisnika,const QString &tekst,const int &pripada);

   int idKomentara() const;
    int idKorisnika() const;
    QString tekst() const;
    int pripada() const;

private:

   int _idKomentara;
    int _idKorisnika;
    QString _tekst;
    int _pripada;
};

#endif // KOMENTAR_H
