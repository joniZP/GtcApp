#include "UcitavanjeDogadjaja.h"

bool UcitavanjeDogadjaja::prijavljen = 0;
bool UcitavanjeDogadjaja::loadPrijavljen = 0;
QTimer * UcitavanjeDogadjaja::prijavljentimer = NULL;

MDogadjaj* UcitavanjeDogadjaja::dogadjaj = new MDogadjaj(-1,0,"","",0,"","");
UcitavanjeDogadjaja* UcitavanjeDogadjaja::instance = NULL;
int UcitavanjeDogadjaja::brslika = 0;
int UcitavanjeDogadjaja::brprijava = 0;

UcitavanjeDogadjaja::UcitavanjeDogadjaja()
{
    prijavljentimer = new QTimer(this);
    connect(prijavljentimer, &QTimer::timeout, this, QOverload<>::of(&UcitavanjeDogadjaja::sacuvajPrijavuUBazu));
}

UcitavanjeDogadjaja &UcitavanjeDogadjaja::GetInstance()
{
    if(instance == NULL)
        instance = new UcitavanjeDogadjaja();
    return *instance;
}

MDogadjaj *UcitavanjeDogadjaja::getDogadjaj(int id)
{
    MySqlService &s = MySqlService::MySqlInstance();
    MySqlTable t;
    dogadjaj = NULL;
    MyQuery query("SELECT Dogadjaj.*,Lokacija.naziv,Lokacija.grad,Lokacija.brojSlika,Korisnik.ime,Korisnik.prezime,Korisnik.slika, (SELECT count(*) from DogadjajLikes WHERE idDogadjaja=%1) as likescount, (SELECT count(*) from PrijavaNaDogadjaj where idDogadjaja=%1) as brprijava, (SELECT count(*) from KomentariDogadjaj WHERE idDogadjaja=%1) as brojKomentara from Dogadjaj INNER JOIN Lokacija on Dogadjaj.idLokacije=Lokacija.id INNER join Korisnik on Dogadjaj.idKorisnika = Korisnik.korisnickoIme WHERE idDogadjaja=%1");
    query<<id;
    qDebug()<<"dogadjaji   "<<query.toStr();
    t = s.WSendQuery(query);

    if(t.isSuccessfully())
    {
        if(t.Count()>0)
        {
            dogadjaj = new MDogadjaj(id,t.Rows[0]["idLokacije"].toInt(),t.Rows[0]["idKorisnika"],t.Rows[0]["opis"],t.Rows[0]["likescount"].toInt(),t.Rows[0]["tip"],t.Rows[0]["vreme"]);
            dogadjaj->setBrKomentara(t.Rows[0]["brojKomentara"].toInt());
            dogadjaj->lokacija->setIme(t.Rows[0]["naziv"]);
            dogadjaj->lokacija->setGrad(t.Rows[0]["grad"]);
            dogadjaj->lokacija->setBrSlika(t.Rows[0]["brojSlika"].toInt());
            dogadjaj->setImeKorisnika(t.Rows[0]["ime"]+" "+t.Rows[0]["prezime"]);
            brslika = t.Rows[0]["slika"].toInt();

            brprijava =t.Rows[0]["brprijava"].toInt();
            Like::setParameters(id,Tip::DogadjajTip);
            loadPrijavljen = loadStatus();
            prijavljen = loadPrijavljen;

        }
    }

    return dogadjaj;

}

QString UcitavanjeDogadjaja::getKorisnikSlika()
{
    if(brslika == 0)
        return LINKS::getProfileDefaultPicture();
    else
        return LINKS::getProfilePicture(dogadjaj->getIdKorisnika());
}

QString UcitavanjeDogadjaja::getLokacijaSlika()
{
    if(dogadjaj->lokacija->getBrSlika() > 0)
    {
        return LINKS::getLocationPicture(dogadjaj->getIdLokacije(),0);
    }
    else
    {
        return LINKS::getNoImageAvailable();
    }

}

void UcitavanjeDogadjaja::dodajKomentar(int idDogadjaja, QString text)
{
    if(text.length() > 0 && idDogadjaja != -1)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MySqlTable t;
        MyQuery query("INSERT INTO KomentariDogadjaj (tekstKomentara,idKorisnika,idDogadjaja) VALUES('%1','%2',%3)");//text, id korisnika, id lokacije
        query<<text<<LOCALDATA::mProfil->getKorisnickoIme()<<idDogadjaja;

        t = s.WSendQuery(query);
        if(t.isSuccessfully())
        {
            MySqlTable t1;
            t1 = s.WSendQuery("SELECT max(IdKomentara) FROM KomentariDogadjaj");
            if(t1.isSuccessfully())
            {
                KomentariModel& kom =  KomentariModel::GetInstance();
                kom.dodajkomentar(Komentar(LOCALDATA::mProfil->getSlikaURL(),text, LOCALDATA::mProfil->getIme() + " "+ LOCALDATA::mProfil->getPrezime(),t1.Rows[0][0].toInt(),LOCALDATA::mProfil->getKorisnickoIme()));
            }
        }


    }

}

void UcitavanjeDogadjaja::ucitajKomentare(int idDogadjaja)
{
    MySqlService &s = MySqlService::MySqlInstance();
    KomentariModel& kom =  KomentariModel::GetInstance();
    MySqlTable t1;
    MyQuery query("SELECT KomentariDogadjaj.*,Korisnik.ime,Korisnik.prezime,Korisnik.slika,Korisnik.korisnickoIme  FROM `KomentariDogadjaj` inner join Korisnik on KomentariDogadjaj.idKorisnika = Korisnik.korisnickoIme WHERE idDogadjaja='%1'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
    query<<idDogadjaja;
    t1 = s.WSendQuery(query);
    kom.removeAll();
    if(t1.isSuccessfully())
    {

        for(int i = 0; i < t1.Count();i++)
        {
            kom.dodajkomentar(Komentar( t1.Rows[i]["slika"].toInt() == 0? LINKS::getProfileDefaultPicture(): LINKS::getProfilePicture(t1.Rows[i]["idKorisnika"]),t1.Rows[i]["tekstKomentara"],t1.Rows[i]["ime"]+" "+ t1.Rows[i]["prezime"],t1.Rows[i]["idKomentara"].toInt(),t1.Rows[i]["korisnickoIme"]));
        }
    }

}

void UcitavanjeDogadjaja::sacuvajPrijavuUBazu(){
    prijavljentimer->stop();

    if(prijavljen != loadPrijavljen)
    {
        loadPrijavljen = prijavljen;
        if(prijavljen)
        {
            insertPrijava();
        }
        else
        {
            deletePrijava();
        }
    }

}

void UcitavanjeDogadjaja::insertPrijava()
{

    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query("INSERT INTO PrijavaNaDogadjaj SET korisnickoIme='%1', idDogadjaja='%2'");
    query<<LOCALDATA::mProfil->getKorisnickoIme()<<dogadjaj->getId();
    s.SendQuery(query);

}

void UcitavanjeDogadjaja::deletePrijava()
{
    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query("DELETE FROM PrijavaNaDogadjaj WHERE korisnickoIme='%1' and idDogadjaja='%4'");
    query<<LOCALDATA::mProfil->getKorisnickoIme()<<dogadjaj->getId();
    s.SendQuery(query);
}

bool UcitavanjeDogadjaja::loadStatus()
{
    MySqlService &s = MySqlService::MySqlInstance();
    MySqlTable t;
    MyQuery query("SELECT * FROM PrijavaNaDogadjaj WHERE korisnickoIme='%1' and idDogadjaja='%4'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
    query<<LOCALDATA::mProfil->getKorisnickoIme()<<dogadjaj->getId();
    t = s.WSendQuery(query);
    if(t.isSuccessfully())
    {
        return t.Count() > 0;
    }
}

bool UcitavanjeDogadjaja::isPrijavljen()
{
    return prijavljen;
}

int UcitavanjeDogadjaja::getBrPrijava()
{
    return brprijava;
}

void UcitavanjeDogadjaja::clickOnPrijava()
{
    prijavljen==true?brprijava--:brprijava++;
    prijavljen = !prijavljen;
    prijavljentimer->stop();
    prijavljentimer->start(2000);
}
