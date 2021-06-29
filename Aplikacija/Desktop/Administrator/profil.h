#ifndef PROFIL_H
#define PROFIL_H

#include <QAbstractListModel>
#include <QStringList>


class profil
{
public:
    profil();
   profil(const QString &korisnickoime, const QString &ime,const QString &prezime ,const QString &email,const QString &brslika) ;


    QString korisnickoime() const;
    QString ime() const;
    QString prezime() const;
    QString email() const;
    QString brslika() const;

private:



    QString _korisnickoime;
    QString _ime;
    QString _prezime;
    QString _email;
    QString _brslika;
};
#endif // PROFIL_H
