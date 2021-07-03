#include "Like.h"

bool Like::liked = false;
bool Like::loadLiked = false;
QTimer* Like::liketimer = NULL;
Tip Like::tip = Tip::LokacijaTip;
int Like::id = 0;
Like* Like::instance = NULL;

Like::Like()
{
    liketimer = new QTimer(this);
    connect(liketimer, &QTimer::timeout, this, QOverload<>::of(&Like::sacuvajLikeUBazu));
}

Like &Like::GetInstance()
{
    if(instance == NULL)
        instance = new Like();
    return *instance;
}

void Like::sacuvajLikeUBazu(){
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

void Like::setParameters(int id, Tip tip)
{
    Like::id = id;
    Like::tip = tip;
    Like::liked = isLiked();
    Like::loadLiked = liked;
}

bool Like::isLiked()
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

QString Like::vratiIkonicu()
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

void Like::clickOnLike()
{
    liked = !liked;
    liketimer->stop();
    liketimer->start(2000);
}

void Like::insertLike(int id, Tip tip)
{

    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query("INSERT INTO %1 SET %2=%3, idProfila='%4'");
    if(tip == Tip::LokacijaTip)
        query<<"LokacijaLikes"<<"idLokacije"<<id<<LOCALDATA::mProfil->getKorisnickoIme();
    else
        query<<"DogadjajLikes"<<"idDogadjaja"<<id<<LOCALDATA::mProfil->getKorisnickoIme();
    s.SendQuery(query);

}

void Like::deleteLike(int id, Tip tip)
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
