

#ifndef KOMENTARMODEL_H
#define KOMENTARMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<komentar.h>
class KomentariModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KomentariRoles {
        TextRole = Qt::UserRole + 1,
        SlikaRole,
        ImeRole,
        IdRole,
        KreatorRole
    };
    static KomentariModel* instance;
    KomentariModel();
    public:
    static KomentariModel& GetInstance();
    void dodajkomentar(const Komentar &kom);
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_komentari.count()>0)
        {
             m_komentari.removeFirst();
        }
        endRemoveRows();
    }

    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_komentari.count());
        m_komentari.clear();
        endRemoveRows();
    }
    Q_INVOKABLE
    int getBrKom()
    {
        return m_komentari.count();
    }

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<Komentar> m_komentari;
private:

};

#endif
