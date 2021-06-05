#include "lokacijaModel.h"


LokacijaModel * LokacijaModel::instance = NULL;
LokacijaModel::LokacijaModel()
{

}
LokacijaModel &LokacijaModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new LokacijaModel();
    }
    return *instance;
}
void LokacijaModel::dodajlokaciju(const Lokacija &lok)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_lokacije << lok;
    endInsertRows();
}
int LokacijaModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_lokacije.count();
}

QVariant LokacijaModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_lokacije.count())
    {
        return QVariant();
    }
    const Lokacija &lokacija = m_lokacije[index.row()];
    if (role == NazivRole)
    {
        return lokacija.naziv();
    }
    else if (role == OpisRole)
    {
        return lokacija.opis();
    }
    else if(role==GradRole)
    {
        return lokacija.grad();
    }
    else if(role==OcenaRole)
    {
        return lokacija.Ocena();
    }
    else if(role==BrojOcenaRole)
    {
        return lokacija.brojOcena();
    }
    else if(role==BrojSlikaRoles)
    {
        return lokacija.brojSlika();
    }
    else if(role==XRole)
    {
        return lokacija.x();
    }
    else if(role==YRole)
    {
        return lokacija.y();
    }
    else if(role==IdKorisnikaRole)
    {
        return lokacija.idKorisnika();
    }
    else if(role==LikesRoles)
    {
        return lokacija.likes();
    }
    return QVariant();
}

QHash<int, QByteArray> LokacijaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NazivRole] = "naziv";
    roles[OpisRole] = "opis";
    roles[GradRole] = "grad";
    roles[OcenaRole] = "ocena";
    roles[BrojOcenaRole] = "Broj ocena";
    roles[XRole] = "x";
    roles[YRole] = "y";
    roles[LikesRoles] = "likes";
    roles[BrojSlikaRoles] = "broj slika";
    roles[IdKorisnikaRole] = "id korisnika";
    return roles;
}

