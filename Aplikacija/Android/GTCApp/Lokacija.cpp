#include "Lokacija.h"

lokacija::lokacija(const int& id,const QString &slika, const QString &naziv,const QString &grad)
    :m_id(id), m_slika(slika), m_naziv(naziv),m_grad(grad)
{

}

QString lokacija::slika() const
{
    return m_slika;
}

QString lokacija::naziv() const
{
    return m_naziv;
}
QString lokacija::grad() const
{
    return m_grad;
}
int lokacija::id() const
{
    return m_id;
}


