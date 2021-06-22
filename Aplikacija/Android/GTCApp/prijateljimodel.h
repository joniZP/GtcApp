#ifndef PRIJATELJIMODEL_H
#define PRIJATELJIMODEL_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<profillistelement.h>

class PrijateljiModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum PrijateljiRoles {
        SlikaRole = Qt::UserRole + 1,
        ImeRole,
        IdKorisnikaRole
    };
    static PrijateljiModel* instance;

    PrijateljiModel();
    public:
    static PrijateljiModel& GetInstance();
    void dodajPrijatelja(const profillistelement &o );
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_prijatelji.count()>0)
        {
             m_prijatelji.removeFirst();
        }
        endRemoveRows();
    }
    Q_INVOKABLE
    void obrisi(int i)
    {
        beginRemoveRows(QModelIndex(),i,i);
        if(m_prijatelji.count()>0)
        {
             m_prijatelji.removeAt(i);
        }
        endRemoveRows();
    }

    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_prijatelji.count());
        m_prijatelji.clear();
        endRemoveRows();
    }


    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<profillistelement> m_prijatelji;
private:

};

#endif // PRIJATELJIMODEL_H


