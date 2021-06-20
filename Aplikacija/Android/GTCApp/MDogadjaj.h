
#ifndef MDOGADJAJ_H
#define MDOGADJAJ_H


#include <QObject>

class MDogadjaj:public QObject
{
    Q_OBJECT


public:

    int id;
    int idLokacije;
    int idKorisnika;
    QString vreme;
    QString opis;
    QString tip;
    int like;

 MDogadjaj(QObject *parent = nullptr){

    }
    Q_INVOKABLE
    int getId() const
    {
        return id;
    }
 Q_INVOKABLE
    int getIdLokacije () const
    {
        return idLokacije;
    }
     Q_INVOKABLE
    int getIdKorisnika() const
    {
        return idKorisnika;
    }
     Q_INVOKABLE
    QString getVreme() const
    {
        return vreme;
    }
     Q_INVOKABLE
    QString getOpis() const
    {
        return opis;
    }
    Q_INVOKABLE
   QString getTip() const
   {
       return tip;
   }
    Q_INVOKABLE
   int getLike()
   {
       return like;
   }




    MDogadjaj(int id, int idLokacije,int idKorisnika,QString opis,int svidjanja,QString tip,QString vreme)
    {
        this->id=id;
        this->idLokacije = idLokacije;
        this->idKorisnika= idKorisnika;
        this->like=svidjanja;
        this->tip=tip;
        this->opis = opis;
        this->vreme = vreme;
    }
};


#endif // MDOGADJAJ_H
