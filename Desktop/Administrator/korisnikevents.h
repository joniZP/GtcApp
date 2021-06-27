#ifndef KORISNIKEVENTS_H
#define KORISNIKEVENTS_H
#include<MySqlService.h>
#include<EmailVerificator.h>
#include <QObject>
#include<LOCALDATA.h>
#include<LINKS.h>
//#include<FileUploader.h>

class KorisnikEvents : public QObject
{
    Q_OBJECT
public:
    explicit KorisnikEvents(QObject *parent = nullptr);
   // MProfil* mProfil;


    Q_INVOKABLE
    bool registracija(QString ime,QString prezime,QString korisnickoime,QString email,QString sifra)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        MyQuery query;

        QString qu="SELECT * FROM Administrator WHERE email='"+email+"'";

        t = s.WSendQuery(qu);
        if(t.isSuccessfully())
        {
        if(t.Count()>0)
        {
            return false;
        }
        else
        {

            query="INSERT INTO Administrator VALUES('%1','%2','%3','%4','%5')";
            query<<korisnickoime<<ime<<prezime<<email<<sifra;

            QString q="SELECT * FROM Administrator WHERE korisnickoIme='"+korisnickoime+"'";
    qDebug()<<query.toStr();
       t = s.WSendQuery(q);
       if(t.isSuccessfully())
       {

       if(t.Count()>1)
       {
           return false;
       }
       }
       s.SendQuery(query);
       EmailVerificator &ev = EmailVerificator::GetInstance();
       ev.SendVerificationEmail(email,korisnickoime,ime);
       return true;

        }

        }

              return false;

    }

    Q_INVOKABLE
    void zaboravljena_lozinka(QString username)
    {
        EmailVerificator & e=EmailVerificator::GetInstance();
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        QString q="SELECT * FROM Korisnik WHERE email='"+username+"'";
        t = s.WSendQuery(q);
        if(t.isSuccessfully())
        {
            if(t.Count()>0)
            {
               e.SendForgotPasswordEmail(t.Rows[0]["email"],username,t.Rows[0]["ime"]+" "+t.Rows[0]["prezime"]);
            }
        }

    }

     Q_INVOKABLE
    int prijava(QString korisnickoime,QString password)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        QString q="SELECT * FROM Administrator WHERE korisnickoIme='"+korisnickoime+"'and lozinka='"+password+"'";
           t = s.WSendQuery(q);
           if(t.isSuccessfully())
           {
               MProfil &mProfil = MProfil::GetInstance();
               //kmodel.removeAll();
           if(t.Count()>0)
           {
               /*if(t.Rows[0]["verifikovan"]=="0")
               {
                   return 0;
               }*/

               qDebug()<<"KOERISNICKO IME prre:: "<< t.Rows[0]["korisnickoIme"];
              mProfil.setIme(t.Rows[0]["ime"]);
               mProfil.setKorisnickoIme(t.Rows[0]["korisnickoIme"]);
               mProfil.setPrezime(t.Rows[0]["prezime"]);
               mProfil.setLozinka(t.Rows[0]["lozinka"]);
               mProfil.setEmail(t.Rows[0]["email"]);
              // LOCALDATA::ulogovan = true;
               mProfil.setOcena(t.Rows[0]["ocena"].toFloat());
                    qDebug()<<"KOERISNICKO IME posle:: "<< t.Rows[0]["korisnickoIme"];


               return 1;
           }
           else
           {
           return 2;
           }
           }

           return 3;
    }

  /*  Q_INVOKABLE
    void odjava()
    {
         LOCALDATA::ulogovan = false;
         mProfil->setIme("Neprijavljeni");
         mProfil->setPrezime("korisnik");
         mProfil->setKorisnickoIme("nema");
         mProfil->setSlikaURL(LINKS::getProfileDefaultPicture());
         mProfil->setLozinka("");
         mProfil->setEmail("");
         mProfil->setOcena(0);
         LOCALDATA::brobavestenja = 0;

         QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
         db.setDatabaseName("LOCALDB.sqlite");
        if(db.open())
        {
             QSqlQuery sqlquery;
             if(!sqlquery.exec("UPDATE LocalData SET ulogovan=0 WHERE id=0"))
             {
                   qDebug()<<"\n\nSQLITE ERROR: "<< sqlquery.lastError().text();
             }
        }
    }

*/

signals:

};

#endif // KORISNIKEVENTS_H
