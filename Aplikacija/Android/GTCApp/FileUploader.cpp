#include"FileUploader.h"

void FileUploader::ReplyAnswer(QNetworkReply *reply){
    qDebug() << "UPLOAD Reply: " <<  reply->readAll();
}

FileUploader::FileUploader()
{
    manager = new QNetworkAccessManager();
    QObject::connect(manager, &QNetworkAccessManager::finished, this, &FileUploader::ReplyAnswer);
}

bool FileUploader::uploadImage(QString imagename, QString path)
{
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    // add image
    QHttpPart imagePart;
    imagePart.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"image\"; filename=\""+imagename+".jpeg\""));
    imagePart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/jpeg"));

    // open file
    // QUrl url1("content://com.android.providers.media.documents/document/image%3A574");
    QFile file;
    file.setFileName(path);//("content://com.android.providers.media.documents/document/image%3A574");
    if (file.open(QIODevice::ReadOnly)) {

    }
    else {
        qDebug() << file.errorString();
    }

    // read file and set data into object
    QByteArray fileContent(file.readAll());
    imagePart.setBody(fileContent);
    imagePart.setHeader(QNetworkRequest::ContentLengthHeader,QVariant(fileContent.count()));
    multiPart->append(imagePart);

    // set url
    QUrl url("http://gotochillapp.000webhostapp.com/GTCAPP/upload.php");
    QNetworkRequest request(url);

    QLoggingCategory::setFilterRules("qt.network.ssl.warning=false");


    manager->post(request, multiPart);

    qDebug() << "# Done sending upload request";

    return true;
}
