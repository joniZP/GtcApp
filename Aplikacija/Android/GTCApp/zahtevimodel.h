#ifndef ZAHTEVIMODEL_H
#define ZAHTEVIMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<zahtev.h>

class ZahteviModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum ZahteviRoles {
        SlikaRole = Qt::UserRole + 1,
        ImeRole,
        IdKorisnikaRole,
        PrihvacenRole,

    };
    static ZahteviModel* instance;

    ZahteviModel();
    public:
    static ZahteviModel& GetInstance();
    void dodajzahtev(const zahtev &o );
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_zahtevi.count()>0)
        {
             m_zahtevi.removeFirst();
        }
        endRemoveRows();
    }
    Q_INVOKABLE
    void prihvati(int i)
    {
        if(m_zahtevi[i].prihvacen()==false)
        {
            m_zahtevi[i].prihvati(true);
        }
    }

    Q_INVOKABLE
    void obrisi(int i)
    {
        beginRemoveRows(QModelIndex(),i,i);
        if(m_zahtevi.count()>0)
        {
             m_zahtevi.removeAt(i);
        }
        endRemoveRows();
    }


    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<zahtev> m_zahtevi;
private:

};


#endif // ZAHTEVIMODEL_H
