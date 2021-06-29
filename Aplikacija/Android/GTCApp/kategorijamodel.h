#ifndef KATEGORIJAMODEL_H
#define KATEGORIJAMODEL_H
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<kategorija.h>
class KategorijaModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KomentariRoles {
        KategorijaRole = Qt::UserRole + 1,
        CekiranRole,
        IndeksRole
    };
    static KategorijaModel* instance;
    KategorijaModel();
    public:
    static KategorijaModel& GetInstance();
    void dodajkategoriju(const Kategorija &kat);
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_kategorije.count()>0)
        {
             m_kategorije.removeFirst();
        }
        endRemoveRows();
    }

    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_kategorije.count());
        m_kategorije.clear();
        endRemoveRows();
    }

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
public:
    QList<Kategorija> m_kategorije;
    Q_INVOKABLE
    void dodaj(int i)
    {
        if(m_kategorije[i].cekirana()==false)
        {
            m_kategorije[i].setCekirana(true);
        }
        else
        {
            m_kategorije[i].setCekirana(false);
        }
        qDebug()<<m_kategorije[i].cekirana();
    }
    void ukloni(int i)
    {
        m_kategorije[i].setCekirana(true);
    }
    void reset()
    {
        for(int i=0;i<m_kategorije.length();i++)
        {
            m_kategorije[i].setCekirana(false);
        }
    }
private:

};

#endif
