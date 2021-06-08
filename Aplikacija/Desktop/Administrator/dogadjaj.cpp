#include "dogadjaj.h"

Dogadjaj::Dogadjaj()
{

}


Dogadjaj::Dogadjaj(const int &idDogadjaja, const int &idLokacije,const QString &vreme,const QString &opis,const QString &tip,const int &idKorisnika)
    :_idDogadjaja(idDogadjaja),_idLokacije(idLokacije),_vreme(vreme),_opis(opis),_tip(tip),_idKorisnika(idKorisnika)
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
int Dogadjaj::idKorisnika() const
{
    return _idKorisnika;
}
