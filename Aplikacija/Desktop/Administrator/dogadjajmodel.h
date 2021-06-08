#ifndef DogadjajMODEL_H
#define DogadjajMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<dogadjaj.h>

class Dogadjajmodel: public QAbstractListModel{
    Q_OBJECT

private:

    enum DogadjajRoles {
        IdDogadjajaRole = Qt::UserRole + 1,
        IdLokacijeRole,
        VremeRole,
        OpisRole,
        TipRole,
        IdKorisnikaRole
    };
    static Dogadjajmodel* instance;
   Dogadjajmodel();

public:
    static Dogadjajmodel& GetInstance();
    void dodajDogadjaj(const Dogadjaj &dog);

    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_dogadjaji.count()>0)
        {
             m_dogadjaji.removeFirst();
        }
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
   QHash<int, QByteArray> roleNames() const;
    QList<Dogadjaj> m_dogadjaji;
private:

};
#endif // DogadjajMODEL_H
