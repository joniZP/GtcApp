#ifndef MYSQLSERVICE_H
#define MYSQLSERVICE_H

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
/*
<br />\n<b>Warning</b>:  mysqli_connect(): (HY000/2002): Connection refused in <b>/storage/ssd3/579/16965579/public_html/GTCAPP/Database/gtcconfig.php</b> on line <b>10</b><br />\nERROR: Could not connect. Connection refused"
*/

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
    static void ReplyAnswerAsync(QNetworkReply * reply);

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

signals:
    void myConnectionLost();
    void myConnectionEstablished();

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







#endif // MYSQLSERVICE_H






