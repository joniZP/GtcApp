#include "MProfil.h"

MProfil *MProfil::instance=NULL;

MProfil &MProfil::GetInstance()
{
    if(instance==NULL)
    {
        instance = new MProfil();
    }
        return *instance;
}


QString MProfil::getKorisnickoIme() const
{
    return korisnickoIme;
}

void MProfil::setKorisnickoIme(const QString &value)
{
    korisnickoIme = value;
}

QString MProfil::getIme() const
{
    return ime;
}

void MProfil::setIme(const QString &value)
{
    ime = value;
}

QString MProfil::getPrezime() const
{
    return prezime;
}

void MProfil::setPrezime(const QString &value)
{
    prezime = value;
}

QString MProfil::getEmail() const
{
    return email;
}

void MProfil::setEmail(const QString &value)
{
    email = value;
}

QString MProfil::getLozinka() const
{
    return lozinka;
}

void MProfil::setLozinka(const QString &value)
{
    lozinka = value;
}

float MProfil::getOcena() const
{
    return ocena;
}

void MProfil::setOcena(float value)
{
    ocena = value;
}

bool MProfil::getVerifikovan() const
{
    return verifikovan;
}

void MProfil::setVerifikovan(bool value)
{
    verifikovan = value;
}

int MProfil::getBrojOcena() const
{
    return brojOcena;
}

void MProfil::setBrojOcena(int value)
{
    brojOcena = value;
}


QString MProfil::getTelefon() const
{
    return telefon;
}

void MProfil::setTelefon(const QString &value)
{
    telefon = value;
}

bool MProfil::getSlika() const
{
    return slika;
}

void MProfil::setSlika(bool value)
{
    slika = value;
}

QString MProfil::getSlikaURL() const
{
    return slikaURL;
}

void MProfil::setSlikaURL(const QString &value)
{
    slikaURL = value;
}



MProfil::MProfil(QString korisnickoIme, QString ime, QString prezime, QString email, QString lozinka, float ocena, bool verifikovan, int brojOcena, QString telefon, bool slika)
{
    this->korisnickoIme = korisnickoIme;
    this->ime = ime;
    this->prezime = prezime;
    this->email = email;
    this->lozinka = lozinka;
    this->ocena = ocena;
    this->verifikovan = verifikovan;
    this->brojOcena = brojOcena;
    this->telefon = telefon;
    this->slika = slika;
    if(slika)
    this->slikaURL = LINKS::getProfilePicture(korisnickoIme);
    else
        this->slikaURL = LINKS::getProfileDefaultPicture();
}

MProfil::MProfil(QString ime, QString prezime,QString korisnickoime, bool slika)
{
    this->ime = ime;
    this->prezime = prezime;
    this->korisnickoIme = korisnickoime;
    if(slika)
    this->slikaURL = LINKS::getProfilePicture(korisnickoIme);
    else
        this->slikaURL = LINKS::getProfileDefaultPicture();
}


