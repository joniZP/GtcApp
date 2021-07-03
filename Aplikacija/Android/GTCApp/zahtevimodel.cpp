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

void ZahteviModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_zahtevi.count()>0)
    {
        m_zahtevi.removeFirst();
    }
    endRemoveRows();
}

void ZahteviModel::removeAll()
{
    beginRemoveRows(QModelIndex(), 0,m_zahtevi.count());
    m_zahtevi.clear();
    endRemoveRows();
}

void ZahteviModel::prihvati(int i)
{
    beginRemoveRows(QModelIndex(),i,i);
    if(m_zahtevi[i].prihvacen()==false)
    {
        PrijateljiEvents::prihvatiZahtev(m_zahtevi[i].id());
        // m_zahtevi[i].prihvati(true);
        m_zahtevi.removeAt(i);
    }
    endRemoveRows();
}

void ZahteviModel::obrisi(int i)
{
    beginRemoveRows(QModelIndex(),i,i);
    if(m_zahtevi.count()>0)
    {
        PrijateljiEvents::izbrisiZahtev(m_zahtevi[i].id());
        m_zahtevi.removeAt(i);

    }
    endRemoveRows();
}

void ZahteviModel::setVidjeni()
{
    MySqlService &s = MySqlService::MySqlInstance();
    MyQuery query;
    query="UPDATE Zahtev SET vidjen=1 WHERE primalac='%1' and vidjen=0";
    query<<LOCALDATA::mProfil->getKorisnickoIme();
    s.SendQuery(query);

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
    else if(role==VidjenRole)
    {
        return z.vidjen();
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
    roles[VidjenRole] = "vidjen";
    return roles;
}


