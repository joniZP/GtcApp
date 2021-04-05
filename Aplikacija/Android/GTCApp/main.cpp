#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <events.h>
#include <QSslSocket>
#include<QQmlContext>
#include<QLoggingCategory>
#include<upload.h>
//#include"MySqlKrsta.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QLoggingCategory::setFilterRules("qt.network.ssl.warning=false");


    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Material");
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    qmlRegisterType<events>("Events",1,0,"Events");
    engine.load(url);
     LokacijaModel &model =LokacijaModel::GetInstance();
     model.dodajlokaciju(lokacija("http://humanads.000webhostapp.com/upload/slika.jpeg","s",""));
     model.dodajlokaciju(lokacija("http://humanads.000webhostapp.com/upload/slika.jpeg","s",""));
     model.dodajlokaciju(lokacija("/new/prefix1/person-icon.png","s",""));
     model.dodajlokaciju(lokacija("/new/prefix1/person-icon.png","s",""));
     FileUploader *f = new FileUploader();
    // f->UploadFiles();
     MySqlService &s = MySqlService::MySqlInstance();
    engine.rootContext()->setContextProperty("_model", &model);
   // EmailVerificator &ev = EmailVerificator::GetInstance();
    //ev.SendVerificationEmail("sgssasa@elfak.rs","Sasa","Sasa Stojiljkovic");





    return app.exec();
}
