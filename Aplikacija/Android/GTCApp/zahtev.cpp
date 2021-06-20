#include "zahtev.h"

zahtev::zahtev(const QString &slika, const QString &ime,const QString &id,const bool& prihvacen)
    : m_slika(slika), m_ime(ime),m_id(id),m_prihvacen(prihvacen)
{
}

QString zahtev::slika() const
{
    return m_slika;
}

QString zahtev::ime() const
{
    return m_ime;
}
QString zahtev::id() const
{
    return m_id;
}
bool zahtev::prihvacen() const
{
    return m_prihvacen;
}
