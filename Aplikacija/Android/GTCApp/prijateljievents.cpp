#include <prijateljievents.h>

int PrijateljiEvents::Stanje = 0;
QString PrijateljiEvents::imeprijatelja="Nema";

PrijateljiEvents::PrijateljiEvents(QObject *parent) : QObject(parent)
{

}

void PrijateljiEvents::posaljiZahtev(QString korisnickoimeprijatelja)
{
    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query;
    query="INSERT IGNORE INTO Zahtev VALUES('%1','%2',0)";//primalac, posiljalac
    query<<korisnickoimeprijatelja<<LOCALDATA::mProfil->getKorisnickoIme();
    s.SendQuery(query);
    qDebug()<<"Salje ZAHTEV" << query.toStr();
}

void PrijateljiEvents::izbrisiZahtev(QString korisnickoimeprijatelja)
{
    brisanjeZahteva(korisnickoimeprijatelja, LOCALDATA::mProfil->getKorisnickoIme());
}

void PrijateljiEvents::prihvatiZahtev(QString korisnickoimeprijatelja)
{
    brisanjeZahteva(LOCALDATA::mProfil->getKorisnickoIme(),korisnickoimeprijatelja);

    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query;
    query="INSERT IGNORE INTO Prijatelji VALUES('%1','%2')";//prijatelj1, prijatelj2
    query<<korisnickoimeprijatelja<<LOCALDATA::mProfil->getKorisnickoIme();
    s.SendQuery(query);
    qDebug()<<"prihvata ZAHTEV" << query.toStr();
}

void PrijateljiEvents::izbrisiPrijatelja(QString korisnickoimeprijatelja)
{
    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query;
    query="DELETE FROM Prijatelji WHERE (prijatelj1='%1' and prijatelj2='%2') or (prijatelj1='%3' and prijatelj2='%4')";//prijatelj1, prijatelj2
    query<<korisnickoimeprijatelja<<LOCALDATA::mProfil->getKorisnickoIme()<<LOCALDATA::mProfil->getKorisnickoIme()<<korisnickoimeprijatelja;
    s.SendQuery(query);
    qDebug()<<"BRISE Prijatelja" << query.toStr();
}

void PrijateljiEvents::prikaziListuPrijatelja(){
    MySqlService &s = MySqlService::MySqlInstance();
    MySqlTable t;
    MyQuery query;
    query="SELECT Korisnik.* from Korisnik inner join ((SELECT prijatelj2 as prijatelj from Prijatelji WHERE prijatelj1='%1') UNION (SELECT prijatelj1 as prijatelj from Prijatelji WHERE prijatelj2='%1'))  as KImenaPrijatelja Where Korisnik.korisnickoIme = KImenaPrijatelja.prijatelj";
    query<<LOCALDATA::mProfil->getKorisnickoIme();
    t=s.WSendQuery(query);

    qDebug()<<"SKIDA PODACI" << query.toStr() <<"\n\nCOUNT "<< t.Count();

    if(t.isSuccessfully())
    {
        PrijateljiModel &pm = PrijateljiModel::GetInstance();
        pm.removeAll();
        for(int i = 0;i<t.Count();i++)
        {
            pm.dodajPrijatelja(profillistelement(t.Rows[i]["ime"],t.Rows[i]["prezime"],t.Rows[i]["korisnickoIme"],t.Rows[i]["slika"].toInt()));
        }

    }
}

int PrijateljiEvents::uzmiStanje(QString korisnickoimeprijatelja)
{

    MySqlService &s = MySqlService::MySqlInstance();
    MySqlTable t;
    MyQuery query;
    query="SELECT * from (SELECT count(*) as Prijatelji from Prijatelji WHERE (prijatelj1='%1' and prijatelj2='%2') or (prijatelj1='%2' and prijatelj2='%1'))  as t1, (SELECT count(*) as PoslaoZahtev from Zahtev WHERE posiljalac='%1' and primalac='%2') as t2, (SELECT count(*) as PrimioZahtev from Zahtev WHERE posiljalac='%2' and primalac='%1') as t3 ";
    query<<LOCALDATA::mProfil->getKorisnickoIme()<< korisnickoimeprijatelja;
    t=s.WSendQuery(query);

    qDebug()<<"STANJE: "<< query.toStr();

    if(t.isSuccessfully())
    {
        if(t.Rows.count() > 0)
        {
            if(t.Rows[0]["Prijatelji"].toInt() > 0)
                return 3;
            if(t.Rows[0]["PoslaoZahtev"].toInt() > 0)
                return 2;
            if(t.Rows[0]["PrimioZahtev"].toInt() > 0)
                return 1;
        }
    }

    return 0;
}

void PrijateljiEvents::setStanjeByUsername(QString username)
{
    Stanje = uzmiStanje(username);
    imeprijatelja = username;
}

void PrijateljiEvents::brisanjeZahteva(QString primalac, QString posiljalac)
{
    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query;
    query="DELETE FROM Zahtev WHERE (primalac='%1' and posiljalac='%2') or (primalac='%2' and posiljalac='%1')";//primalac, posiljalac
    query<<primalac<<posiljalac;
    s.SendQuery(query);
    qDebug()<<"BRISE ZAHTEV" << query.toStr();
}
