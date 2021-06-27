#ifndef KOMENTAR_H
#define KOMENTAR_H
#include <QAbstractListModel>
#include <QStringList>

class Komentar
{
public:
    Komentar();
   Komentar( const int &idReport, const int &idkom, const QString &tekst, const QString &username,const int &lokdog,const QString &razlog, const int &idlokdog);

   int idreport() const;
   int idkom() const;
   QString tekst() const;
    QString username() const;
    int lokdog() const;
    QString razlog() const;
    int idlokdog() const;

private:

   int _idreport;
   int _idkom;
   QString _tekst;
   QString _username;
   int _lokdog;
   QString _razlog;
   int _idlokdog;

};

#endif // KOMENTAR_H
