#ifndef FILEUPLOADER_H
#define FILEUPLOADER_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>


//#include <QGuiApplication>
//#include <QQmlApplicationEngine>
#include <QFile>
#include <string>
#include <QHttpMultiPart>
#include <QLoggingCategory>
#include <QTextStream>


class FileUploader: public QObject{
    Q_OBJECT
private:
    QNetworkAccessManager * manager;

    void ReplyAnswer(QNetworkReply *reply);

    static FileUploader* instance;
public:
    FileUploader();
     static FileUploader& GetInstance();

    Q_INVOKABLE bool uploadImage(QString imagename, QString path);

signals:
    void imageUploaded();
};

#endif // FILEUPLOADER_H
