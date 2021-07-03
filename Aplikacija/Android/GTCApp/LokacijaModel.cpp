#include"LokacijaModel.h"
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
void LokacijaModel::dodajlokaciju(const lokacija &lok)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_lokacije << lok;
    endInsertRows();
}

void LokacijaModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_lokacije.count()>0)
    {
        m_lokacije.removeFirst();
    }
    endRemoveRows();
}

void LokacijaModel::removeAll()
{
    beginRemoveRows(QModelIndex(), 0,m_lokacije.count());
    m_lokacije.clear();
    endRemoveRows();
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

QHash<int, QByteArray> LokacijaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    roles[NazivRole] = "naziv";
    roles[GradRole] = "grad";
    roles[IdRole] = "id";
    return roles;
}


