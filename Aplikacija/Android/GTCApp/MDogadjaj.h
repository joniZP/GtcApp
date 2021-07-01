
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
    int brKomentara;
    MLokacija *lokacija;
    QDateTime dt;
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
  int getDay()
  {
      return dt.date().day();
  }
  Q_INVOKABLE
 int getMonth()
 {
     return dt.date().month();
 }
 Q_INVOKABLE
int getMinute()
{
    return dt.time().minute();
}
Q_INVOKABLE
int getHour()
{
   return dt.time().hour();
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
        dt=QDateTime::fromString(vreme,"yyyy-MM-dd hh:mm:ss");
        int a=dt.date().month();
        qDebug()<<"datum "<< QString::number(a);
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


    Q_INVOKABLE
    QString getBrKomentaraString(int b)
    {
        int br=0;
        if(b!=0)
        {
           KomentariModel &k=KomentariModel::GetInstance();
           br=k.getBrKom();
        }
        else
        {
            br=getBrKomentara();
        }
        if(br==1)
        {
            return QString::number(br)+" komentar";
        }
        else if(br>9)
        {
            int d=br%10;
            int p=(br/10)%10;
            if(d==1&&p!=1)
            {
                return QString::number(br)+" komentar";
            }
        }
        return QString::number(br)+" komentara";
    }


    Q_INVOKABLE
   QString getBrLajkaString(int b)
   {
       like+=b;
       return QString::number(like);
   }
    int getBrKomentara() const;
    void setBrKomentara(int value);
};

inline int MDogadjaj::getBrKomentara() const
{
    return brKomentara;
}

inline void MDogadjaj::setBrKomentara(int value)
{
    brKomentara = value;
}

inline void MDogadjaj::setLike(int value)
{
    like = value;
}



#endif // MDOGADJAJ_H
