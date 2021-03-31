#include "MySqlKrsta.h"

#ifndef KRSTA
#define KRSTA
bool MySqlService::WaitAnswer = false;
QString MySqlService::Answer = " ";
MySqlService * MySqlService::instance = NULL;
QEventLoop MySqlService::waitLoop;

#endif

void MySqlService::ReplyAnswer(QNetworkReply *reply)
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

MySqlService &MySqlService::MySqlInstance()
{
    if(instance == NULL)
    {
        instance = new MySqlService();
    }
    return *instance;
}

void MySqlService::SendQuery(QString request)
{
    QUrlQuery params;
    params.addQueryItem("query", request);
    params.addQueryItem("proba", "request");

    QUrl ur("http://humanads.000webhostapp.com/GtcService.php");
    QNetworkRequest req(ur);


    req.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    manager->post(req, params.query().toUtf8());

}

QString MySqlService::WSendQuery(QString request)
{
    WaitAnswer = true;
    QUrlQuery params;
    params.addQueryItem("query", request);

    QUrl ur("http://humanads.000webhostapp.com/GtcService.php");
    QNetworkRequest req(ur);

    req.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    manager->post(req, params.query().toUtf8());

    waitLoop.exec();
    return Answer;
}

MySqlRow::MySqlRow(map<QString, int> *m, QStringList qsl)
{
    maping = m;
    Columns = qsl;
}

QString MySqlRow::operator [](QString s){
    if((*maping).find(s) == (*maping).end())
    {
        qDebug() << "GRESKA U PRETRAZI: " <<  s;
        return "Greska";
    }
    return Columns[(*maping)[s]];
}

QString MySqlRow::operator [](int i){
    return Columns[i];
}

MySqlTable::MySqlTable()
{
    colNames = new map<QString, int>();
}

bool MySqlTable::isSuccessfully()
{
    return status ==200;
}

void MySqlTable::operator =(QString s)
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

int MySqlTable::Count()
{
    return Rows.count();
}

MyQuery::MyQuery()
{
    q = "";
}

MyQuery::MyQuery(QString s)
{
    q = s;
}

void MyQuery::operator =(QString s)
{
    q = s;
}

MyQuery &MyQuery::operator<<(QString s)
{
    s = "'"+s+"'";
    q = QString(q).arg(s);
    return *this;
}

MyQuery &MyQuery::operator<<(int s)
{
    q = QString(q).arg(QString::number(s));
    return *this;
}

MyQuery &MyQuery::operator<<(float s)
{
    q = QString(q).arg(QString::number(s));
    return *this;
}

MyQuery &MyQuery::operator<<(double s)
{
    q = QString(q).arg(QString::number(s));
    return *this;
}

QString MyQuery::toStr()
{
    return q;
}
