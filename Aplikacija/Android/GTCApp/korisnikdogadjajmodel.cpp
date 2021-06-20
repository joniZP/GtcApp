#include"korisnikdogadjajmodel.h"
KorisnikDogadjajModel * KorisnikDogadjajModel::instance = NULL;
KorisnikDogadjajModel::KorisnikDogadjajModel()
{

}
KorisnikDogadjajModel &KorisnikDogadjajModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new KorisnikDogadjajModel();
    }
    return *instance;
}
void KorisnikDogadjajModel::dodajdogadjaj(const Dogadjaj &dog)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_dogadjaji << dog;
    endInsertRows();
}
int KorisnikDogadjajModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_dogadjaji.count();
}

QVariant KorisnikDogadjajModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_dogadjaji.count())
    {
        return QVariant();
    }
    const Dogadjaj &dogadjaj = m_dogadjaji[index.row()];
    if (role == TipRole)
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
    }
    return QVariant();
}

QHash<int, QByteArray> KorisnikDogadjajModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TipRole] = "tip";
    roles[OpisRole] = "opis";
    roles[VremeRole] = "vreme";
    roles[IdRole] = "id";
    return roles;
}


