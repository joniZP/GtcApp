#include "komentar.h"

Komentar::Komentar()
{

}
Komentar::Komentar( const int &idreport, const int &idkom,const QString &tekst,const QString &username,const int &lokdog, const QString &razlog,const int &idlokdog )
    : _idreport(idreport),_idkom(idkom),_tekst(tekst),_username(username),_lokdog(lokdog),_razlog(razlog),_idlokdog(idlokdog)
{

}
int Komentar::idreport() const
{
    return _idreport;
}
int Komentar::idkom() const
{
    return _idkom;
}
QString Komentar::tekst() const
{
    return _tekst;
}
QString Komentar::username() const
{
    return _username;

}
int Komentar::lokdog() const
{
    return _lokdog;
}
QString Komentar::razlog() const
{
    return _razlog;
}
int Komentar::idlokdog() const
{
    return _idlokdog;
}
