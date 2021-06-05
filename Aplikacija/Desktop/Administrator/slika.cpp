#include "slika.h"

Slika::Slika(const QString &slika, const QString &text,const QString &boja)
   : m_slika(slika), m_text(text),m_boja(boja)
{

}

QString Slika::slika() const
{
    return m_slika;
}

QString Slika::tekst() const
{
    return m_text;
}
QString Slika::boja() const
{
    return m_boja;
}

