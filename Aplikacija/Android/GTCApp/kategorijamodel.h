#ifndef KATEGORIJAMODEL_H
#define KATEGORIJAMODEL_H
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<kategorija.h>
class KategorijaModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KomentariRoles {
        KategorijaRole = Qt::UserRole + 1,
        CekiranRole,
        IndeksRole
    };
    static KategorijaModel* instance;
    KategorijaModel();
    public:
    static KategorijaModel& GetInstance();
    void dodajkategoriju(const Kategorija &kat);
    void remove();

    Q_INVOKABLE
    int getCurrentIndex(QString k);
    void removeAll();

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
public:
    QList<Kategorija> m_kategorije;
    Q_INVOKABLE
    void dodaj(int i);
    void ukloni(int i);
    void reset();
private:

};

#endif
