#ifndef MLOKACIJA_H
#define MLOKACIJA_H

#include <QObject>

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
    int like;
    double xcoo;
    double ycoo;
    int brSlika;


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
 void setIme(QString ime)
  {
      this->naziv=ime;
  }



    MLokacija(int id, QString kreator,QString punoime,QString naziv,QString opis,QString grad,int like, double xcoo,double ycoo)
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
    }
    void setId(int value);
    void setKreator(const QString &value);
    void setOpis(const QString &value);
    void setGrad(const QString &value);
    int getBrSlika() const;
    void setBrSlika(int value);
};

#endif // MLOKACIJA_H
