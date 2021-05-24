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
struct MyQuery;

class MySqlService: public QObject{
        Q_OBJECT
 private:
    static bool WaitAnswer;
    static QString Answer;
    static MySqlService * instance;
    static QEventLoop waitLoop;
    QNetworkAccessManager *manager;



    static void ReplyAnswer(QNetworkReply * reply);


    MySqlService()
    {
        manager = new QNetworkAccessManager(this);
        QObject::connect(manager, &QNetworkAccessManager::finished, this, &MySqlService::ReplyAnswer);
    }

public:
    static MySqlService& MySqlInstance();

    void SendQuery(QString request);
    void SendQuery(MyQuery request);

    QString WSendQuery(QString request);
    QString WSendQuery(MyQuery request);


};


struct MySqlRow{
    map<QString, int> *maping;
    QStringList Columns;

    MySqlRow(map<QString,int> *m, QStringList qsl);

    QString operator [](QString s);

    QString operator [](int i);

};

class MySqlTable{

private:
    int status = 0;
    map<QString, int> *colNames;

public:
    QString status_message;
    QList<MySqlRow> Rows;
    MySqlTable();
    bool isSuccessfully();
    void operator =(QString s);
    int Count();
};
struct MyQuery{
    QString q;

        MyQuery();
        MyQuery(QString s);

     void operator =(QString s);

     MyQuery& operator<<(QString s);
     MyQuery& operator<<(int s);
     MyQuery& operator<<(float s);
     MyQuery& operator<<(double s);

     QString toStr();
};







#endif // MYSQLKRSTA_H










