#ifndef LOKACIJA_H
#define LOKACIJA_H
#include <QAbstractListModel>
#include <QStringList>


class Lokacija
{
public:
    Lokacija(const int& id, const QString &slika, const QString &naziv,const QString &grad,const QString &idkorisnika,const QString &razlog,const QString username);
//![0]
    Lokacija(const int& id,const QString &slika, const QString &naziv,const QString &grad,const QString &idkorisnika);
    int id() const;
    QString slika() const;
    QString naziv() const;
    QString grad() const;
    QString idkorisnika() const;
    QString razlog() const;
    QString username() const;

private:
    int m_id;
    QString m_slika;
    QString m_naziv;
    QString m_grad;
    QString m_idkorisnika;
    QString m_razlog;
    QString m_username;

};
#endif // LOKACIJA_H
