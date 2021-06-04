#ifndef UCITAVANJELOKACIJE_H
#define UCITAVANJELOKACIJE_H

#include <QObject>
#include <MLokacija.h>
#include <MySqlKrsta.h>
#include<komentarimodel.h>

class UcitavanjeLokacije : public QObject
{
    Q_OBJECT
   private:
    MLokacija* lokacija;


public:
    explicit UcitavanjeLokacije(QObject *parent = nullptr);

    Q_INVOKABLE

    MLokacija* getLokacija(int id)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        lokacija = NULL;
         MyQuery query("SELECT * FROM Lokacija WHERE Id='%1'");
          query<<id;
           t = s.WSendQuery(query);

           if(t.isSuccessfully())
           {
               if(t.Count()>0)
               {

                   MySqlTable t3;
                   MyQuery query("SELECT * FROM Korisnik WHERE korisnickoIme='%1'");
                    query<<t.Rows[0]["idkorisnika"];

                    qDebug() << query.toStr();
                     t3 = s.WSendQuery(query);
                     if(t3.isSuccessfully())
                  lokacija = new MLokacija(id,t.Rows[0]["idkorisnika"],t3.Rows[0]["ime"] +" " + t3.Rows[0]["prezime"],t.Rows[0]["naziv"],t.Rows[0]["opis"],t.Rows[0]["grad"],t.Rows[0]["likes"].toInt(),t.Rows[0]["x"].toDouble(),t.Rows[0]["y"].toDouble());
               }
           }

           if(lokacija != NULL)
           {

             KomentariModel& kom =  KomentariModel::GetInstance();
             MySqlTable t1;
             MyQuery query("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
             query<<lokacija->id;
              t1 = s.WSendQuery(query);

             if(t1.isSuccessfully())
             {


                 for(int i = 0; i < t1.Count();i++)
                 {
                     MySqlTable t2;
                     MyQuery query("SELECT * FROM Korisnik WHERE korisnickoIme='%1'");
                      query<<t1.Rows[i]["idKorisnika"];

                      qDebug() << query.toStr();
                       t2 = s.WSendQuery(query);
                       if(t2.isSuccessfully())
                       {
                            kom.dodajkomentar(Komentar("http://gtcappservice.000webhostapp.com/GTCAPP/upload/"+lokacija->kreator+".jpeg",t1.Rows[i]["tekstKomentara"],t2.Rows[0]["ime"]+" "+ t2.Rows[0]["prezime"]));
                       }
                 }
             }
           }

           return lokacija;

    }


};

#endif // UCITAVANJELOKACIJE_H
