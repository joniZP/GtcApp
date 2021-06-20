#ifndef KORISNIKEVENTS_H
#define KORISNIKEVENTS_H
#include<MySqlService.h>
#include<EmailVerificator.h>
#include <QObject>
#include<LOCALDATA.h>
#include<LINKS.h>
#include<FileUploader.h>

class KorisnikEvents : public QObject
{
    Q_OBJECT
public:
    explicit KorisnikEvents(QObject *parent = nullptr);



    Q_INVOKABLE
    bool registracija(QString ime,QString korisnickoime,QString email,QString sifra)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        QString query="INSERT INTO Users VALUES('"+ime+"','"+korisnickoime+"','"+email+"','"+sifra+"',0,'')";
        QString q="SELECT * FROM Users WHERE KorisnickoIme='"+korisnickoime+"'";
        qDebug()<<query;
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
     Q_INVOKABLE
    bool izmenaProfila(QString trenutnokorisnickoime, QString ime,QString korisnickoime,QString email,QString sifra, QString telefon)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        QString query="UPDATE Users SET KorisnickoIme ='"+ korisnickoime+"' Email='"+email+"' Password='"+sifra+"' PunoIme='"+ime+"' Telefon='"+telefon+"' WHERE KorisnickoIme ='"+trenutnokorisnickoime+"'";

        //QString query="INSERT INTO Users VALUES('"+ime+"','"+korisnickoime+"','"+email+"','"+sifra+"',0,'')";
        QString q="SELECT * FROM Users WHERE KorisnickoIme='"+korisnickoime+"'";
        qDebug()<<query;
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
           //ev.SendVerificationEmail(email,korisnickoime,ime);
           return true;

    }
     Q_INVOKABLE
    bool izmeniSlikuProfila(QString slikaurl)
    {
            FileUploader *f = new FileUploader();
            f->uploadImage(LOCALDATA::mProfil->getKorisnickoIme(), slikaurl);
            qDebug()<<"URL SLIKE:; "<< slikaurl;
           return true;
    }
     Q_INVOKABLE
    int prijava(QString korisnickoime,QString password)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        QString q="SELECT * FROM Korisnik WHERE korisnickoIme='"+korisnickoime+"'and lozinka='"+password+"'";
           t = s.WSendQuery(q);
           if(t.isSuccessfully())
           {
           if(t.Count()>0)
           {
               if(t.Rows[0]["verifikovan"]=="0")
               {
                   return 0;
               }

               LOCALDATA::mProfil->setIme(t.Rows[0]["ime"]);
               LOCALDATA::mProfil->setKorisnickoIme(t.Rows[0]["korisnickoIme"]);
               LOCALDATA::mProfil->setPrezime(t.Rows[0]["prezime"]);
               LOCALDATA::mProfil->setLozinka(t.Rows[0]["lozinka"]);
               LOCALDATA::mProfil->setEmail(t.Rows[0]["email"]);
               LOCALDATA::ulogovan = true;
               LOCALDATA::mProfil->setOcena(t.Rows[0]["ocena"].toFloat());

               if(t.Rows[0]["slika"].toInt() == 1)
                   LOCALDATA::mProfil->setSlikaURL(LINKS::getProfilePicture(korisnickoime));
               else
                   LOCALDATA::mProfil->setSlikaURL(LINKS::getProfileDefaultPicture());

               QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
               db.setDatabaseName("LOCALDB.sqlite");
              if(db.open())
              {
                   QSqlQuery sqlquery;
                   if(!sqlquery.exec("UPDATE LocalData SET ulogovan=1, korisnickoime='"+korisnickoime+"' WHERE id=1"))
                   {
                         qDebug()<<"\n\nSQLITE ERROR: "<< sqlquery.lastError().text();
                   }
              }


               return 1;
           }
           return 2;
           }

           return false;
    }

    Q_INVOKABLE
    void odjava()
    {
         LOCALDATA::ulogovan = false;
         LOCALDATA::mProfil->setIme("Neprijavljeni");
         LOCALDATA::mProfil->setPrezime("korisnik");
         LOCALDATA::mProfil->setKorisnickoIme("nema");
         LOCALDATA::mProfil->setSlikaURL(LINKS::getProfileDefaultPicture());
         LOCALDATA::mProfil->setLozinka("");
         LOCALDATA::mProfil->setEmail("");
         LOCALDATA::mProfil->setOcena(0);
         LOCALDATA::brobavestenja = 0;

         QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
         db.setDatabaseName("LOCALDB.sqlite");
        if(db.open())
        {
             QSqlQuery sqlquery;
             if(!sqlquery.exec("UPDATE LocalData SET ulogovan=0 WHERE id=1"))
             {
                   qDebug()<<"\n\nSQLITE ERROR: "<< sqlquery.lastError().text();
             }
        }
    }


signals:

};

#endif // KORISNIKEVENTS_H
