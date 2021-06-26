#ifndef UCITAVANJEDOGADJAJA_H
#define UCITAVANJEDOGADJAJA_H
#include <QObject>
#include<MySqlService.h>
#include<lokacijaModel.h>
#include<LINKS.h>
#include<slikaModel.h>
#include <lokacija.h>
#include <dogadjaj.h>
#include <dogadjajmodel.h>



class UcitavanjeDogadjaja : public QObject
{
    Q_OBJECT
public:
    explicit UcitavanjeDogadjaja(QObject *parent = nullptr);



    Q_INVOKABLE
  void ucitaj()
  {
      MySqlService &s = MySqlService::MySqlInstance();
      QString query;
      MySqlTable t;
      query = "SELECT * FROM Dogadjaj INNER JOIN ReportDogadjaj ON Dogadjaj.idDogadjaja = ReportDogadjaj.idDogadjaj ";


      t = s.WSendQuery(query);

      if(t.isSuccessfully())
      {
          if(t.Count()>0)
          {
          //  qDebug() << "kveri:" << t.Count();
          Dogadjajmodel &dmodel = Dogadjajmodel::GetInstance();
          dmodel.removeAll();
          for(int i=0;i<t.Count();i++)
          {
              /*QString slikapom =  (t.Rows[i]["brojSlika"].toInt()) > 0 ? LINKS::getLocationPicture(t.Rows[i]["id"].toInt(),0) : LINKS::getNoImageAvailable();
              qDebug() << slikapom;*/

              dmodel.dodajDogadjaj(Dogadjaj(t.Rows[i]["idDogadjaja"].toInt(), t.Rows[i]["idLokacije"].toInt(), t.Rows[i]["vreme"], t.Rows[i]["opis"], t.Rows[i]["tip"], t.Rows[i]["idKorisnika"], t.Rows[i]["razlog"]));
           }
          }
      }
  }
};
#endif // UCITAVANJEDOGADJAJA_H
