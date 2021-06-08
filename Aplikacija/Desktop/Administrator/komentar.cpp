#include "komentar.h"

Komentar::Komentar()
{

}
Komentar::Komentar(const int &idKomentara, const int &idKorisnika,const QString &tekst,const int &pripada)
    :_idKomentara(idKomentara),_idKorisnika(idKorisnika),_tekst(tekst),_pripada(pripada)
{

}
int Komentar::idKomentara() const
{
    return _idKomentara;
}
QString Komentar::tekst() const
{
    return _tekst;
}
int Komentar::pripada() const
{
    return _pripada;

}
int Komentar::idKorisnika() const
{
    return _idKorisnika;
}
