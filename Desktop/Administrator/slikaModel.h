#ifndef SLIKA_MODEL
#define SLIKA_MODEL


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
class SlikaModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum LokacijaRoles {
        SlikaRole = Qt::UserRole + 1,
    };
    static SlikaModel* instance;
    SlikaModel();
    public:
    static SlikaModel& GetInstance();
    void dodajSliku(const QString slika);
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_slike.count()>0)
        {
             m_slike.removeFirst();
        }
        endRemoveRows();
    }

    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_slike.count());
        m_slike.clear();
        endRemoveRows();
    }


    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<QString> m_slike;
private:

};

#endif
