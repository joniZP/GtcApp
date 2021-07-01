#ifndef MLOKACIJA_H
#define MLOKACIJA_H

#include <QObject>
#include<komentarimodel.h>

class MLokacija:public QObject
{
    Q_OBJECT


public:

    int id;
    QString kreator;
    QString naziv;
    QString opis;
    QString grad;
    QString punoime;
    QString kategorija;
    int like;
    double xcoo;
    double ycoo;
    int brSlika;
    int brKomentara;


    explicit MLokacija(QObject *parent = nullptr){

    }
    Q_INVOKABLE
    int getId() const
    {
        return id;
    }
    Q_INVOKABLE
    QString getKreator() const
    {
        return kreator;
    }
    Q_INVOKABLE
    QString getNaziv() const
    {
        return naziv;
    }
     Q_INVOKABLE
    QString getOpis() const
    {
        return opis;
    }
     Q_INVOKABLE
    QString getGrad() const
    {
        return grad;
    }
     Q_INVOKABLE
    int getLikes() const
    {
        return like;
    }
     Q_INVOKABLE
    double getX() const
    {
        return xcoo;
    }
     Q_INVOKABLE
    double getY() const
    {
        return ycoo;
    }
    Q_INVOKABLE
   QString getSlika() const
   {
       return "http://gtcappservice.000webhostapp.com/GTCAPP/upload/"+kreator+".jpeg";
   }
    Q_INVOKABLE
   QString getPunoIme()
   {
       return punoime;
   }
   Q_INVOKABLE
   QString getKategorija()
   {
       return kategorija;
   }

   Q_INVOKABLE
 void setIme(QString ime)
  {
      this->naziv=ime;
  }



    MLokacija(int id, QString kreator,QString punoime,QString naziv,QString opis,QString grad,int like, double xcoo,double ycoo,QString kategorija)
    {
        this->grad=grad;
        this->id = id;
        this->kreator = kreator;
        this->like=like;
        this->naziv=naziv;
        this->opis = opis;
        this->xcoo=xcoo;
        this->ycoo = ycoo;
        this->punoime = punoime;
        this->kategorija=kategorija;
    }
    void setId(int value);
    void setKreator(const QString &value);
    void setKategorija(const QString &value);
    void setOpis(const QString &value);
    void setGrad(const QString &value);
    int  getBrSlika() const;
    void setBrSlika(int value);
    void setLike(int value);
    int getBrKomentara() const;
    void setBrKomentara(int value);
     Q_INVOKABLE
    QString getBrLajkaString(int b)
    {
        like+=b;
        return QString::number(like);
    }

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
};

#endif // MLOKACIJA_H
