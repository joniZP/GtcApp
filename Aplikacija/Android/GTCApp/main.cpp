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
#include"slikamodel.h"
#include<kategorijamodel.h>
#include<PretragaLokacija.h>
#include<mestomodel.h>
#include<KorisnikEvents.h>
#include<LOCALDATA.h>
#include<QSqlQuery>
#include<obavestenjamodel.h>
#include<zahtevimodel.h>
#include<korisnikdogadjajmodel.h>
#include<korisniklokacijamodel.h>
#include<UcitavanjeProfila.h>
#include<MProfil.h>
#include<prijateljimodel.h>
#include<prijateljievents.h>
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

    //--------------------------[ MODELI ] --------------------------------------------
    LokacijaModel &model =LokacijaModel::GetInstance();
    KomentariModel &kommodel =KomentariModel::GetInstance();
    SlikaModel &slikamodel =SlikaModel::GetInstance();
    KategorijaModel &kategorijamodel=KategorijaModel::GetInstance();
    MestoModel &mestomodel=MestoModel::GetInstance();
    ObavestenjaModel &obavestenjamodel=ObavestenjaModel::GetInstance();
    ZahteviModel &zahtevimodel=ZahteviModel::GetInstance();
    KorisnikDogadjajModel &korisnikdogadjajmodel = KorisnikDogadjajModel::GetInstance();
    KorisnikLokacijaModel &korisniklokacijamodel = KorisnikLokacijaModel::GetInstance();
    PrijateljiModel &prijateljimodel = PrijateljiModel::GetInstance();


    engine.rootContext()->setContextProperty("_kommodel", &kommodel);
    engine.rootContext()->setContextProperty("_mestomodel", &mestomodel);
    engine.rootContext()->setContextProperty("_katmodel", &kategorijamodel);
    engine.rootContext()->setContextProperty("_model", &model);
    engine.rootContext()->setContextProperty("_slikamodel", &slikamodel);
    engine.rootContext()->setContextProperty("_obavestenjamodel", &obavestenjamodel);
    engine.rootContext()->setContextProperty("_zahtevimodel", &zahtevimodel);
    engine.rootContext()->setContextProperty("_korisnikdogadjajmodel", &korisnikdogadjajmodel);
    engine.rootContext()->setContextProperty("_korisniklokacijamodel", &korisniklokacijamodel);
    engine.rootContext()->setContextProperty("_prijateljimodel", &prijateljimodel);


    zahtevimodel.dodajzahtev(zahtev("qrc:/new/prefix1/change.png","Ime","ID",false));
    zahtevimodel.dodajzahtev(zahtev("qrc:/new/prefix1/change.png","Ime1","ID",false));
    zahtevimodel.dodajzahtev(zahtev("qrc:/new/prefix1/change.png","Ime2","ID",false));

    obavestenjamodel.dodajobavestenje(obavestenje("qrc:/new/prefix1/change.png","TEKST","ID",false,true));
    obavestenjamodel.dodajobavestenje(obavestenje("qrc:/new/prefix1/change.png","TEKST","ID",false,false));

    //--------------------------[ IMPORTI ] --------------------------------------------
    qmlRegisterType<events>("Events",1,0,"Events");
    qmlRegisterType<klasa>("Klasa",1,0,"Klasa");
    qmlRegisterType<UcitavanjeLokacije>("UcitavanjeLokacije",1,0,"UcitavanjeLokacije");
    qmlRegisterType<PretragaLokacija>("PretragaLokacija",1,0,"PretragaLokacija");
    qmlRegisterType<MLokacija>("MLokacija",1,0,"MLokacija");
    qmlRegisterType<UpisLokacijaDogadjaj>("UpisLokacijaDogadjaj",1,0,"UpisLokacijaDogadjaj");
    qmlRegisterType<KorisnikEvents>("KorisnikEvents",1,0,"KorisnikEvents");
    qmlRegisterType<LOCALDATA>("LOCALDATA",1,0,"LOCALDATA");
    qmlRegisterType<UcitavanjeProfila>("UcitavanjeProfila",1,0,"UcitavanjeProfila");
    qmlRegisterType<MProfil>("MProfil",1,0,"MProfil");
    qmlRegisterType<PrijateljiEvents>("PrijateljiEvents",1,0,"PrijateljiEvents");

    engine.load(url);

    //--------------------------[ TEST ] --------------------------------------------
      kategorijamodel.dodajkategoriju(Kategorija("sport",false,0));
      kategorijamodel.dodajkategoriju(Kategorija("izlet",false,1));
      kategorijamodel.dodajkategoriju(Kategorija("fudbal",false,2));
      mestomodel.dodajmesto(Kategorija("Nis",false,0));
      mestomodel.dodajmesto(Kategorija("Leskovac",false,1));
      mestomodel.dodajmesto(Kategorija("Beograd",false,2));
      mestomodel.dodajmesto(Kategorija("Sombor",false,3));


    return app.exec();
}
