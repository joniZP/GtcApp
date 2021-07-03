#include<back.h>

QString back::idLDP = "-1";

QString back::getNatpis()
{
    return natpis;
}

QString back::getIcon()
{
    if(natpis=="Početna")
    {
        return "qrc:/new/prefix1/dropdown-menu-icon-20.jpg";
    }
    else
    {
        return "qrc:/new/prefix1/backicon.png";
    }
}

QString back::getIdLDP()
{
    return idLDP;
}

QString back::nazad(QString tr)
{
    struktura pom;
    if(lista->count()==1)
    {
        qDebug()<<"1";
        pom=lista->back();
    }
    else if(lista->count()>1)
    {
        qDebug()<<lista->count();
        pom=lista->back();
        lista->pop_back();
        while(pom.stranica==tr || pom.stranica=="qrc:/prijava.qml" || pom.stranica=="qrc:/registracija.qml" || pom.stranica=="qrc:/DodajLokaciju.qml" || pom.stranica=="qrc:/DodajDogadjaj.qml"|| pom.stranica=="qrc:/izmeniprofil.qml"|| pom.stranica=="qrc:/zaboravljena_lozinka.qml")// if(source != "qrc:/prijava.qml" && source != "qrc:/registracija.qml" && source != "qrc:/DodajLokaciju.1ml" && source !="qrc:/DodajDogadjaj")
        {
            pom=lista->back();
            if(lista->count()>1)
            {
                lista->pop_back();
            }

        }
    }
    natpis=pom.natpis;
    back_=true;
    qDebug()<<"natpis" <<natpis;
    idLDP = pom.id;
    return pom.stranica;

}

void back::napred(QString p, QString n, QString id)
{
    if(back_==false)
    {
        struktura pom;
        natpis=n;
        pom.natpis=n;
        pom.stranica=p;
        pom.id = id;
        lista->push_back(pom);
    }
    back_=false;
}

QString back::getLastSource()
{
    if(!lista->isEmpty())
        return lista->back().stranica;
    else
        return "qrc:/pocetna.qml";
}

QString back::getLastId()
{
    if(!lista->isEmpty())
        return lista->back().id;
    else
        return "-1";
}
