#include <mestomodel.h>
MestoModel * MestoModel::instance = NULL;
MestoModel::MestoModel()
{

}
MestoModel &MestoModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new MestoModel();
    }
    return *instance;
}
void MestoModel::dodajmesto(const Kategorija &kat)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_mesta << kat;
    endInsertRows();
}
int MestoModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_mesta.count();
}

QVariant MestoModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_mesta.count())
    {
        return QVariant();
    }
    const Kategorija &k = m_mesta[index.row()];
    if (role == MestoRole)
    {
        return k.kategorija();
    }
    else if (role == CekiranRole)
    {
        return k.cekirana();
    }
    else if (role == IndeksRole)
    {
        return k.indeks();
    }


    return QVariant();
}

QHash<int, QByteArray> MestoModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[MestoRole] = "kategorija";
    roles[CekiranRole] = "cekirana";
    roles[IndeksRole] = "indeks";
    return roles;
}


