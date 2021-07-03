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
    void remove();
    Q_INVOKABLE
    void obrisi(int i);

    void removeAll();


    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<profillistelement> m_prijatelji;
private:

};

#endif // PRIJATELJIMODEL_H


