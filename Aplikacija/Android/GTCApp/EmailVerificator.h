#ifndef EMAILVERIFICATOR_H
#define EMAILVERIFICATOR_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>

class EmailVerificator: public QObject{
    Q_OBJECT

private:
    static void ReplyAnswer(QNetworkReply * reply);

    static EmailVerificator* instance;
    EmailVerificator();
    QNetworkAccessManager *manager;

public:
     static EmailVerificator& GetInstance();

     void SendVerificationEmail(QString email, QString username, QString fullname);
     void SendForgotPasswordEmail(QString email, QString username, QString fullname);


};

#endif // EMAILVERIFIKATOR_H
