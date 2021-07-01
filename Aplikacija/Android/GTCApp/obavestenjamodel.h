#ifndef OBAVESTENJAMODEL_H
#define OBAVESTENJAMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<obavestenje.h>
#include<MySqlService.h>
#include<LOCALDATA.h>
class ObavestenjaModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum ObavestenjaRoles {
        SlikaRole = Qt::UserRole + 1,
        TextRole,
        IdLokacije_dogadjajaRole,
        VidjenRole,
        LidRole,
        KorisnikRole,
        IdORole
    };
    static ObavestenjaModel* instance;
    ObavestenjaModel();
    public:
    static ObavestenjaModel& GetInstance();
    void dodajobavestenje(const obavestenje &o );
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_obavestenja.count()>0)
        {
             m_obavestenja.removeFirst();
        }
        endRemoveRows();
    }
    Q_INVOKABLE
    void pregledaj(int i)
    {
        if(m_obavestenja[i].checked()==false)
        {
            m_obavestenja[i].cekiraj(true);
        }
    }

     Q_INVOKABLE
    int getCount()
    {
        qDebug()<<m_obavestenja.count();
        return m_obavestenja.count();

    }
    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_obavestenja.count());
        m_obavestenja.clear();
        endRemoveRows();
    }

    Q_INVOKABLE
    void obrisi(int i)
    {
        beginRemoveRows(QModelIndex(),i,i);
        if(m_obavestenja.count()>0)
        {
            MySqlService &s = MySqlService::MySqlInstance();
            MyQuery query;
            query="DELETE FROM Obavestenje where idObavestenja=%1";
            query<< m_obavestenja[i].idO();
            s.SendQuery(query);
            m_obavestenja.removeAt(i);
        }
        endRemoveRows();
    }


    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<obavestenje> m_obavestenja;
private:

};

#endif // OBAVESTENJAMODEL_H
