#include "obavestenje.h"

obavestenje::obavestenje(const QString &slika, const QString &text,const QString &id,const bool& checked,const bool& lid,const int& idld,const bool &vidjen,const int & idO)
    : m_slika(slika), m_text(text),m_id(id),m_checked(checked),m_lid(lid),m_vidjen(vidjen),m_idLD(idld),m_idO(idO)
{
}

QString obavestenje::slika() const
{
    return m_slika;
}

QString obavestenje::tekst() const
{
    return m_text;
}
QString obavestenje::id() const
{
    return m_id;
}
bool obavestenje::checked() const
{
    return m_checked;
}
bool obavestenje::lid() const
{
    return m_lid;
}
int obavestenje::idLD() const
{
    return m_idLD;
}
int obavestenje::idO() const
{
    return m_idO;
}
bool obavestenje::vidjen() const
{
    return m_vidjen;
}
