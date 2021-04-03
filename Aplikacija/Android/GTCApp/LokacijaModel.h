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
        TypeRole = Qt::UserRole + 1,
        SizeRole,
        ColorRole
    };
    static LokacijaModel* instance;
    LokacijaModel();
    public:
    static LokacijaModel& GetInstance();
    void dodajlokaciju(const lokacija &lok);
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
    QList<lokacija> m_lokacije;
private:

};
