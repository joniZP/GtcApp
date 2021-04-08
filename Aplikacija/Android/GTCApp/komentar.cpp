#include "Komentar.h"

Komentar::Komentar(const QString &slika, const QString &text,const QString &boja)
    : m_slika(slika), m_text(text),m_boja(boja)
{
}

QString Komentar::slika() const
{
    return m_slika;
}

QString Komentar::tekst() const
{
    return m_text;
}
QString Komentar::boja() const
{
    return m_boja;
}

