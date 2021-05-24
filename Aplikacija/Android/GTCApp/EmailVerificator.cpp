#include"EmailVerificator.h"

#ifndef VERIFICATOR
#define VERIFICATOR

EmailVerificator * EmailVerificator::instance = NULL;


#endif



void EmailVerificator::ReplyAnswer(QNetworkReply *reply){
    qDebug() << "EMAIL VERIFICATION Reply: " <<  reply->readAll();
}

EmailVerificator::EmailVerificator(){
    manager = new QNetworkAccessManager(this);
    QObject::connect(manager, &QNetworkAccessManager::finished, this, &EmailVerificator::ReplyAnswer);
}

EmailVerificator &EmailVerificator::GetInstance()
{
    if(instance == NULL)
    {
        instance = new EmailVerificator();
    }
    return *instance;
}

void EmailVerificator::SendVerificationEmail(QString email, QString username, QString fullname)
{
    QUrlQuery params;
    params.addQueryItem("email", email);
    params.addQueryItem("username", username);
    params.addQueryItem("fullname", fullname);
    params.addQueryItem("table","Users");
    QUrl ur("http://gotochillapp.000webhostapp.com/GTCAPP/MyMailer/Verification/MailVerification.php");
    QNetworkRequest req(ur);


    req.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    manager->post(req, params.query().toUtf8());
}

void EmailVerificator::SendForgotPasswordEmail(QString email, QString username, QString fullname)
{
    QUrlQuery params;
    params.addQueryItem("email", email);
    params.addQueryItem("username", username);
    params.addQueryItem("fullname", fullname);
    params.addQueryItem("table","Users");
    QUrl ur("http://gotochillapp.000webhostapp.com/GTCAPP/MyMailer/ForgotPassword/MailForgotPassword.php");
    QNetworkRequest req(ur);


    req.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    manager->post(req, params.query().toUtf8());
}


