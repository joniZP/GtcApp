#ifndef ZAHTEVIMODEL_H
#define ZAHTEVIMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<zahtev.h>
#include<MySqlService.h>
#include<LOCALDATA.h>
#include<prijateljievents.h>


class ZahteviModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum ZahteviRoles {
        SlikaRole = Qt::UserRole + 1,
        ImeRole,
        IdKorisnikaRole,
        PrihvacenRole,
        VidjenRole,

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

    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_zahtevi.count());
        m_zahtevi.clear();
        endRemoveRows();
    }

    Q_INVOKABLE
    void prihvati(int i)
    {
        beginRemoveRows(QModelIndex(),i,i);
        if(m_zahtevi[i].prihvacen()==false)
        {
            PrijateljiEvents::prihvatiZahtev(m_zahtevi[i].id());
           // m_zahtevi[i].prihvati(true);
            m_zahtevi.removeAt(i);
        }
         endRemoveRows();
    }

    Q_INVOKABLE
    void obrisi(int i)
    {
        beginRemoveRows(QModelIndex(),i,i);
        if(m_zahtevi.count()>0)
        {
             PrijateljiEvents::izbrisiZahtev(m_zahtevi[i].id());
             m_zahtevi.removeAt(i);

        }
        endRemoveRows();
    }

    Q_INVOKABLE
    void setVidjeni()
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
        query="UPDATE Zahtev SET vidjen=1 WHERE primalac='%1' and vidjen=0";
        query<<LOCALDATA::mProfil->getKorisnickoIme();
        s.SendQuery(query);

    }


    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<zahtev> m_zahtevi;
private:

};


#endif // ZAHTEVIMODEL_H
