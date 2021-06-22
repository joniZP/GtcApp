#include "profillistelement.h"

profillistelement::profillistelement(const QString &ime, const QString &prezime, const QString &korisnickoime, const bool &slika)
{
    this->m_ime = ime +" "+prezime;
    this->m_slika = slika;
    this->m_korisnickoime = korisnickoime;
    if(slika)
    this->m_slikaurl = LINKS::getProfilePicture(korisnickoime);
    else
    this->m_slikaurl = LINKS::getProfileDefaultPicture();
}

QString profillistelement::slika() const
{
    return m_slikaurl;
}

QString profillistelement::ime() const
{
    return m_ime;
}

QString profillistelement::korisnickoime() const
{
    return m_korisnickoime;
}

