#ifndef KORISNIKLOKACIJAMODEL_H
#define KORISNIKLOKACIJAMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<Lokacija.h>
class KorisnikLokacijaModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KorisnikLokacijaRoles {
        SlikaRole = Qt::UserRole + 1,
        NazivRole,
        GradRole,
        IdRole
    };
    static KorisnikLokacijaModel* instance;
    KorisnikLokacijaModel();
    public:
    static KorisnikLokacijaModel& GetInstance();
    void dodajlokaciju(const lokacija &lok);
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_lokacije.count()>0)
        {
             m_lokacije.removeFirst();
        }
        endRemoveRows();
    }
    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_lokacije.count());
        m_lokacije.clear();
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<lokacija> m_lokacije;
private:

};


#endif // KORISNIKLOKACIJAMODEL_H
