#ifndef UCITAVANJEPROFILA_H
#define UCITAVANJEPROFILA_H

#include <QObject>
#include<MySqlService.h>
#include <profilmodel.h>
#include<LINKS.h>
#include <profil.h>

class ucitavanjeprofila : public QObject
{
    Q_OBJECT
public:
    explicit ucitavanjeprofila(QObject *parent = nullptr);


    Q_INVOKABLE
  void ucitaj(QString korisnickoime)
  {
      MySqlService &s = MySqlService::MySqlInstance();
      QString query;
      MySqlTable t;
      query = "SELECT * FROM Korisnik where korisnickoIme like '%"+korisnickoime+"%'  ";

      t = s.WSendQuery(query);

      profilModel &pmodel = profilModel::GetInstance();
      pmodel.removeAll();
      if(t.isSuccessfully())
      {
          if(t.Count()>0)
          {
          for(int i=0;i<t.Count();i++)
            {
              QString slikapom =  (t.Rows[i]["slika"].toInt()) > 0 ? LINKS::getProfilePicture(t.Rows[i]["korisnickoIme"]) : LINKS::getProfileDefaultPicture();

             pmodel.dodajprofil(profil( t.Rows[i]["korisnickoIme"], t.Rows[i]["ime"], t.Rows[i]["prezime"], t.Rows[i]["email"], slikapom));
             qDebug()<<pmodel.vratikor();
            }
          }
      }
  }

};

#endif // UCITAVANJEPROFILA_H
