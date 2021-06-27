#include "lokacija.h"

Lokacija::Lokacija(const int& id,const QString &slika, const QString &naziv,const QString &grad,const QString &idkorisnika,const QString &razlog,const QString username)
    :m_id(id), m_slika(slika), m_naziv(naziv),m_grad(grad),m_idkorisnika(idkorisnika),m_razlog(razlog),m_username(username)
{

}

Lokacija::Lokacija(const int& id,const QString &slika, const QString &naziv,const QString &grad,const QString &idkorisnika)
   :m_id(id), m_slika(slika), m_naziv(naziv),m_grad(grad),m_idkorisnika(idkorisnika)
  {

  }

QString Lokacija::slika() const
{
    return m_slika;
}

QString Lokacija::naziv() const
{
    return m_naziv;
}
QString Lokacija::grad() const
{
    return m_grad;
}
int Lokacija::id() const
{
    return m_id;
}
QString Lokacija::idkorisnika() const
{
    return m_idkorisnika;

}
QString Lokacija::username() const
{
    return m_username;
}
QString Lokacija::razlog() const
{
    return m_razlog;
}
