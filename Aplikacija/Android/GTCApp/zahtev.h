#ifndef ZAHTEV_H
#define ZAHTEV_H

#include<qstring.h>

class zahtev
{
public:
    zahtev(const QString &slika, const QString &ime,const QString &id,const bool& prihvacen);

    QString slika() const;
    QString ime() const;
    QString id() const;
    bool prihvacen() const;

    void prihvati(bool b)
    {
        this->m_prihvacen=b;
    }
private:
    QString m_slika;
    QString m_ime;
    QString m_id;
    bool m_prihvacen;

};
#endif // ZAHTEV_H
