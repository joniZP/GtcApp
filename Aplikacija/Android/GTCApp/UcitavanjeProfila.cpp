#include "UcitavanjeProfila.h"
 int UcitavanjeProfila::ocena=0;
 int UcitavanjeProfila::prvaocena=0;
 bool UcitavanjeProfila::ocenio=0;
 int UcitavanjeProfila::loadOcena=0;
 QTimer * UcitavanjeProfila::ocenatimer=NULL;
 MProfil * UcitavanjeProfila::profil=NULL;

 UcitavanjeProfila::UcitavanjeProfila()
 {
     ocenatimer = new QTimer(this);
     connect(ocenatimer, &QTimer::timeout, this, QOverload<>::of(&UcitavanjeProfila::sacuvajOcenuUBazu));
 }

 MProfil *UcitavanjeProfila::getProfil(QString korisnickoime)
 {

     MySqlService &s = MySqlService::MySqlInstance();
     MySqlTable t;

     MyQuery query("SELECT Korisnik.*,(SELECT ocena from KorisnikOcene WHERE ocenio='%1' and ocenjen='%2') as ocenio, (SELECT AVG(ocena) from KorisnikOcene WHERE ocenjen='%2') as prosecnaocena,(SELECT count(*) from KorisnikOcene WHERE ocenjen='%2') as brojocena  FROM Korisnik WHERE korisnickoIme='%2'");//("SELECT * FROM Lokacija WHERE Id='%1'");
     query<<LOCALDATA::mProfil->getKorisnickoIme()<<korisnickoime;
     t = s.WSendQuery(query);

     if(t.isSuccessfully())
     {
         if(t.Count()>0)
         {
             profil = new MProfil(t.Rows[0]["korisnickoIme"],t.Rows[0]["ime"],t.Rows[0]["prezime"],t.Rows[0]["email"],t.Rows[0]["lozinka"],t.Rows[0]["prosecnaocena"]=="NULL"?0:t.Rows[0]["prosecnaocena"].toFloat(),t.Rows[0]["verifikovan"].toInt(),t.Rows[0]["brojocena"].toInt(),t.Rows[0]["telefon"], t.Rows[0]["slika"].toInt());
             if(profil->getSlika() == 1)
             {
                 profil->setSlikaURL(LINKS::getProfilePicture(korisnickoime));
             }
             else
             {
                 profil->setSlikaURL(LINKS::getProfileDefaultPicture());
             }
             loadOcena = t.Rows[0]["ocenio"]==""? -1: t.Rows[0]["ocenio"].toInt();
             // qDebug()<<"dsfgvergertgh"<<t.Rows[0]["ocenio"];
             ocenio=t.Rows[0]["ocenio"]==""? false:true;
             ocena = loadOcena;
             prvaocena=ocena;
             ucitajLokacijeiDogadjaje(korisnickoime);

         }
     }
     return profil;
 }

 QString UcitavanjeProfila::ocenjen()
 {
     if(ocenio==false)
     {
         qDebug()<<profil->getOcena();
         qDebug()<<profil->getBrojOcena();
         qDebug()<<ocena;

         return  QString::number((profil->getOcena()*profil->getBrojOcena()+ocena)/(profil->getBrojOcena()+1)).left(4);

     }
     else
     {
         return QString::number((profil->getOcena()*profil->getBrojOcena()-prvaocena+ocena)/(profil->getBrojOcena())).left(4);
     }
 }

 void UcitavanjeProfila::ucitajLokacijeiDogadjaje(QString korisnickoime)
 {
     MySqlService &s = MySqlService::MySqlInstance();
     MyQuery query;
     MySqlTable lokacijatable;
     query = "SELECT * FROM Lokacija WHERE idKorisnika='%1' and Verifikovana=1";
     query<<korisnickoime;

     lokacijatable = s.WSendQuery(query);

     if(lokacijatable.isSuccessfully())
     {
         KorisnikLokacijaModel &klmodel = KorisnikLokacijaModel::GetInstance();
         klmodel.removeAll();
         for(int i=0;i<lokacijatable.Count();i++)
         {
             QString slikapom =  (lokacijatable.Rows[i]["brojSlika"].toInt()) > 0 ? LINKS::getLocationPicture(lokacijatable.Rows[i]["id"].toInt(),0) : LINKS::getNoImageAvailable();
             klmodel.dodajlokaciju(lokacija(lokacijatable.Rows[i]["id"].toInt(),slikapom, lokacijatable.Rows[i]["naziv"], lokacijatable.Rows[i]["grad"]));
         }

     }


     MySqlTable dogadjajitable;

     query = "SELECT * FROM Dogadjaj WHERE idKorisnika='%1'";
     query<<korisnickoime;

     dogadjajitable = s.WSendQuery(query);

     if(dogadjajitable.isSuccessfully())
     {
         KorisnikDogadjajModel &kdmodel = KorisnikDogadjajModel::GetInstance();
         kdmodel.removeAll();
         for(int i = 0; i< dogadjajitable.Count();i++)
         {
             kdmodel.dodajdogadjaj(Dogadjaj(dogadjajitable.Rows[i]["idDogadjaja"].toInt(), dogadjajitable.Rows[i]["tip"], dogadjajitable.Rows[i]["vreme"], dogadjajitable.Rows[i]["opis"]));
         }

     }
 }

 void UcitavanjeProfila::sacuvajOcenuUBazu(){
     ocenatimer->stop();
     if(ocena != loadOcena)
     {
         loadOcena = ocena;
         insertOrUpdateOcena();
     }
 }

 int UcitavanjeProfila::vratiOcenu()
 {
     return ocena;
 }

 void UcitavanjeProfila::clickOnOcena(int o)
 {
     ocena = o;
     ocenatimer->stop();
     ocenatimer->start(2000);
 }

 void UcitavanjeProfila::insertOrUpdateOcena()
 {
     MySqlService &s = MySqlService::MySqlInstance();
     MyQuery query("INSERT INTO KorisnikOcene VALUES('%1','%2','%3') ON DUPLICATE KEY UPDATE ocena='%3'");
     query<<LOCALDATA::mProfil->getKorisnickoIme()<<profil->getKorisnickoIme()<<ocena;
     s.SendQuery(query);
 }
