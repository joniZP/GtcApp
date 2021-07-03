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

void KategorijaModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_kategorije.count()>0)
    {
        m_kategorije.removeFirst();
    }
    endRemoveRows();
}

int KategorijaModel::getCurrentIndex(QString k)
{
    for(int i=0;i<m_kategorije.count();i++)
    {
        if(m_kategorije[i].kategorija()==k)
        {
            return i;
        }
    }
    return 0;
}

void KategorijaModel::removeAll()
{
    beginRemoveRows(QModelIndex(), 0,m_kategorije.count());
    m_kategorije.clear();
    endRemoveRows();
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

void KategorijaModel::dodaj(int i)
{
    if(m_kategorije[i].cekirana()==false)
    {
        m_kategorije[i].setCekirana(true);
    }
    else
    {
        m_kategorije[i].setCekirana(false);
    }
    qDebug()<<m_kategorije[i].cekirana();
}

void KategorijaModel::ukloni(int i)
{
    m_kategorije[i].setCekirana(true);
}

void KategorijaModel::reset()
{
    for(int i=0;i<m_kategorije.length();i++)
    {
        m_kategorije[i].setCekirana(false);
    }
}


