//#ifndef SLIKA_H
//#define SLIKA_H

#include <QAbstractListModel>
#include <QStringList>

class Slika
{
public:
    Slika();
   Slika(const QString &slika, const QString &text,const QString &boja);
   Slika(const int id,const QString &slika, const QString &naziv,const QString &grad );
   QString slika() const;
   QString tekst() const;
   QString boja() const;


   QString naziv() const;
   QString grad() const;
   int id() const;
private:
    QString m_slika;
    QString m_text;
    QString m_boja;

    QString m_naziv;
    QString m_grad;
    int m_id;
};
