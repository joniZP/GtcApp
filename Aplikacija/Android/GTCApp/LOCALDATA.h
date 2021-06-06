#ifndef LOCALDATA_H
#define LOCALDATA_H

#include <QObject>
using namespace std;

class LOCALDATA : public QObject
{
     Q_OBJECT
private:
    LOCALDATA(){

    }
    static LOCALDATA* instance;

public:
    static QString ime;
    static QString prezime;
    static QString korisnickoime;




    LOCALDATA& getInstance(){
        if(instance == NULL)
        {
            instance = new LOCALDATA();
        }
        return *instance;
    }



signals:

};

#endif // LOCALDATA_H
