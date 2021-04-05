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

    void ReplyAnswer(QNetworkReply *reply){
        qDebug() << "UPLOAD Reply: " <<  reply->readAll();
    }

public:
    FileUploader()
    {
         manager = new QNetworkAccessManager();
          QObject::connect(manager, &QNetworkAccessManager::finished, this, &FileUploader::ReplyAnswer);
    }

    bool UploadFiles()
    {
        QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
              // add image
              QHttpPart imagePart;
              imagePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"image\"; filename=\"slika.jpeg\""));
              imagePart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/jpeg"));

              // open file
             // QUrl url1("content://com.android.providers.media.documents/document/image%3A574");
              QFile file;
               file.setFileName("content://com.android.providers.media.documents/document/image%3A574");
               if (file.open(QIODevice::ReadOnly)) {

               }
               else {
                   qDebug() << file.errorString();
               }

              // read file and set data into object
              QByteArray fileContent(file.readAll());
              imagePart.setBody(fileContent);
              qDebug() <<"VELICINA SLIKE"<< file.readAll().count();
              imagePart.setHeader(QNetworkRequest::ContentLengthHeader,QVariant(fileContent.count()));
              multiPart->append(imagePart);

              // set url
              QUrl url("http://humanads.000webhostapp.com/upload.php");
              QNetworkRequest request(url);

             QLoggingCategory::setFilterRules("qt.network.ssl.warning=false");


              manager->post(request, multiPart);

               qDebug() << "# Done sending upload request";

           return true;
    }


};

#endif // FILEUPLOADER_H
