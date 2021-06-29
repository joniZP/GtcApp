#ifndef MestoModel_H
#define MestoModel_H
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<kategorija.h>
class MestoModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KomentariRoles {
        MestoRole = Qt::UserRole + 1,
        CekiranRole,
        IndeksRole
    };
    static MestoModel* instance;
    MestoModel();
    public:
    static MestoModel& GetInstance();
    void dodajmesto(const Kategorija &kat);////Treba da se izmeni
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_mesta.count()>0)
        {
             m_mesta.removeFirst();
        }
        endRemoveRows();
    }

    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_mesta.count());
        m_mesta.clear();
        endRemoveRows();
    }

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
public:
    QList<Kategorija> m_mesta;//Treba da se izmeni
    Q_INVOKABLE
    void dodaj(int i)
    {
        if(m_mesta[i].cekirana()==false)
        {
            m_mesta[i].setCekirana(true);
        }
        else
        {
            m_mesta[i].setCekirana(false);
        }
        qDebug()<<m_mesta[i].cekirana();
    }
    void ukloni(int i)
    {
        m_mesta[i].setCekirana(true);
    }

    void reset()
    {
        for(int i=0;i<m_mesta.length();i++)
        {
            m_mesta[i].setCekirana(false);
        }
    }
private:

};

#endif
