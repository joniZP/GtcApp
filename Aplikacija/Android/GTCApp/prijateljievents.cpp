#include <prijateljievents.h>

int PrijateljiEvents::Stanje = 0;
QString PrijateljiEvents::imeprijatelja="Nema";

PrijateljiEvents::PrijateljiEvents(QObject *parent) : QObject(parent)
{

}
