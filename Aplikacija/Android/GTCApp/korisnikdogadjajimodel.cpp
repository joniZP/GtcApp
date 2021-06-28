#include "korisnikdogadjajimodel.h"

KorisnikDogadjajiModel * KorisnikDogadjajiModel::instance = NULL;
KorisnikDogadjajiModel::KorisnikDogadjajiModel()
{

}
KorisnikDogadjajiModel &KorisnikDogadjajiModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new KorisnikDogadjajiModel();
    }
    return *instance;
}
void KorisnikDogadjajiModel::dodajdogadjaj(const lokacija &dog)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_dogadjaji << dog;
    endInsertRows();
}
int KorisnikDogadjajiModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_dogadjaji.count();
}

QVariant KorisnikDogadjajiModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_dogadjaji.count())
    {
        return QVariant();
    }
    const lokacija &dogadjaj = m_dogadjaji[index.row()];
    /*if (role == TipRole)
    {
        return dogadjaj.tip();
    }
    else if (role == OpisRole)
    {
        return dogadjaj.opis();
    }
    else if(role==IdRole)
    {
        return dogadjaj.id();
    }
    else if(role==VremeRole)
    {
        return dogadjaj.vreme();
    }*/
    return QVariant();
}

QHash<int, QByteArray> KorisnikDogadjajiModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TipRole] = "tip";
    roles[OpisRole] = "opis";
    roles[VremeRole] = "vreme";
    roles[IdRole] = "id";
    return roles;
}


