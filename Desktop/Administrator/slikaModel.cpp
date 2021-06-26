#include"slikaModel.h"
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
