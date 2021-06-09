#ifndef PRETRAGALOKACIJA_H
#define PRETRAGALOKACIJA_H

#include <QObject>
#include <MySqlKrsta.h>
class PretragaLokacija : public QObject
{
    Q_OBJECT
public:
    explicit PretragaLokacija(QObject *parent = nullptr);
    QStringList gradovi;
    QStringList kategorije;

    Q_INVOKABLE
    void Pretrazi(QString text)
    {

       getGradoviKategorije();
       MySqlService & s = MySqlService::MySqlInstance();
       MySqlTable t;
       MyQuery q;

       QStringList reci = text.split(" ");
       QString query = "SELECT * from (Select Konacna.id,COUNT(id) as prioritet from (";

       for(int i=0;i<reci.count()-1;i++)
       {
           query.append("(SELECT id FROM `Lokacija` WHERE opis LIKE '%"+reci[i]+"%')  UNION ALL ");
       }
         query.append("(SELECT id FROM `Lokacija` WHERE opis LIKE '%"+reci[reci.count()-1]+"%')");
         query.append(")  as Konacna GROUP BY Konacna.id) as spoj left join Lokacija ON spoj.id = Lokacija.id ");



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

         query.append(" ORDER BY prioritet DESC");



       qDebug()<<query;


    }

    void getGradoviKategorije(){
        gradovi.push_back("Nis");
        gradovi.push_back("Leskovac");

        kategorije.push_back("Sport");
        kategorije.push_back("Izlet");
    }

signals:

};

#endif // PRETRAGALOKACIJA_H
