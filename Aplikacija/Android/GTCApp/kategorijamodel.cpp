#include <KategorijaModel.h>
KategorijaModel * KategorijaModel::instance = NULL;
KategorijaModel::KategorijaModel()
{

}
KategorijaModel &KategorijaModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new KategorijaModel();
    }
    return *instance;
}
void KategorijaModel::dodajkategoriju(const Kategorija &kat)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_kategorije << kat;
    endInsertRows();
}
int KategorijaModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_kategorije.count();
}

QVariant KategorijaModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_kategorije.count())
    {
        return QVariant();
    }
    const Kategorija &k = m_kategorije[index.row()];
    if (role == KategorijaRole)
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

QHash<int, QByteArray> KategorijaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[KategorijaRole] = "kategorija";
    roles[CekiranRole] = "cekirana";
    roles[IndeksRole] = "indeks";
    return roles;
}


