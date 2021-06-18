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
    LokacijaModel &model =LokacijaModel::GetInstance();
    //neke lokacije /////////////////////////////////
    /// \brief kommodel
    model.dodajlokaciju(lokacija(0, "http://humanads.000webhostapp.com/upload/slika.jpeg","s",""));
    model.dodajlokaciju(lokacija(1, "http://humanads.000webhostapp.com/upload/slika.jpeg","s",""));
    model.dodajlokaciju(lokacija(2, "/new/prefix1/person-icon.png","s",""));
    model.dodajlokaciju(lokacija(3, "/new/prefix1/person-icon.png","s",""));

    KomentariModel &kommodel =KomentariModel::GetInstance();
    SlikaModel &slikamodel =SlikaModel::GetInstance();
    KategorijaModel &kategorijamodel=KategorijaModel::GetInstance();
    MestoModel &mestomodel=MestoModel::GetInstance();
    qmlRegisterType<events>("Events",1,0,"Events");
    qmlRegisterType<klasa>("Klasa",1,0,"Klasa");
    qmlRegisterType<UcitavanjeLokacije>("UcitavanjeLokacije",1,0,"UcitavanjeLokacije");
    qmlRegisterType<PretragaLokacija>("PretragaLokacija",1,0,"PretragaLokacija");
    qmlRegisterType<MLokacija>("MLokacija",1,0,"MLokacija");
    qmlRegisterType<UpisLokacijaDogadjaj>("UpisLokacijaDogadjaj",1,0,"UpisLokacijaDogadjaj");
    engine.rootContext()->setContextProperty("_kommodel", &kommodel);
    engine.rootContext()->setContextProperty("_mestomodel", &mestomodel);
    engine.rootContext()->setContextProperty("_katmodel", &kategorijamodel);
    engine.rootContext()->setContextProperty("_model", &model);
    engine.rootContext()->setContextProperty("_slikamodel", &slikamodel);
    engine.load(url);

      MySqlService &s = MySqlService::MySqlInstance();
      MySqlTable t;
      MyQuery query("SELECT * FROM Lokacija");
      t = s.WSendQuery(query);
      if(t.isSuccessfully())
      {

              for (int i=0;i<t.Count();i++)
              {
                  if(t.Rows[i]["brojSlika"].toInt() == 0)
                  {
                      model.dodajlokaciju(lokacija(t.Rows[i]["id"].toInt(),LINKS::APILINK+"/upload/noimageavailable.jpeg",t.Rows[i]["naziv"],t.Rows[i]["grad"]));
                  }
                  else
                  {
                       model.dodajlokaciju(lokacija(t.Rows[i]["id"].toInt(),LINKS::getLocationPicture(t.Rows[i]["id"].toInt(),0),t.Rows[i]["naziv"],t.Rows[i]["grad"]));
                  }

              }
      }
       //PretragaLokacija p;
       //p.pretrazi("neki tamo opis");

          kategorijamodel.dodajkategoriju(Kategorija("sport",false,0));
          kategorijamodel.dodajkategoriju(Kategorija("izlet",false,1));
          kategorijamodel.dodajkategoriju(Kategorija("fudbal",false,2));
          mestomodel.dodajmesto(Kategorija("Nis",false,0));
          mestomodel.dodajmesto(Kategorija("Leskovac",false,1));
          mestomodel.dodajmesto(Kategorija("Beograd",false,2));
          mestomodel.dodajmesto(Kategorija("Sombor",false,3));

    // kommodel.dodajkomentar(Komentar("http://gtcappservice.000webhostapp.com/GTCAPP/upload/slika.jpeg","neki komentar  dsdsdsd dsds dsds d dsds sd s ",""));
     FileUploader *f = new FileUploader();
    // MarkerModel & m=MarkerModel::GetInstance();

    // f->UploadFiles();


    // engine.rootContext()->setContextProperty("markerModel", &m);

   // EmailVerificator &ev = EmailVerificator::GetInstance();
    //ev.SendVerificationEmail("sgssasa@elfak.rs","Sasa","Sasa Stojiljkovic");





    return app.exec();
}
