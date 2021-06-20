#ifndef OBAVESTENJE_H
#define OBAVESTENJE_H
#include<qstring.h>

class obavestenje
{
public:
    obavestenje(const QString &slika, const QString &text,const QString &id,const bool& checked,const bool &lid);

    QString slika() const;
    QString tekst() const;
    QString id() const;
    bool checked() const;
    bool lid() const;

    void cekiraj(bool b)
    {
        this->m_checked=b;
    }
private:
    QString m_slika;
    QString m_text;
    QString m_id;
    bool m_checked;
    bool m_lid;
};

#endif // OBAVESTENJE_H
