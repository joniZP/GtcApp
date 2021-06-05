//#ifndef SLIKA_H
//#define SLIKA_H

#include <QAbstractListModel>
#include <QStringList>

class Slika
{
public:
    Slika();
   Slika(const QString &slika, const QString &text,const QString &boja);
   QString slika() const;
   QString tekst() const;
   QString boja() const;
private:
    QString m_slika;
    QString m_text;
    QString m_boja;
};
