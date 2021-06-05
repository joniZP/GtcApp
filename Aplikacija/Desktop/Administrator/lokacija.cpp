#include "lokacija.h"

Lokacija:: Lokacija(const QString &naziv,const QString &grad, const QString &opis, int idKorisnika, double ocena,int brojOcena,double x,double y, int brojSlika,int likes)
    :_naziv(naziv),_grad(grad),_opis(opis),_idKorisnika(idKorisnika),_ocena(ocena),_brojOcena(brojOcena),_x(x),_y(y),_brojSlika(brojSlika),_likes(likes)
{

}

QString Lokacija::naziv() const
{
    return _naziv;
}
QString Lokacija::grad() const
{
    return _naziv;
}
QString Lokacija::opis() const
{
    return _naziv;
}
int Lokacija::idKorisnika() const
{
    return _idKorisnika;
}
int Lokacija::brojOcena() const
{
    return _brojOcena;
}
int Lokacija::brojSlika() const
{
    return _brojSlika;
}
int Lokacija::likes() const
{
    return _likes;
}
double Lokacija::Ocena() const
{
    return _ocena;
}
double Lokacija::x() const
{
    return _x;
}
double Lokacija::y() const
{
    return _y;
}
