#include "prijateljimodel.h"
PrijateljiModel * PrijateljiModel::instance = NULL;

PrijateljiModel::PrijateljiModel()
{

}
PrijateljiModel &PrijateljiModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new PrijateljiModel();
    }
    return *instance;
}
void PrijateljiModel::dodajPrijatelja(const profillistelement &o)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_prijatelji << o;
    endInsertRows();
}

void PrijateljiModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_prijatelji.count()>0)
    {
        m_prijatelji.removeFirst();
    }
    endRemoveRows();
}

void PrijateljiModel::obrisi(int i)
{
    beginRemoveRows(QModelIndex(),i,i);
    if(m_prijatelji.count()>0)
    {
        m_prijatelji.removeAt(i);
    }
    endRemoveRows();
}

void PrijateljiModel::removeAll()
{
    beginRemoveRows(QModelIndex(), 0,m_prijatelji.count());
    m_prijatelji.clear();
    endRemoveRows();
}
int PrijateljiModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_prijatelji.count();
}

QVariant PrijateljiModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_prijatelji.count())
    {
        return QVariant();
    }
    const profillistelement &z = m_prijatelji[index.row()];
    if (role == SlikaRole)
    {
        return z.slika();
    }
    else if (role == ImeRole)
    {
        return z.ime();
    }
    else if(role==IdKorisnikaRole)
    {
        return z.korisnickoime();
    }

    return QVariant();
}

QHash<int, QByteArray> PrijateljiModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    roles[ImeRole] = "ime";
    roles[IdKorisnikaRole] = "korisnickoime";
    return roles;
}


