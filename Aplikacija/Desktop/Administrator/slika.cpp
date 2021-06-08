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

QString Slika::naziv() const{
    return m_naziv;
}
QString Slika::grad() const
{
    return m_grad;
}
int Slika::id() const
{
    return m_id;
}
Slika::Slika(const int id, const QString &slika,const QString &naziv,const QString &grad)
    :m_slika(slika),m_naziv(naziv),m_grad(grad),m_id(id)
{

}
