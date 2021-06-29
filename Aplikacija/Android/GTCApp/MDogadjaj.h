
#ifndef MDOGADJAJ_H
#define MDOGADJAJ_H

#include<MLokacija.h>
#include <QObject>

class MDogadjaj:public QObject
{
    Q_OBJECT


public:

    int id;
    int idLokacije;
    QString idKorisnika;
    QString imeKorisnika;
    QString vreme;
    QString opis;
    QString tip;
    int like;
    MLokacija *lokacija;

    MDogadjaj(QObject *parent = nullptr){
    lokacija = new MLokacija();
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
    QString getIdKorisnika() const
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
    Q_INVOKABLE
   MLokacija* getLokacija()
   {
    return lokacija;
   }





    MDogadjaj(int id, int idLokacije,QString idKorisnika,QString opis,int svidjanja,QString tip,QString vreme)
    {
        this->id=id;
        this->idLokacije = idLokacije;
        this->idKorisnika= idKorisnika;
        this->like=svidjanja;
        this->tip=tip;
        this->opis = opis;
        this->vreme = vreme;
        lokacija = new MLokacija();
    }
    Q_INVOKABLE
    QString getImeKorisnika(){
        return imeKorisnika;
    }
    void setImeKorisnika(const QString &value)
    {
        imeKorisnika = value;
    }
    void setLike(int value);
};

inline void MDogadjaj::setLike(int value)
{
    like = value;
}



#endif // MDOGADJAJ_H
