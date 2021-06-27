#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <events.h>
#include "lokacijaModel.h"
#include "slikaModel.h"
#include "komentarmodel.h"
#include "dogadjajmodel.h"
#include "UcitavanjeLokacije.h"
#include "UcitavanjeDogadjaja.h"
#include "UcitavanjeKomentara.h"
#include <komentar.h>
#include <komentarmodel.h>
#include <UcitavanjeKomentara.h>
#include <QQmlContext>
#include <korisnikevents.h>
#include<MLokacija.h>
#include <MProfil.h>
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
    qmlRegisterType<UcitavanjeLokacije>("UcitavanjeLokacije",1,0,"UcitavanjeLokacije");
    qmlRegisterType<MLokacija>("MLokacija",1,0,"MLokacija");

    KorisnikEvents *ke=new KorisnikEvents();

    SlikaModel &SModel = SlikaModel::GetInstance ();
    LokacijaModel  &LModel = LokacijaModel::GetInstance();
    Dogadjajmodel &DModel=Dogadjajmodel::GetInstance();
    Komentarmodel &KModel= Komentarmodel::GetInstance();
    MProfil &profil=MProfil::GetInstance();
  //  LokacijaModel  &LModel = LokacijaModel::GetInstance();
    //Komentarmodel &KModel = Komentarmodel::GetInstance();
   // Dogadjajmodel &DModel = Dogadjajmodel::GetInstance();
 // model.dodajSliku(Slika("../ikonice/GTCLogo.png","aa","#ffffff"));
  //model.dodajSliku(Slika("../ikonice/event.png","aa","#ffffff"));
 // model.dodajSliku(Slika("../ikonice/lock.png","aa","#ffffff"));
 //   SModel.dodajSliku(slika(10,"./ikonice/GTCLogo.png","Kej","Nis"));
    //SModel.dodajSliku(slika(20,"./ikonice/event.png","Park","Leskovac"));
  //  SModel.dodajSliku(slika(30,"./ikonice/lock.png","Kej","Kragujevac"));

    UcitavanjeLokacije* ucitavanjelokacije=new UcitavanjeLokacije();
    engine.rootContext()->setContextProperty("ucitajInstance", ucitavanjelokacije);

    UcitavanjeDogadjaja* ucitavanjedogadjaja=new UcitavanjeDogadjaja();
    engine.rootContext()->setContextProperty("ucitajdogadjajInstance", ucitavanjedogadjaja);

    UcitavanjeKomentara* ucitavanjekomentara=new UcitavanjeKomentara();
    engine.rootContext()->setContextProperty("ucitajkomentarInstance", ucitavanjekomentara);

   engine.rootContext()->setContextProperty("_slika", &SModel);
   engine.rootContext()->setContextProperty("_LModel", &LModel);
   engine.rootContext()->setContextProperty("_DModel", &DModel);
   engine.rootContext()->setContextProperty("_KModel", &KModel);
    engine.rootContext()->setContextProperty("korisnikEvents", ke);
    engine.rootContext()->setContextProperty("_profil", &profil);
   engine.load(url);


    return app.exec();
}
