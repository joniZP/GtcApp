#include "dogadjaj.h"

Dogadjaj::Dogadjaj(const int& id,const QString &tip, const QString &vreme,const QString &opis)
    :m_id(id), m_tip(tip), m_vreme(vreme),m_opis(opis)
{

}

QString Dogadjaj::opis() const
{
    return m_opis;
}

QString Dogadjaj::tip() const
{
    return m_tip;
}
QString Dogadjaj::vreme() const
{
    return m_vreme;
}
int Dogadjaj::id() const
{
    return m_id;
}


