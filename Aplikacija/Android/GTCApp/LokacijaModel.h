#ifndef LOKACIJAMODEL_H
#define LOKACIJAMODEL_H
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<Lokacija.h>
class LokacijaModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum LokacijaRoles {
        SlikaRole = Qt::UserRole + 1,
        NazivRole,
        GradRole,
        IdRole
    };
    static LokacijaModel* instance;
    LokacijaModel();
    public:
    static LokacijaModel& GetInstance();
    void dodajlokaciju(const lokacija &lok);
    void remove();
    void removeAll();
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<lokacija> m_lokacije;
private:

};
#endif
