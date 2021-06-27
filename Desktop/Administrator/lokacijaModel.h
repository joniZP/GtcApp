#ifndef LOKACIJAMODEL_H
#define LOKACIJAMODEL_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<lokacija.h>
#include <MySqlService.h>
class LokacijaModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum LokacijaRoles {
        SlikaRole = Qt::UserRole + 1,
        NazivRole,
        GradRole,
        IdRole,
        idkorisnikaRole,
        usernameRole,
        RazlogRole
    };
    static LokacijaModel* instance;
    LokacijaModel();
    public:
    static LokacijaModel& GetInstance();
    void dodajlokaciju(const Lokacija &lok);


    Q_INVOKABLE
    static void izbrisiprijavulokacije(int a)
    {
        QString pom=(QString)a;

        MySqlService &s = MySqlService::MySqlInstance();
        //QString query;
        //MySqlTable t;
        //query = "delete from ReportDogadjaj where idReport='"+pom+"' ";
         MyQuery query("delete from ReportLokacija where idLokacija=%1");//("SELECT * FROM Lokacija WHERE Id='%1'");
         query<<a;

       s.SendQuery(query);
    }
    Q_INVOKABLE
    static void izbrisilokaciju(int a)
    {
        izbrisiprijavulokacije(a);
        MySqlService &s = MySqlService::MySqlInstance();
        //QString query;
        //MySqlTable t;

        MyQuery query("delete from Lokacija where id=%1");
        query<<a;
        qDebug()<<query.toStr();
         s.SendQuery(query);
        //obrisi dogadjaj iz
    }

     Q_INVOKABLE
     void obrisiprijavu(int a)
     {

         int pom=m_lokacije[a].id();
         if(m_lokacije.count()>0)
         {

             izbrisiprijavulokacije(m_lokacije[a].id());
             for(int i=0; i<m_lokacije.count();i++)
             {

                 if(pom == m_lokacije[i].id())
                 {
                     beginRemoveRows(QModelIndex(), i, i);
                     m_lokacije.removeAt(i);
                     endRemoveRows();
                     i--;
                 }

             }
         }

     }
     Q_INVOKABLE
     void prihvatiprijavu(int a)
     {

         qDebug()<<"saleelelelele";

         beginRemoveRows(QModelIndex(), 0, m_lokacije.count());
         if(m_lokacije.count()>0)
         {
              izbrisilokaciju(m_lokacije[a].id());
         }
         endRemoveRows();
         obrisiprijavu(a);
     }



     Q_INVOKABLE
     void odbaciprijavulokacije(int a)
     {
         MySqlService &s = MySqlService::MySqlInstance();
         MyQuery query("delete from Lokacija where id=%1");
         query<<a;
         qDebug()<<query.toStr();
         s.SendQuery(query);
     }


     Q_INVOKABLE
          void odbaciprijavu(int index,int j)
          {

              for(int i=0; i<m_lokacije.count();i++)
              {

                  beginRemoveRows(QModelIndex(), i, i);

                  if(m_lokacije[index].id() == m_lokacije[i].id())
                  {
                      m_lokacije.removeAt(i);
                  }
                  endRemoveRows();
              }
              odbaciprijavulokacije(j);
          }


          Q_INVOKABLE
               void verifikujLokaciju(int id)
               {

                   MySqlService &s = MySqlService::MySqlInstance();
                   //QString query;
                   //MySqlTable t;

                   MyQuery query("UPDATE Lokacija SET Verifikovana=1 WHERE id=%1");
                   query<<id;
                   qDebug()<<query.toStr();
                   s.SendQuery(query);


                   for(int i=0;i<m_lokacije.count();i++)
                   {
                       if(m_lokacije[i].id()==id)
                       {
                            beginRemoveRows(QModelIndex(),i, i);
                            m_lokacije.removeAt(i);
                            endRemoveRows();
                       }
                   }
                     //
               }




    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_lokacije.count()>0)
        {
             m_lokacije.removeFirst();
        }
        endRemoveRows();
    }
    void removeAll()
    {
        beginRemoveRows(QModelIndex(), 0,m_lokacije.count());
        m_lokacije.clear();
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
    QList<Lokacija> m_lokacije;
private:

};
#endif
