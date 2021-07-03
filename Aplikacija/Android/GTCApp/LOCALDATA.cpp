#include "LOCALDATA.h"
#include "LINKS.h"
#include<MProfil.h>
LOCALDATA* LOCALDATA::instance = NULL;

bool LOCALDATA::ulogovan = false;
//MProfil p;
//p = MProfil("nema","Neprijavljeni","korisnik","","",0,1,0,"",0);
MProfil* LOCALDATA::mProfil = new MProfil("nema","Neprijavljeni","korisnik","","",0,1,0,"",0);
int LOCALDATA::brobavestenja = 0;





void LOCALDATA::initMProfil()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("LOCALDB.sqlite");

    if(db.open())
    {
        QSqlQuery sqlquery;
        sqlquery.exec("CREATE TABLE IF NOT EXISTS \"LocalData\" (\
                            \"id\"	INTEGER,\
                            \"ulogovan\"	INTEGER,\
                            \"korisnickoime\"	TEXT,\
                            PRIMARY KEY(\"id\")\
                            );");
            sqlquery.exec("INSERT or IGNORE INTO LocalData VALUES(0,0,'Nema')");


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
            QString q="SELECT Korisnik.*,(SELECT AVG(ocena) from KorisnikOcene WHERE ocenjen='"+sqlquery.value(2).toString()+"') as avgocena FROM Korisnik WHERE korisnickoIme='"+sqlquery.value(2).toString()+"'";
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
                    mProfil->setTelefon(t.Rows[0]["telefon"]);/////
                    mProfil->setOcena(t.Rows[0]["avgocena"].toFloat());
                    if(t.Rows[0]["slika"].toInt() == 1)
                        mProfil->setSlikaURL(LINKS::getProfilePicture(mProfil->getKorisnickoIme()));
                    else
                        mProfil->setSlikaURL(LINKS::getProfileDefaultPicture());
                }
            }

        }


    }
}

bool LOCALDATA::getUlogovan()
{
    return ulogovan;
}

int LOCALDATA::getBrObavestenja()
{
    return brobavestenja;
}

MProfil *LOCALDATA::getMProfil()
{
    return LOCALDATA::mProfil;
}
