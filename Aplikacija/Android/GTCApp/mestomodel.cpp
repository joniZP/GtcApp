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

void MestoModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_mesta.count()>0)
    {
        m_mesta.removeFirst();
    }
    endRemoveRows();
}

void MestoModel::removeAll()
{
    beginRemoveRows(QModelIndex(), 0,m_mesta.count());
    m_mesta.clear();
    endRemoveRows();
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
    roles[MestoRole] = "mesto";
    roles[CekiranRole] = "cekirana";
    roles[IndeksRole] = "indeks";
    return roles;
}

void MestoModel::dodaj(int i)
{
    if(m_mesta[i].cekirana()==false)
    {
        m_mesta[i].setCekirana(true);
    }
    else
    {
        m_mesta[i].setCekirana(false);
    }
    qDebug()<<m_mesta[i].cekirana();
}

void MestoModel::ukloni(int i)
{
    m_mesta[i].setCekirana(true);
}

void MestoModel::reset()
{
    for(int i=0;i<m_mesta.length();i++)
    {
        m_mesta[i].setCekirana(false);
    }
}


