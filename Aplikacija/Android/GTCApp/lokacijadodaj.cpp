#include "lokacijadodaj.h"
lokacijaDodaj * lokacijaDodaj::instance = NULL;

lokacijaDodaj::lokacijaDodaj()
{

}
/*lokacijaDodaj::lokacijaDodaj(const QString &naziv, const QString &grad,const QString &opis): naziv(naziv), grad(grad), opis(opis)
{
    listaslika=*new QList<QString>();
}*/

lokacijaDodaj &lokacijaDodaj::GetInstance()
{
    if(instance == NULL)
    {
       instance=new lokacijaDodaj();
    }
    return *instance;
}
