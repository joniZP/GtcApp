#ifndef UCITAVANJEKOMENTARA_H
#define UCITAVANJEKOMENTARA_H

#include <QObject>
#include<MySqlService.h>
#include <komentarmodel.h>
#include<LINKS.h>
#include <komentar.h>
#include <dogadjajmodel.h>

class UcitavanjeKomentara : public QObject
{
    Q_OBJECT
public:
    explicit UcitavanjeKomentara(QObject *parent = nullptr);



    Q_INVOKABLE
  void ucitaj()
  {
      MySqlService &s = MySqlService::MySqlInstance();
      QString query;
      MySqlTable t;
      query = "SELECT * FROM KomentariDogadjaj INNER JOIN ReportKomentar ON KomentariDogadjaj.idKomentara = ReportKomentar.idKomentara where LokDog=false ";

      t = s.WSendQuery(query);

      Komentarmodel &kmodel = Komentarmodel::GetInstance();
      kmodel.removeAll();
      if(t.isSuccessfully())
      {
          if(t.Count()>0)
          {
          for(int i=0;i<t.Count();i++)
            {
             kmodel.dodajKomentar(Komentar( t.Rows[i]["idReport"].toInt(),t.Rows[i][0].toInt(), t.Rows[i]["tekstKomentara"], t.Rows[i]["idKorisnika"], 0, t.Rows[i]["razlog"], t.Rows[i]["idDogadjaja"].toInt()));
            }
          }
      }


      query = "SELECT KomentariLokacije.*, ReportKomentar.idReport, ReportKomentar.LokDog,ReportKomentar.username,ReportKomentar.razlog FROM KomentariLokacije INNER JOIN ReportKomentar ON KomentariLokacije.idKomentara=ReportKomentar.idKomentara where LokDog=true";

      t = s.WSendQuery(query);

      if(t.isSuccessfully())
      {
          if(t.Count()>0)
          {
          //  qDebug() << "kveri:" << t.Count();

            for(int i=0;i<t.Count();i++)
             {
                qDebug() << "IDKOMENTARA  :   " <<t.Rows[i]["razlog"];
             kmodel.dodajKomentar(Komentar(t.Rows[i]["idReport"].toInt(),t.Rows[i]["idKomentara"].toInt(), t.Rows[i]["tekstKomentara"], t.Rows[i]["idKorisnika"], 1, t.Rows[i]["razlog"], t.Rows[i]["idLokacije"].toInt()));
            }
          }
      }
  }
  QString getlokdog(int a)
  {
      if(a==0)
      {
          return "Dogadjaj";
      }
      else
      {
          return "Lokacija";
      }
  }
};
#endif // UCITAVANJEKOMENTARA_H
