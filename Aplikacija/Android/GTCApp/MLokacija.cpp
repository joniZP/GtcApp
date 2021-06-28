#include "MLokacija.h"



void MLokacija::setKreator(const QString &value)
{
    kreator = value;
}

void MLokacija::setOpis(const QString &value)
{
    opis = value;
}

void MLokacija::setGrad(const QString &value)
{
    grad = value;
}

int MLokacija::getBrSlika() const
{
    return brSlika;
}

void MLokacija::setBrSlika(int value)
{
    brSlika = value;
}

void MLokacija::setId(int value)
{
    id = value;
}
