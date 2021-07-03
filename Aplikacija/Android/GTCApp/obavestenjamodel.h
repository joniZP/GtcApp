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
    void remove();
    Q_INVOKABLE
    void pregledaj(int i);

     Q_INVOKABLE
    int getCount();
    void removeAll();

    Q_INVOKABLE
    void obrisi(int i);


    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<obavestenje> m_obavestenja;
private:

};

#endif // OBAVESTENJAMODEL_H
