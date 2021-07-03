#ifndef UPISLOKACIJADOGADJAJ_H
#define UPISLOKACIJADOGADJAJ_H

#include <QObject>
#include<MySqlService.h>
#include<LOCALDATA.h>
#include<FileUploader.h>

class UpisLokacijaDogadjaj : public QObject
{
    Q_OBJECT
public:
   // explicit UpisLokacijaDogadjaj(QObject *parent = nullptr);

    QStringList slike;
    double xcoo = 0;
    double ycoo= 0;

    Q_INVOKABLE
    int upisiLokaciju(QString naziv,QString kategorija, QString grad,QString opis);
    Q_INVOKABLE
    void dodajSliku(QString url);
    Q_INVOKABLE
    void setCoo(double x, double y);

    Q_INVOKABLE
    void removeAllPictrures();


    Q_INVOKABLE
    int azurirajDogadjaj(int idDogadjaja, QString vreme, QString opis, QString tip);

    Q_INVOKABLE
    void obrisiDogadjaj(int idDogadjaja);

    Q_INVOKABLE
    int upisiDogadjaj(int idLokacije, QString vreme, QString opis, QString tip);

    Q_INVOKABLE
    QString formatDate(int mesec,int dan, int sat, int minut);


signals:

};



#endif // UPISLOKACIJADOGADJAJ_H
