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

 Like();

public:

 static Like& GetInstance();



 static void sacuvajLikeUBazu();
 static void setParameters(int id, Tip tip);


 Q_INVOKABLE
 static bool isLiked();

 Q_INVOKABLE
 static  QString vratiIkonicu();

 Q_INVOKABLE
 static void clickOnLike();
 static void insertLike(int id, Tip tip);
 static void deleteLike(int id, Tip tip);




    //explicit Like(QObject *parent = nullptr);

signals:

};

#endif // LIKE_H
