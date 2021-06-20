#include <zahtevimodel.h>
ZahteviModel * ZahteviModel::instance = NULL;

ZahteviModel::ZahteviModel()
{

}
ZahteviModel &ZahteviModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new ZahteviModel();
    }
    return *instance;
}
void ZahteviModel::dodajzahtev(const zahtev &o)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_zahtevi << o;
    endInsertRows();
}
int ZahteviModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_zahtevi.count();
}

QVariant ZahteviModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_zahtevi.count())
    {
        return QVariant();
    }
    const zahtev &z = m_zahtevi[index.row()];
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
        return z.id();
    }
    else if(role==PrihvacenRole)
    {
        return z.prihvacen();
    }
    return QVariant();
}

QHash<int, QByteArray> ZahteviModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    roles[ImeRole] = "ime";
    roles[IdKorisnikaRole] = "id";
    roles[PrihvacenRole] = "prihvacen";
    return roles;
}


