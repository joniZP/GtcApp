#ifndef MestoModel_H
#define MestoModel_H
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<kategorija.h>
class MestoModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KomentariRoles {
        MestoRole = Qt::UserRole + 1,
        CekiranRole,
        IndeksRole
    };
    static MestoModel* instance;
    MestoModel();
    public:
    static MestoModel& GetInstance();
    void dodajmesto(const Kategorija &kat);////Treba da se izmeni
    void remove();

    void removeAll();

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
    protected:
    QHash<int, QByteArray> roleNames() const;
    public:
    QList<Kategorija> m_mesta;//Treba da se izmeni
    Q_INVOKABLE
    void dodaj(int i);
    void ukloni(int i);
    void reset();
private:

};

#endif
