#include "dogadjajdodaj.h"
DogadjajDodaj * DogadjajDodaj::instance = NULL;
/*DogadjajDodaj::DogadjajDodaj(QObject *parent) : QObject(parent)
{

}*/
DogadjajDodaj::DogadjajDodaj()
{

}

DogadjajDodaj &DogadjajDodaj::GetInstance()
{
    if(instance == NULL)
    {
       instance=new DogadjajDodaj();
    }
    return *instance;
}
