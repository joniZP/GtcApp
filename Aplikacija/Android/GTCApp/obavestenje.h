#ifndef OBAVESTENJE_H
#define OBAVESTENJE_H
#include<qstring.h>

class obavestenje
{
public:
    obavestenje(const QString &slika, const QString &text,const QString &id,const bool& checked,const bool &lid,const int & idld,const bool &vidjen,const int & idO);

    QString slika() const;
    QString tekst() const;
    QString id() const;//KORISNIK
    bool checked() const;
    bool lid() const;//LOKACIJA ILI DOGADJAJ
    int idLD() const;//id lokacije ili dogadjaja
    bool vidjen() const;
     int idO() const;
    void cekiraj(bool b)
    {
        this->m_vidjen=b;
    }
private:
    QString m_slika;
    QString m_text;
    QString m_id;
    bool m_checked;
    bool m_lid;
    bool m_vidjen;
    int m_idLD;
    int m_idO;
};

#endif // OBAVESTENJE_H
