#ifndef LOCALDATA_H
#define LOCALDATA_H

#include <QObject>
#include<MySqlService.h>
#include<LINKS.h>
#include<MProfil.h>
using namespace std;

class LOCALDATA : public QObject
{
     Q_OBJECT
private:

    static LOCALDATA* instance;

public:
    static bool ulogovan;
   /* static QString ime;
    static QString prezime;
    static QString korisnickoime;
    static QString slika;
    static QString sifra;
    static QString email;

    static float ocena;*/
    static MProfil *mProfil;
    static int brobavestenja;



    LOCALDATA()
    {

        QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("LOCALDB.sqlite");

        if(db.open())
        {
            QSqlQuery sqlquery;
            if(!sqlquery.exec("SELECT * FROM LocalData"))
            {
                  qDebug()<<"\n\nSQLITE ERROR: "<< sqlquery.lastError().text();
            }

            sqlquery.next();

            if(sqlquery.value(1).toInt() == 1)
            {
                ulogovan = true;

                MySqlService &s = MySqlService::MySqlInstance();
                MySqlTable t;
                QString q="SELECT * FROM Korisnik WHERE korisnickoIme='"+sqlquery.value(2).toString()+"'";
                   t = s.WSendQuery(q);
                   if(t.isSuccessfully())
                   {
                   if(t.Count()>0)
                     {
                       mProfil->setIme(t.Rows[0]["ime"]);
                       mProfil->setKorisnickoIme(t.Rows[0]["korisnickoIme"]);
                       mProfil->setPrezime(t.Rows[0]["prezime"]);
                       mProfil->setLozinka( t.Rows[0]["lozinka"]);
                       mProfil->setEmail( t.Rows[0]["email"]);
                       mProfil->setOcena(t.Rows[0]["ocena"].toFloat());

                       if(t.Rows[0]["slika"].toInt() == 1)
                           mProfil->setSlikaURL(LINKS::getProfilePicture(mProfil->getKorisnickoIme()));
                       else
                           mProfil->setSlikaURL(LINKS::getProfileDefaultPicture());
                   }
                   }

            }


        }


    }
    Q_INVOKABLE
    bool getUlogovan()
    {
        return ulogovan;
    }
    Q_INVOKABLE
    int getBrObavestenja()
    {
        return brobavestenja;
    }
    Q_INVOKABLE
    MProfil* getMProfil()
    {
        return LOCALDATA::mProfil;
    }

   // LOCALDATA& getInstance(){
   //     if(instance == NULL)
     //   {
    //        instance = new LOCALDATA();
//        }
   //     return *instance;
  //  }



signals:

};

#endif // LOCALDATA_H
