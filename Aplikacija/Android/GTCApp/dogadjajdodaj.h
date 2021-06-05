#ifndef DOGADJAJDODAJ_H
#define DOGADJAJDODAJ_H

#include <QObject>
#include <QQuickItem>

class DogadjajDodaj : public QObject
{
    Q_OBJECT
    static DogadjajDodaj* instance;
    DogadjajDodaj();
public:
    //explicit DogadjajDodaj(QObject *parent = nullptr);

    static DogadjajDodaj& GetInstance();

    Q_INVOKABLE QString gettip(){return tip;};
   Q_INVOKABLE void settip(QString a){this->tip=a;};

    Q_INVOKABLE QString getopis(){return opis;};
   Q_INVOKABLE void setopis(QString a){this->opis=a;};

    Q_INVOKABLE QString getvreme(){return vreme;};
   Q_INVOKABLE void setvreme(QString a){this->vreme=a;};

    Q_INVOKABLE QString getidlokacije(){return idlokacije;};
   Q_INVOKABLE void setidlokacije(QString a){this->idlokacije=a;};

    Q_INVOKABLE QString getidkorisnika(){return idkorisnika;};
   Q_INVOKABLE void setidkorisnika(QString a){this->idkorisnika=a;};

private:
    QString tip;
    QString opis;
    QString vreme;
    QString idkorisnika;
    QString idlokacije;

signals:

};

#endif // DOGADJAJDODAJ_H
