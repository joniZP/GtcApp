#ifndef KOMENTARMODEL_H
#define KOMENTARMODEL_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<komentar.h>

class Komentarmodel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KomentarRoles {
        IdKomentaraRole = Qt::UserRole + 1,
       TekstKomentaraRole,
          IdKorisnikaRole,
        PripadaRole,

    };
    static Komentarmodel* instance;
   Komentarmodel();

public:
    static Komentarmodel& GetInstance();
    void dodajKomentar(const Komentar &dog);

    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_Komentari.count()>0)
        {
             m_Komentari.removeFirst();
        }
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
   QHash<int, QByteArray> roleNames() const;
    QList<Komentar> m_Komentari;
private:

};

#endif // KOMENTARMODEL_H
