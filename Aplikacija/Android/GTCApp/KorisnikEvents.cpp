#include "KorisnikEvents.h"

KorisnikEvents::KorisnikEvents(QObject *parent) : QObject(parent)
{

}

bool KorisnikEvents::registracija(QString ime, QString prezime, QString korisnickoime, QString email, QString sifra)
{
    MySqlService &s = MySqlService::MySqlInstance();
    MySqlTable t;
    MyQuery query;
    query="INSERT INTO Korisnik VALUES('%1','%2','%3','%4','%5',%6,%7,%8,%9,'%10',%11)";
    query<<korisnickoime<<ime<<prezime<<email<<sifra<<0<<0<<0<<0<<"Nema"<<0;

    QString q="SELECT * FROM Korisnik WHERE korisnickoIme='"+korisnickoime+"'";
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

void KorisnikEvents::izmenaProfila(QString ime, QString prezime, QString sifra, QString telefon)
{

    MySqlService &s = MySqlService::MySqlInstance();
    MySqlTable t;
    MyQuery query;
    query="UPDATE Korisnik SET ime='%1', prezime='%2', lozinka='%3', telefon='%4' WHERE korisnickoIme ='%5'";
    query<<ime<<prezime<<sifra<<telefon<<LOCALDATA::mProfil->getKorisnickoIme();
    qDebug()<<query.toStr();
    t = s.WSendQuery(query);
    if(t.isSuccessfully())
    {
        LOCALDATA::mProfil->setIme(ime);
        LOCALDATA::mProfil->setPrezime(prezime);
        LOCALDATA::mProfil->setLozinka(sifra);
        LOCALDATA::mProfil->setTelefon(telefon);
    }

}

bool KorisnikEvents::izmeniSlikuProfila(QString slikaurl)
{
    FileUploader *f = new FileUploader();
    f->uploadImage(LOCALDATA::mProfil->getKorisnickoIme(), slikaurl);
    qDebug()<<"URL SLIKE:; "<< slikaurl;

    MySqlService &s = MySqlService::MySqlInstance();
    QString q="UPDATE Korisnik SET slika=1 WHERE korisnickoIme='"+LOCALDATA::mProfil->getKorisnickoIme()+"'";
    s.SendQuery(q);

    return true;
}

void KorisnikEvents::zaboravljena_lozinka(QString email)
{
    EmailVerificator & e=EmailVerificator::GetInstance();
    MySqlService &s = MySqlService::MySqlInstance();
    MySqlTable t;
    QString q="SELECT * FROM Korisnik WHERE email='"+email+"'";
    t = s.WSendQuery(q);
    if(t.isSuccessfully())
    {
        if(t.Count()>0)
        {
            e.SendForgotPasswordEmail(email,t.Rows[0]["korisnickoIme"],t.Rows[0]["ime"]+" "+t.Rows[0]["prezime"]);
        }
    }

}

int KorisnikEvents::prijava(QString korisnickoime, QString password)
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
                if(!sqlquery.exec("UPDATE LocalData SET ulogovan=1, korisnickoime='"+korisnickoime+"' WHERE id=0"))
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

void KorisnikEvents::odjava()
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
        if(!sqlquery.exec("UPDATE LocalData SET ulogovan=0 WHERE id=0"))
        {
            qDebug()<<"\n\nSQLITE ERROR: "<< sqlquery.lastError().text();
        }
    }
}
