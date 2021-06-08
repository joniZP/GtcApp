#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<slika.h>

//class slikaModel
//{
//public:
   // slikaModel();
//};

//#endif // SLIKAMODEL_H

class slikamodel: public QAbstractListModel{
    Q_OBJECT

private:

    enum SlikaRoles {
        TypeRole = Qt::UserRole + 1,
        SizeRole,
        ColorRole,
        IdRole,
        SlikaRole,
        NazivRole,
        GradRole
    };
    static slikamodel* instance;
   slikamodel();

public:
    static slikamodel& GetInstance();
    void dodajSliku(const Slika &lok);

    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_slike.count()>0)
        {
             m_slike.removeFirst();
        }
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
   QHash<int, QByteArray> roleNames() const;
    QList<Slika> m_slike;
private:

};
