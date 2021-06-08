#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <events.h>
#include "lokacijaModel.h"
#include "slikaModel.h"
#include "komentarmodel.h"
#include "dogadjajmodel.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    qmlRegisterType<events>("Events",1,0,"Events");


    slikamodel &SModel = slikamodel::GetInstance ();
  //  LokacijaModel  &LModel = LokacijaModel::GetInstance();
    //Komentarmodel &KModel = Komentarmodel::GetInstance();
   // Dogadjajmodel &DModel = Dogadjajmodel::GetInstance();
 // model.dodajSliku(Slika("../ikonice/GTCLogo.png","aa","#ffffff"));
  //model.dodajSliku(Slika("../ikonice/event.png","aa","#ffffff"));
 // model.dodajSliku(Slika("../ikonice/lock.png","aa","#ffffff"));
    SModel.dodajSliku(Slika(10,"./ikonice/GTCLogo.png","Kej","Nis"));
    SModel.dodajSliku(Slika(20,"./ikonice/event.png","Park","Leskovac"));
    SModel.dodajSliku(Slika(30,"./ikonice/lock.png","Kej","Kragujevac"));
   engine.load(url);
   engine.rootContext()->setContextProperty("_slika", &SModel);



    return app.exec();
}
