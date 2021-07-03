#ifndef KOMENTARMODEL_H
#define KOMENTARMODEL_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<komentar.h>
#include <MySqlService.h>

class Komentarmodel: public QAbstractListModel{
    Q_OBJECT

private:

    enum KomentarRoles {
        IdReport = Qt::UserRole + 1,
       TekstKomentaraRole,
          UsernameRole,
        LokDogRole,
        RazlogRole,
        IdLokDogRole,
        IDKomRole


    };
    static Komentarmodel* instance;
   Komentarmodel();

public:
    static Komentarmodel& GetInstance();
    void dodajKomentar(const Komentar &dog);



    Q_INVOKABLE
    static void izbrisiprijavuKomentara(int a)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;

         query="delete from ReportKomentar where idKomentara=%1";
         query<<a;

       s.SendQuery(query);
    }
    Q_INVOKABLE
    static void izbrisiKomentar(int a, int b)
    {
//        izbrisiprijavuKomentara(a);
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
       if(b==0){
        query="delete from KomentariLokacije where idKomentara=%1";
        query<<a;
        qDebug() << "OBRISAN KOMENTAR IZ LOKACIJE";
       }
       else
       {
           query="delete from KomentariDogadjaj where idKomentara=%1";
           query<<a;
           qDebug() << "OBRISAN KOMENTAR IZ DOGADJAJA";
       }

        qDebug()<<query.toStr();
        s.SendQuery(query);
    }




     Q_INVOKABLE
     void obrisiprijavu(int a)
     {
       //  int pom=m_Komentari[a].idkom();
            int pom = m_Komentari[a].idkom();

         if(m_Komentari.count()>0)
         {
             qDebug()<<m_Komentari[a].idlokdog();
             izbrisiprijavuKomentara(m_Komentari[a].idkom());
             for(int i=0; i<m_Komentari.count();i++)
             {
             if(pom == m_Komentari[i].idkom())
             {

                 beginRemoveRows(QModelIndex(),i,i);
                 m_Komentari.removeAt(i);
                 endRemoveRows();
                 i--;
             }
             }
         }

     }
     Q_INVOKABLE
     void prihvatiprijavu(int a)
     {
          int pom = m_Komentari[a].idkom();
          izbrisiprijavuKomentara(pom);
         izbrisiKomentar(pom,m_Komentari[a].lokdog());
          qDebug() << "ID KOMENTARA:"<<pom;
          qDebug()<<"ID REPORTA:"<<m_Komentari[a].idreport();
          qDebug()<<"LOKDOG====="<<m_Komentari[a].lokdog();
          qDebug()<<"ID LOKDOG====="<<m_Komentari[a].idlokdog();
          for(int i=0; i<m_Komentari.count();i++)
          {
          if(pom == m_Komentari[i].idkom())
          {

              beginRemoveRows(QModelIndex(),i,i);
              m_Komentari.removeAt(i);
              endRemoveRows();
              i--;
          }
          }
          qDebug()<<"PROLAZI LI FOR";
       //   qDebug()<< m_Komentari[a].lokdog();

     }


    void removeAll()
    {
            beginRemoveRows(QModelIndex(), 0,m_Komentari.count());
            m_Komentari.clear();
            endRemoveRows();
    }

    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_Komentari.count()>0)
        {
             m_Komentari.removeFirst();
        }
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
   QHash<int, QByteArray> roleNames() const;
    QList<Komentar> m_Komentari;
private:

};

#endif // KOMENTARMODEL_H
