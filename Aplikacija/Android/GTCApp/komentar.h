#ifndef KOMENTAR_H
#define KOMENTAR_H
#include<qstring.h>

class Komentar
{
public:
    Komentar(const QString &slika, const QString &text,const QString &ime,const int id,const  QString &kreatorid);

    QString slika() const;
    QString tekst() const;
    QString ime() const;
    QString kreatorid() const;
    int id() const;

private:
    QString m_slika;
    QString m_text;
    QString m_ime;
    QString m_kreatorid;
    int m_id;
};

#endif // KOMENTAR_H
