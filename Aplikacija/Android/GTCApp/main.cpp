#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <events.h>
#include <QSslSocket>
#include<QQmlContext>
#include<QLoggingCategory>
#include<upload.h>
//#include"markermodel.h"
#include"ucitavanjelokacije.h"
#include"UpisLokacijaDogadjaj.h"
//#include<komentarimodel.h>
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
    qmlRegisterType<klasa>("Klasa",1,0,"Klasa");
    qmlRegisterType<UcitavanjeLokacije>("UcitavanjeLokacije",1,0,"UcitavanjeLokacije");
    qmlRegisterType<MLokacija>("MLokacija",1,0,"MLokacija");
    qmlRegisterType<UpisLokacijaDogadjaj>("UpisLokacijaDogadjaj",1,0,"UpisLokacijaDogadjaj");
    engine.load(url);
     LokacijaModel &model =LokacijaModel::GetInstance();
     KomentariModel &kommodel =KomentariModel::GetInstance();
     model.dodajlokaciju(lokacija("http://gtcappservice.000webhostapp.com/GTCAPP/upload/slika.jpeg","s",""));
     model.dodajlokaciju(lokacija("http://gtcappservice.000webhostapp.com/GTCAPP/upload/slika.jpeg","s",""));
     model.dodajlokaciju(lokacija("/new/prefix1/person-icon.png","s",""));
     model.dodajlokaciju(lokacija("/new/prefix1/person-icon.png","s",""));
    // kommodel.dodajkomentar(Komentar("http://gtcappservice.000webhostapp.com/GTCAPP/upload/slika.jpeg","neki komentar  dsdsdsd dsds dsds d dsds sd s ",""));
     FileUploader *f = new FileUploader();
    // MarkerModel & m=MarkerModel::GetInstance();

    // f->UploadFiles();
     MySqlService &s = MySqlService::MySqlInstance();
    engine.rootContext()->setContextProperty("_model", &model);
    // engine.rootContext()->setContextProperty("markerModel", &m);
     engine.rootContext()->setContextProperty("_kommodel", &kommodel);
   // EmailVerificator &ev = EmailVerificator::GetInstance();
    //ev.SendVerificationEmail("sgssasa@elfak.rs","Sasa","Sasa Stojiljkovic");





    return app.exec();
}
