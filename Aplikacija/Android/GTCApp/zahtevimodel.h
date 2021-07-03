#ifndef ZAHTEVIMODEL_H
#define ZAHTEVIMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<zahtev.h>
#include<MySqlService.h>
#include<LOCALDATA.h>
#include<prijateljievents.h>


class ZahteviModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum ZahteviRoles {
        SlikaRole = Qt::UserRole + 1,
        ImeRole,
        IdKorisnikaRole,
        PrihvacenRole,
        VidjenRole,

    };
    static ZahteviModel* instance;

    ZahteviModel();
    public:
    static ZahteviModel& GetInstance();
    void dodajzahtev(const zahtev &o );
    void remove();

    void removeAll();

    Q_INVOKABLE
    void prihvati(int i);

    Q_INVOKABLE
    void obrisi(int i);

    Q_INVOKABLE
    void setVidjeni();

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<zahtev> m_zahtevi;
private:

};


#endif // ZAHTEVIMODEL_H
