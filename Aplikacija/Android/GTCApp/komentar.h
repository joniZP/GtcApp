#ifndef KOMENTAR_H
#define KOMENTAR_H
#include<qstring.h>

class Komentar
{
public:
    Komentar(const QString &slika, const QString &text,const QString &ime,const int id);

    QString slika() const;
    QString tekst() const;
    QString ime() const;
    int id() const;

private:
    QString m_slika;
    QString m_text;
    QString m_ime;
    int m_id;
};

#endif // KOMENTAR_H
