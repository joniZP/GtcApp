#ifndef DogadjajMODEL_H
#define DogadjajMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<dogadjaj.h>
#include <MySqlService.h>


//class UcitavanjeDogadjaja;

class Dogadjajmodel: public QAbstractListModel{
    Q_OBJECT

private:

    enum DogadjajRoles {
        IdDogadjajaRole = Qt::UserRole + 1,
        IdLokacijeRole,
        VremeRole,
        OpisRole,
        TipRole,
        UsernameRole,
        RazlogRole
    };
    static Dogadjajmodel* instance;
   Dogadjajmodel();

public:

   Q_INVOKABLE
   static void izbrisiprijavudogadjaja(int a)
   {
       QString pom=(QString)a;

       MySqlService &s = MySqlService::MySqlInstance();
       //QString query;
       //MySqlTable t;
       //query = "delete from ReportDogadjaj where idReport='"+pom+"' ";
        MyQuery query("delete from ReportDogadjaj where idDogadjaj=%1");//("SELECT * FROM Lokacija WHERE Id='%1'");
        query<<a;

      s.SendQuery(query);
   }
   Q_INVOKABLE
   static void izbrisidogadjaj(int a)
   {
       izbrisiprijavudogadjaja(a);
       MySqlService &s = MySqlService::MySqlInstance();
       //QString query;
       MySqlTable t;

       MyQuery query("delete from Dogadjaj where idDogadjaja=%1");
       query<<a;
       qDebug()<<query.toStr();
        s.SendQuery(query);
          MyQuery query2("delete from KomentariDogadjaj where idDogadjaja=%1 ");/*; delete from Obavestenje where idDL=%1 AND tip=false";*/;
          query2<<a;
          s.SendQuery(query2);
           MyQuery query3("delete from Obavestenje where idDL=%1");/*; delete from Obavestenje where idDL=%1 AND tip=false";*/;
          query3<<a;
          s.SendQuery(query3);
  }


Q_INVOKABLE
   static void izbrisiDogadjajzaId(int a)
   {
       MyQuery query;
       MyQuery query2;
       MySqlTable t;
        MySqlService &s = MySqlService::MySqlInstance();
        qDebug() << "PUNIMO DOGADJAJ";
       query = "SELECT * FROM Dogadjaj where idLokacije=%1 ";
       query << a;
       t = s.WSendQuery(query);
       if(t.isSuccessfully())
       {
           qDebug()<<t.Count();
           if(t.Count()>0)
           {
                for(int i=0;i<t.Count();i++)
                {
                    qDebug() << "brisanje za:"<<t.Rows[i]["idDogadjaja"].toInt();
                    query2="delete from KomentariDogadjaj where idDogadjaja=%1 "/*; delete from Obavestenje where idDL=%1 AND tip=false";*/;
                    query2<<t.Rows[i]["idDogadjaja"].toInt();
                     s.SendQuery(query2);
                }
                qDebug()<< "Brisanje dogadjaja...." << a;
            query="delete FROM Dogadjaj where idLokacije=%1";
            query<<a;
            s.WSendQuery(query);
           }

   }
   }
    static Dogadjajmodel& GetInstance();
    void dodajDogadjaj(const Dogadjaj &dog);
    Q_INVOKABLE
    void obrisiprijavu(int a)
    {


        int pom=m_dogadjaji[a].idDogadjaja();

        if(m_dogadjaji.count()>0)
        {
            for(int i=0; i<m_dogadjaji.count();i++)
            {
                if(pom == m_dogadjaji[i].idDogadjaja())
                {
                    beginRemoveRows(QModelIndex(), i, i);
                    m_dogadjaji.removeAt(i);
                    endRemoveRows();
                    i--;
                }

            }
        }
        izbrisiprijavudogadjaja(pom);

    }
    Q_INVOKABLE
    void prihvatiprijavu(int a)
    {

       qDebug()<<m_dogadjaji[a].idDogadjaja();
        qDebug()<< a;
        int pom = m_dogadjaji[a].idDogadjaja();
        for(int i=0; i<m_dogadjaji.count();i++)
        {
        if(pom ==  m_dogadjaji[i].idDogadjaja())
        {

            beginRemoveRows(QModelIndex(),i,i);
            m_dogadjaji.removeAt(i);
            endRemoveRows();
            i--;
        }
        }
         izbrisidogadjaj(pom);
     //    izbrisiprijavudogadjaja(pom);
    }

    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_dogadjaji.count()>0)
        {
             m_dogadjaji.removeFirst();
        }
        endRemoveRows();
    }
    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_dogadjaji.count());
        m_dogadjaji.clear();
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
   QHash<int, QByteArray> roleNames() const;
    QList<Dogadjaj> m_dogadjaji;
private:

};
#endif // DogadjajMODEL_H
