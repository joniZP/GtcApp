#include "kategorija.h"

Kategorija::Kategorija(const QString &kategorija, const bool &cekirana,const int &indeks)
    : m_kategorija(kategorija), m_cekirana(cekirana),m_indeks(indeks)
{
}

QString Kategorija::kategorija() const
{
    return m_kategorija;
}

bool Kategorija::cekirana() const
{
    return m_cekirana;
}
int Kategorija::indeks() const
{
    return m_indeks;
}

void Kategorija::setCekirana(bool b)
{
    this->m_cekirana=b;
}
