#ifndef MYSQLKRSTA_H
#define MYSQLKRSTA_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>

#include<QObject>
#include<QSqlDatabase>
#include<QtSql>
#include<QSqlQuery>
#include<map>
#include<stdlib.h>

//#include<mutex>
//#include <thread>
//#include <condition_variable>

//extern std::mutex mtx;
//extern std::condition_variable cv;


using namespace std;


class MySqlService: public QObject{
        Q_OBJECT
 private:
    static bool WaitAnswer;
    static QString Answer;
    static MySqlService * instance;
    static QEventLoop waitLoop;
    QNetworkAccessManager *manager;



    static void ReplyAnswer(QNetworkReply * reply)
    {
        if(WaitAnswer)
        {
             Answer = reply->readAll();
             WaitAnswer = false;
             waitLoop.quit();
             qDebug() << "Reply: " <<  Answer;
        }
        else
        {
           qDebug() << "NO WAIT Reply: " <<  reply->readAll();
        }
    }


    MySqlService()
    {
        manager = new QNetworkAccessManager(this);
        QObject::connect(manager, &QNetworkAccessManager::finished, this, &MySqlService::ReplyAnswer);
    }

public:
    static MySqlService& MySqlInstance()
    {
        if(instance == NULL)
        {
            instance = new MySqlService();
        }
        return *instance;
    }

    void SendQuary(QString request)
    {
        QUrlQuery params;
        params.addQueryItem("quary", request);
        params.addQueryItem("proba", "request");

        QUrl ur("http://humanads.000webhostapp.com/GtcService.php");
        QNetworkRequest req(ur);


        req.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
        manager->post(req, params.query().toUtf8());

    }

    QString WSendQuary(QString request)
    {
        WaitAnswer = true;
        QUrlQuery params;
        params.addQueryItem("quary", request);

        QUrl ur("http://humanads.000webhostapp.com/GtcService.php");
        QNetworkRequest req(ur);

        req.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
        manager->post(req, params.query().toUtf8());

        waitLoop.exec();
        return Answer;
    }


};


struct MySqlRow{
    map<QString, int> *maping;
    QStringList Columns;

    MySqlRow(map<QString,int> *m, QStringList qsl)
    {
        maping = m;
        Columns = qsl;
    }

    QString operator [](QString s){
      if((*maping).find(s) == (*maping).end())
      {
          qDebug() << "GRESKA U PRETRAZI: " <<  s;
          return "Greska";
      }
        return Columns[(*maping)[s]];
    }

    QString operator [](int i){
        return Columns[i];
    }

};

class MySqlTable{

private:
    int status = 0;
    map<QString, int> *colNames;

public:
    QString status_message;
    QList<MySqlRow> Rows;

    MySqlTable()
    {
        colNames = new map<QString, int>();
    }

    bool isSuccessfully()
    {
        return status ==200;
    }

    void operator =(QString s)
    {
      QStringList delovi  =  s.split("###");
      ///////////////////////// STATUS
        QStringList Status = delovi[0].split("|");
        status = Status[0].toInt();
        status_message = Status[1];

        if(status != 200)
        {
            qDebug()<<status_message;
            return;
        }

        if(delovi.count()>2)//SELECT zahtev
        {
              ///////////////////////// HEADER
              QStringList Fields = delovi[1].split("|");
              for(int i = 0; i < Fields.count()-1;i++)
              {
                  (*colNames)[Fields[i]] = i;
              }
              ///////////////////////// DATA
              QStringList Data = delovi[2].split("##");

              for(int i = 0;i< Data.count();i++)
              {
                  Rows.append(MySqlRow(colNames,Data[i].split("|")));
              }
        }

    }

    int Count()
    {
        return Rows.count();
    }
};




#endif // MYSQLKRSTA_H










