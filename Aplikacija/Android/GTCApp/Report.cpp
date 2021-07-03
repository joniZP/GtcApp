#include "Report.h"

void Report::prijaviLokaciju(int idLokacije, QString razlog)
{
    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query("INSERT INTO `ReportLokacija`(username,idLokacija,razlog) VALUES ('%1',%2,'%3')");
    query<<LOCALDATA::mProfil->getKorisnickoIme()<<idLokacije<<razlog;
    s.SendQuery(query);
    //qDebug()<<"|aeqwt"<<query.toStr();
}

void Report::prijaviKomentar(int idkom, QString razlog, int tip)
{
    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query("INSERT INTO `ReportKomentar`(idKomentara,LokDog,username,razlog) VALUES (%1,%2,'%3','%4')");//;0 za lokaciju
    query<<idkom<<tip<<LOCALDATA::mProfil->getKorisnickoIme()<<razlog;
    s.SendQuery(query);
    // qDebug()<<"|aeqwt"<<query.toStr();
}

void Report::prijaviDogadjaj(int idDogadjaja, QString razlog)
{
    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query("INSERT INTO `ReportDogadjaj`(username,idDogadjaj,razlog) VALUES ('%1',%2,'%3')");
    query<<LOCALDATA::mProfil->getKorisnickoIme()<<idDogadjaja<<razlog;
    s.SendQuery(query);
    //qDebug()<<"|aeqwt"<<query.toStr();
}

Report::Report(QObject *parent) : QObject(parent)
{

}

void Report::setParameters(int idEntiteta, int tip)
{
    tipPrijave = tip;
    Report::idEntiteta = idEntiteta;
}

void Report::prijavi(QString razlog)
{
    qDebug()<< razlog<< " ||" << idEntiteta<<" ||"<<tipPrijave;
    switch(Report::tipPrijave)
    {
    case 0: prijaviLokaciju(idEntiteta,razlog); break;
    case 1:prijaviDogadjaj(idEntiteta,razlog); break;
    case 2:prijaviKomentar(idEntiteta,razlog,0); break;
    case 3: prijaviKomentar(idEntiteta,razlog,1); break;
    default: qDebug()<<"Greska ID";break;
    }
}
int Report::idEntiteta = 0;
int Report::tipPrijave = 0;
