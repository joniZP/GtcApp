#include "komentar.h"

Komentar::Komentar(const QString &slika, const QString &text,const QString &ime,const int id)
    : m_slika(slika), m_text(text),m_ime(ime),m_id(id)
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
int Komentar::id() const
{
    return m_id;
}

