#include "zahtev.h"

zahtev::zahtev(const QString &slika, const QString &ime,const QString &id,const bool& vidjen,const bool& prihvacen)
    : m_slika(slika), m_ime(ime),m_id(id),m_vidjen(vidjen),m_prihvacen(prihvacen)
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

bool zahtev::vidjen() const
{
        return m_vidjen;
}
bool zahtev::prihvacen() const
{
    return m_prihvacen;
}

void zahtev::prihvati(bool b)
{
    this->m_prihvacen=b;
}

void zahtev::setVidjen(bool vidjen)
{
    this->m_vidjen = vidjen;
}
