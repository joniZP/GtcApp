#ifndef KOMENTAR_H
#define KOMENTAR_H
#include<qstring.h>

class Komentar
{
public:
    Komentar(const QString &slika, const QString &text,const QString &boja);

    QString slika() const;
    QString tekst() const;
    QString boja() const;

private:
    QString m_slika;
    QString m_text;
    QString m_boja;
};

#endif // KOMENTAR_H
