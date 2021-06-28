#ifndef DOGADJAJM_H
#define DOGADJAJM_H

#include <QAbstractListModel>
#include <QStringList>
class Dogadjaj
{
public:
    Dogadjaj(const int& id,const QString &tip, const QString &vreme,const QString &opis);
//![0]

    int id() const;
    QString tip() const;
    QString vreme() const;
    QString opis() const;

private:
    int m_id;
    QString m_tip;
    QString m_vreme;
    QString m_opis;
//![1]
};
#endif

