#include "Komentar.h"

Komentar::Komentar(const QString &slika, const QString &text,const QString &ime)
    : m_slika(slika), m_text(text),m_ime(ime)
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
QString Komentar::ime() const
{
    return m_ime;
}

