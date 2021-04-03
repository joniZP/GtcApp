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
    if (role == TypeRole)
    {
        return lokacija.slika();
    }
    else if (role == SizeRole)
    {
        return lokacija.tekst();
    }
    else if(role==ColorRole)
    {
        return lokacija.boja();
    }
    return QVariant();
}

QHash<int, QByteArray> LokacijaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TypeRole] = "slika";
    roles[SizeRole] = "tekst";
    roles[ColorRole] = "boja";
    return roles;
}


