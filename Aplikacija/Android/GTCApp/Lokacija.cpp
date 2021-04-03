#include "Lokacija.h"

lokacija::lokacija(const QString &slika, const QString &text,const QString &boja)
    : m_slika(slika), m_text(text),m_boja(boja)
{
}

QString lokacija::slika() const
{
    return m_slika;
}

QString lokacija::tekst() const
{
    return m_text;
}
QString lokacija::boja() const
{
    return m_boja;
}



