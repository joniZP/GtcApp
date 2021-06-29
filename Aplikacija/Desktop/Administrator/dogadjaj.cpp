#include "dogadjaj.h"

Dogadjaj::Dogadjaj()
{

}


Dogadjaj::Dogadjaj(const int &idDogadjaja, const int &idLokacije,const QString &vreme,const QString &opis,const QString &tip,const QString &username, const QString razlog)
    :_idDogadjaja(idDogadjaja),_idLokacije(idLokacije),_vreme(vreme),_opis(opis),_tip(tip),_username(username), _razlog(razlog)
{

}

int Dogadjaj::idDogadjaja() const
{
    return _idDogadjaja;
}
int Dogadjaj::idLokacije() const
{
    return _idLokacije;
}
QString Dogadjaj::vreme() const
{
    return _vreme;

}
QString Dogadjaj::opis() const
{
    return _opis;
}
QString Dogadjaj::tip() const
{
    return _tip;
}
QString Dogadjaj::username() const
{
    return _username;
}
QString Dogadjaj::razlog() const
{
    return _razlog;
}
