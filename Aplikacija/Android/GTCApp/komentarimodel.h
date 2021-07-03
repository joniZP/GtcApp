

#ifndef KOMENTARMODEL_H
#define KOMENTARMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<komentar.h>
class KomentariModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KomentariRoles {
        TextRole = Qt::UserRole + 1,
        SlikaRole,
        ImeRole,
        IdRole,
        KreatorRole
    };
    static KomentariModel* instance;
    KomentariModel();
    public:
    static KomentariModel& GetInstance();
    void dodajkomentar(const Komentar &kom);
    void remove();

    void removeAll();
    Q_INVOKABLE
    int getBrKom();

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<Komentar> m_komentari;
private:

};

#endif
