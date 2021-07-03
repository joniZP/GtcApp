#ifndef LOCALDATA_H
#define LOCALDATA_H

#include <QObject>
#include<MySqlService.h>
#include<LINKS.h>
#include<MProfil.h>
using namespace std;

class LOCALDATA : public QObject
{
     Q_OBJECT
private:

    static LOCALDATA* instance;

public:
    static bool ulogovan;
    static MProfil *mProfil;
    static int brobavestenja;



    LOCALDATA()
    {

    }
    Q_INVOKABLE
    void initMProfil();

    Q_INVOKABLE
    bool getUlogovan();

    Q_INVOKABLE
    int getBrObavestenja();

    Q_INVOKABLE
    MProfil* getMProfil();



signals:

};

#endif // LOCALDATA_H
