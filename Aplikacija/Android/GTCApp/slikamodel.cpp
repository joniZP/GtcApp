#include"slikamodel.h"
SlikaModel * SlikaModel::instance = NULL;
SlikaModel::SlikaModel()
{

}
SlikaModel &SlikaModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new SlikaModel();
    }
    return *instance;
}
void SlikaModel::dodajSliku(const QString slika)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_slike << slika;
    endInsertRows();
}

void SlikaModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_slike.count()>0)
    {
        m_slike.removeFirst();
    }
    endRemoveRows();
}

void SlikaModel::removeAll()
{
    beginRemoveRows(QModelIndex(), 0,m_slike.count());
    m_slike.clear();
    endRemoveRows();
}
int SlikaModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_slike.count();
}

QVariant SlikaModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_slike.count())
    {
        return QVariant();
    }
    const QString &slika = m_slike[index.row()];
    if (role == SlikaRole)
    {
        return slika;
    }
    return QVariant();
}

QHash<int, QByteArray> SlikaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    return roles;
}
