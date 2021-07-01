#ifndef LIKE_H
#define LIKE_H

#include <QObject>
#include <MySqlService.h>
#include<LINKS.h>
#include<LOCALDATA.h>

enum Tip{
    LokacijaTip,
    DogadjajTip
};


class Like : public QObject
{
    Q_OBJECT


private:
 static bool liked;
 static bool loadLiked;
 static QTimer *liketimer;
 static Like * instance;
 static Tip tip;
 static int id;

 Like()
 {
     liketimer = new QTimer(this);
     connect(liketimer, &QTimer::timeout, this, QOverload<>::of(&Like::sacuvajLikeUBazu));
 }

public:

 static Like& GetInstance()
 {
     if(instance == NULL)
         instance = new Like();
     return *instance;
 }



 static void sacuvajLikeUBazu(){
       liketimer->stop();

      if(liked != loadLiked)
      {
          loadLiked = liked;
          if(liked)
          {
              insertLike(id,tip);
          }
          else
          {
              deleteLike(id,tip);
          }
      }

 }
 static void setParameters(int id, Tip tip)
 {
     Like::id = id;
     Like::tip = tip;
     Like::liked = isLiked();
     Like::loadLiked = liked;
 }


Q_INVOKABLE
 static bool isLiked()
 {
     MySqlService &s = MySqlService::MySqlInstance();
     MySqlTable t;
     MyQuery query("SELECT * FROM %1 WHERE %2=%3 and idProfila='%4'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
     if(tip == Tip::LokacijaTip)
        query<<"LokacijaLikes"<<"idLokacije"<<id<<LOCALDATA::mProfil->getKorisnickoIme();
     else
        query<<"DogadjajLikes"<<"idDogadjaja"<<id<<LOCALDATA::mProfil->getKorisnickoIme();

      t = s.WSendQuery(query);
     if(t.isSuccessfully())
     {
         return t.Count() > 0;
     }
 }

Q_INVOKABLE
static  QString vratiIkonicu()
 {
     if(liked)
     {
        return "qrc:/new/prefix1/heart.png";
     }
     else
     {
        return "qrc:/new/prefix1/like.png";
     }
 }
Q_INVOKABLE
 static void clickOnLike()
 {
     liked = !liked;
     liketimer->stop();
     liketimer->start(2000);
 }


 static void insertLike(int id, Tip tip)
 {

     MySqlService &s = MySqlService::MySqlInstance();
     MyQuery query("INSERT INTO %1 SET %2=%3, idProfila='%4'");
     if(tip == Tip::LokacijaTip)
        query<<"LokacijaLikes"<<"idLokacije"<<id<<LOCALDATA::mProfil->getKorisnickoIme();
     else
        query<<"DogadjajLikes"<<"idDogadjaja"<<id<<LOCALDATA::mProfil->getKorisnickoIme();
     s.SendQuery(query);

 }

 static void deleteLike(int id, Tip tip)
 {
         MySqlService &s = MySqlService::MySqlInstance();
         MyQuery query("DELETE FROM %1 WHERE %2=%3 and idProfila='%4'");//("SELECT * FROM KomentariLokacije WHERE idLokacije='%1'");
         if(tip == Tip::LokacijaTip)
            query<<"LokacijaLikes"<<"idLokacije"<<id<<LOCALDATA::mProfil->getKorisnickoIme();
         else
            query<<"DogadjajLikes"<<"idDogadjaja"<<id<<LOCALDATA::mProfil->getKorisnickoIme();
        // qDebug()<<query.toStr();
         s.SendQuery(query);
 }




    //explicit Like(QObject *parent = nullptr);

signals:

};

#endif // LIKE_H
