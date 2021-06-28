#ifndef KORISNIKDOGADJAJIMODEL_H
#define KORISNIKDOGADJAJIMODEL_H

#include <QObject>
#include<Dogadjaj.h>

class KorisnikDogadjajiModel :  public QAbstractListModel
{
    Q_OBJECT
private:

    enum KorisnikLokacijaRoles {
        TipRole = Qt::UserRole + 1,
        VremeRole,
        OpisRole,
        IdRole
    };
    static KorisnikDogadjajiModel* instance;
    KorisnikDogadjajiModel();
    public:
    static KorisnikDogadjajiModel& GetInstance();
    void dodajdogadjaj(const Dogadjaj &lok);
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_dogadjaji.count()>0)
        {
             m_dogadjaji.removeFirst();
        }
        endRemoveRows();
    }
    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_dogadjaji.count());
        m_dogadjaji.clear();
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<Dogadjaj> m_dogadjaji;

signals:

};

#endif // KORISNIKDOGADJAJIMODEL_H
