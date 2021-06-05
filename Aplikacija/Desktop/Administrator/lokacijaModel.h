#ifndef LOKACIJAMODEL_H
#define LOKACIJAMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<lokacija.h>


class LokacijaModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum LokacijaRoles {
       NazivRole = Qt::UserRole + 1,
        GradRole,
        OpisRole,
        OcenaRole,
        BrojOcenaRole,
        IdKorisnikaRole,
        XRole,
        YRole,
        BrojSlikaRoles,
        LikesRoles
    };

    static LokacijaModel* instance;
    LokacijaModel();
    public:
    static LokacijaModel& GetInstance();
    void dodajlokaciju(const Lokacija &lok);
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_lokacije.count()>0)
        {
             m_lokacije.removeFirst();
        }
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<Lokacija> m_lokacije;
private:

};

#endif // LOKACIJAMODEL_H
