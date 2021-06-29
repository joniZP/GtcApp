#include "profil.h"

profil::profil()
{

}


profil::profil(const QString &korisnickoime, const QString &ime,const QString &prezime ,const QString &email,const QString &brslika)
    :_korisnickoime(korisnickoime),_ime(ime),_prezime(prezime),_email(email),_brslika(brslika)
{

}

QString profil::korisnickoime() const
{
    return _korisnickoime;
}
QString profil::ime() const
{
    return _ime;
}
QString profil::prezime() const
{
    return _prezime;

}
QString profil::email() const
{
    return _email;
}

QString profil::brslika() const
{
    return _brslika;
}
