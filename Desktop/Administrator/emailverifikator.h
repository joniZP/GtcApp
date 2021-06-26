#ifndef EMAILVERIFIKATOR_H
#define EMAILVERIFIKATOR_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>

class EmailVerifikator: public QObject{
    Q_OBJECT

private:
    static EmailVerifikator* instance;
    EmailVerifikator();
    QNetworkAccessManager *manager;

public:
     static EmailVerifikator& GetInstance()
     {
         if(instance == NULL)
         {
             instance = new EmailVerifikator();
         }
         return *instance;
     }

    void SendVerificationEmail(QString email, QString username, QString fullname)
     {
        QUrlQuery params;
        params.addQueryItem("email", email);
        params.addQueryItem("username", username);
        params.addQueryItem("fullname", fullname);

        QUrl ur("http://humanads.000webhostapp.com/MailVerification.php");
        QNetworkRequest req(ur);


        req.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
        manager->post(req, params.query().toUtf8());
     }

};

#endif // EMAILVERIFIKATOR_H
