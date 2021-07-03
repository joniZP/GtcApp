#ifndef KORISNIKDOGADJAJMODEL_H
#define KORISNIKDOGADJAJMODEL_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<Dogadjaj.h>
class KorisnikDogadjajModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KorisnikLokacijaRoles {
        TipRole = Qt::UserRole + 1,
        VremeRole,
        OpisRole,
        IdRole
    };
    static KorisnikDogadjajModel* instance;
    KorisnikDogadjajModel();
    public:
    static KorisnikDogadjajModel& GetInstance();
    void dodajdogadjaj(const Dogadjaj &lok);
    void remove();
    void removeAll();
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<Dogadjaj> m_dogadjaji;
private:

};


#endif // KorisnikDogadjajModel_H

