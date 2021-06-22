#ifndef PROFILLISTELEMENT_H
#define PROFILLISTELEMENT_H
#include<LINKS.h>
#include<qstring.h>
class profillistelement
{
public:
    profillistelement(const QString &ime,const QString &prezime, const QString &korisnickoime,const bool& slika);

    QString slika() const;
    QString ime() const;
    QString korisnickoime() const;

private:
    bool m_slika;
    QString m_ime;
    QString m_korisnickoime;
    QString m_slikaurl;

};


#endif // PROFILLISTELEMENT_H
