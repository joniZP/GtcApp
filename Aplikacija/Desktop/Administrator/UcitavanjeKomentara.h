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
      query = "SELECT * FROM( SELECT ReportKomentar.*, KomentariLokacije.tekstKomentara FROM ReportKomentar inner join KomentariLokacije on ReportKomentar.idKomentara = KomentariLokacije.idKomentara WHERE LokDog=0) as t1 union ALL( SELECT ReportKomentar.*, KomentariDogadjaj.tekstKomentara FROM ReportKomentar inner join KomentariDogadjaj on ReportKomentar.idKomentara = KomentariDogadjaj.idKomentara WHERE LokDog=1)";

      t = s.WSendQuery(query);

      Komentarmodel &kmodel = Komentarmodel::GetInstance();
      kmodel.removeAll();
      if(t.isSuccessfully())
      {
          if(t.Count()>0)
          {
          for(int i=0;i<t.Count();i++)
            {
             kmodel.dodajKomentar(Komentar( t.Rows[i]["idReport"].toInt(),t.Rows[i]["idKomentara"].toInt(), t.Rows[i]["tekstKomentara"], t.Rows[i]["idKorisnika"], t.Rows[i]["LokDog"].toInt(), t.Rows[i]["razlog"], t.Rows[i]["idDogadjaja"].toInt()));
            }
          } //    Komentar( const int &idReport, const int &idkom, const QString &tekst, const QString &username,const int &lokdog,const QString &razlog, const int &idlokdog);

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
