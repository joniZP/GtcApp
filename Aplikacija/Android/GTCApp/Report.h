#ifndef REPORT_H
#define REPORT_H

#include <QObject>
#include<MySqlService.h>
#include<LOCALDATA.h>

class Report : public QObject
{
    Q_OBJECT
private:
    static int tipPrijave;
    static int idEntiteta;


    static void prijaviLokaciju(int idLokacije, QString razlog);
    static void prijaviKomentar(int idkom,QString razlog, int tip);
    static void prijaviDogadjaj(int idDogadjaja, QString razlog);



public:
    explicit Report(QObject *parent = nullptr);

    Q_INVOKABLE
   static void setParameters(int idEntiteta, int tip);
   Q_INVOKABLE
   static void prijavi(QString razlog);




signals:

};

#endif // REPORT_H
