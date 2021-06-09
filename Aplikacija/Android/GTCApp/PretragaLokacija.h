#ifndef PRETRAGALOKACIJA_H
#define PRETRAGALOKACIJA_H

#include <QObject>
#include <MySqlKrsta.h>
#include<kategorijamodel.h>
#include<mestomodel.h>
#include<LINKS.h>
#include<LokacijaModel.h>
class PretragaLokacija : public QObject
{
    Q_OBJECT
public:
    explicit PretragaLokacija(QObject *parent = nullptr);
    QStringList gradovi;
    QStringList kategorije;

    KategorijaModel &m=KategorijaModel::GetInstance();
    MestoModel &mesto=MestoModel::GetInstance();
    Q_INVOKABLE
    void reset()
    {
        m.reset();
        mesto.reset();
    }
    Q_INVOKABLE
    void pretrazi(QString text)
    {

       getGradoviKategorije();
       MySqlService & s = MySqlService::MySqlInstance();
       MySqlTable t;
       MyQuery q;
        qDebug()<<text;
       QStringList recipom = text.split(" ");
       QStringList reci;

        for(int i = 0;i< recipom.count();i++)
        {
             qDebug()<<recipom[i]<<" ";
            if(recipom[i].length() >= 3)
                reci.push_back(recipom[i]);
        }


        qDebug()<<reci.count();
       QString query ="";
        if(reci.count()>0)
        {

            query.append("SELECT * from (Select Konacna.id,COUNT(id) as prioritet from (");

               for(int i=0;i<reci.count()-1;i++)
               {
                   query.append("(SELECT id FROM Lokacija WHERE opis LIKE '%"+reci[i]+"%')  UNION ALL ");
               }
             query.append("(SELECT id FROM Lokacija WHERE opis LIKE '%"+reci[reci.count()-1]+"%')");
             query.append(")  as Konacna GROUP BY Konacna.id) as spoj left join Lokacija ON spoj.id = Lokacija.id ");

        }
        else
        {
            query.append("SELECT * FROM Lokacija ");
        }

         if(gradovi.count() > 0 || kategorije.count() > 0)
         {
             query.append("WHERE ");

             if(gradovi.count()>0)
             {
             query.append("(");
             for(int i=0;i< gradovi.count();i ++)
             {
                 if(i>0)
                     query.append("or ");
                 query.append("grad='"+gradovi[i]+"' ");
             }
             query.append(") ");
             }

             if(kategorije.count() > 0)
             {
                 if(gradovi.count() > 0)
                     query.append("and ");

                 query.append("(");
                 for(int i=0;i< kategorije.count();i ++)
                 {
                     if(i>0)
                         query.append("or ");
                     query.append("kategorija='"+kategorije[i]+"' ");
                 }
                 query.append(") ");
             }


         }

         if(reci.count()>0)
         query.append(" ORDER BY prioritet DESC");

       qDebug()<<query;


       t = s.WSendQuery(query);
       if(t.isSuccessfully())
       {
            LokacijaModel &model =LokacijaModel::GetInstance();
            model.removeAll();

               for (int i=0;i<t.Count();i++)
               {
                   if(t.Rows[i]["brojSlika"].toInt() == 0)
                   {
                       model.dodajlokaciju(lokacija(t.Rows[i]["id"].toInt(),LINKS::APILINK+"/upload/noimageavailable.jpeg",t.Rows[i]["naziv"],t.Rows[i]["grad"]));
                   }
                   else
                   {
                        model.dodajlokaciju(lokacija(t.Rows[i]["id"].toInt(),LINKS::getLocationPicture(t.Rows[i]["id"].toInt(),0),t.Rows[i]["naziv"],t.Rows[i]["grad"]));
                   }

               }
       }


    }

    void getGradoviKategorije()
    {
        kategorije.clear();
        gradovi.clear();
          for(int i=0;i<m.m_kategorije.length();i++)
          {
              if(m.m_kategorije[i].cekirana())
              {
                  kategorije.push_back(m.m_kategorije[i].kategorija());
              }
          }
          for(int i=0;i<mesto.m_mesta.length();i++)
          {
              qDebug()<<mesto.m_mesta[i].cekirana()<< " ";
              if(mesto.m_mesta[i].cekirana())
              {

                  gradovi.push_back(mesto.m_mesta[i].kategorija());
              }
          }
    }

signals:

};

#endif // PRETRAGALOKACIJA_H
