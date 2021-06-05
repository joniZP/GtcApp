#ifndef LOKACIJADODAJ_H
#define LOKACIJADODAJ_H
#include <QStringList>
#include <QAbstractListModel>
#include <QObject>
#include <QObject>
#include<qquickview.h>
#include<qquickitem.h>
#include<qqmlengine.h>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QSqlDatabase>
#include<QtSql>
#include<qlist.h>
#include <QFile>
#include <string>
#include <QHttpMultiPart>
#include <QLoggingCategory>
#include <QTextStream>

class lokacijaDodaj: public QObject
{
    Q_OBJECT

    static lokacijaDodaj* instance;
    lokacijaDodaj();

    public:


   // explicit lokacijaDodaj(QObject *parent = nullptr);
    static lokacijaDodaj& GetInstance();


    Q_INVOKABLE QString getnaziv(){return naziv;};
   Q_INVOKABLE void setnaziv(QString a){this->naziv=a;};

    Q_INVOKABLE QString getgrad(){return grad;};
   Q_INVOKABLE void setgrad(QString a){this->grad=a;};

    Q_INVOKABLE QString getopis(){return opis;};
   Q_INVOKABLE void setopis(QString a){this->opis=a;};

    Q_INVOKABLE QString getsliku(int a){return listaslika[a];};
   Q_INVOKABLE void dodajsliku(QString a){listaslika.append(a);};

    Q_INVOKABLE QString getkorisnikid(){return idkorisnika;};
   Q_INVOKABLE void setkorisnikid(QString a){this->idkorisnika=a;};

    Q_INVOKABLE QString getkoordinatnasirina(){return koordinatnasirina;};
   Q_INVOKABLE void setkoordinatnasirina(QString a){this->koordinatnasirina=a;};

    Q_INVOKABLE QString getkoordinatnaduzina(){return koordinatnaduzina;};
   Q_INVOKABLE void setkoordinatnaduzina(QString a){this->koordinatnaduzina=a;};

    Q_INVOKABLE QString getbrojslika(){return (QString)(listaslika.count()) ;};



    //lokacijaDodaj(const QString &naziv, const QString &grad,const QString &opis);
private:
    QString naziv;
    QString grad;
    QString opis;
    QString idkorisnika;
    QString koordinatnasirina;
    QString koordinatnaduzina;
    QList<QString> listaslika;

signals:
};

#endif // LOKACIJADODAJ_H
