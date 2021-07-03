#include"korisniklokacijamodel.h"
KorisnikLokacijaModel * KorisnikLokacijaModel::instance = NULL;
KorisnikLokacijaModel::KorisnikLokacijaModel()
{

}
KorisnikLokacijaModel &KorisnikLokacijaModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new KorisnikLokacijaModel();
    }
    return *instance;
}
void KorisnikLokacijaModel::dodajlokaciju(const lokacija &lok)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_lokacije << lok;
    endInsertRows();
}

void KorisnikLokacijaModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_lokacije.count()>0)
    {
        m_lokacije.removeFirst();
    }
    endRemoveRows();
}

void KorisnikLokacijaModel::removeAll()
{
    beginRemoveRows(QModelIndex(), 0,m_lokacije.count());
    m_lokacije.clear();
    endRemoveRows();
}
int KorisnikLokacijaModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_lokacije.count();
}

QVariant KorisnikLokacijaModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_lokacije.count())
    {
        return QVariant();
    }
    const lokacija &lokacija = m_lokacije[index.row()];
    if (role == SlikaRole)
    {
        return lokacija.slika();
    }
    else if (role == NazivRole)
    {
        return lokacija.naziv();
    }
    else if(role==GradRole)
    {
        return lokacija.grad();
    }
    else if(role==IdRole)
    {
        return lokacija.id();
    }
    return QVariant();
}

QHash<int, QByteArray> KorisnikLokacijaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    roles[NazivRole] = "naziv";
    roles[GradRole] = "grad";
    roles[IdRole] = "id";
    return roles;
}


