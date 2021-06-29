#ifndef PROFILMODEL_H
#define PROFILMODEL_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include <MySqlService.h>
#include <profil.h>

//class Ucitavanjeprofila;

class profilModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum profilRoles {
        korisnickoimeRole = Qt::UserRole + 1,
        imeRole,
        prezimeRole,
        emailRole,
        brslikaRole
    };
    static profilModel* instance;
   profilModel();

public:

   Q_INVOKABLE
   static void izbrisiprofilizbaze(QString a)
   {

       MySqlService &s = MySqlService::MySqlInstance();

       MyQuery query("delete from Korisnik where korisnickoIme='%1'");
       query<<a;
       qDebug()<<query.toStr();
        s.SendQuery(query);
       //obrisi profil iz
   }
   Q_INVOKABLE
   void izbrisiprofil(int a)
   {

       qDebug()<<"nidzoniniininini";

       if(m_profili.count()>0)
       {
           izbrisiprofilizbaze(m_profili[a].korisnickoime());
           beginRemoveRows(QModelIndex(), a, a);
           m_profili.removeAt(a);
           endRemoveRows();

       }

   }

    static profilModel& GetInstance();
    void dodajprofil(const profil &dog);

    Q_INVOKABLE
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_profili.count()>0)
        {
             m_profili.removeFirst();
        }
        endRemoveRows();
    }
    QString vratikor()
    {
        return m_profili[0].korisnickoime();
    }
    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_profili.count());
        m_profili.clear();
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
   QHash<int, QByteArray> roleNames() const;
    QList<profil> m_profili;
private:

};
#endif // PROFILMODEL_H
