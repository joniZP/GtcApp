#include <ObavestenjaModel.h>
ObavestenjaModel * ObavestenjaModel::instance = NULL;
ObavestenjaModel::ObavestenjaModel()
{

}
ObavestenjaModel &ObavestenjaModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new ObavestenjaModel();
    }
    return *instance;
}
void ObavestenjaModel::dodajobavestenje(const obavestenje &o)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_obavestenja << o;
    endInsertRows();
}

void ObavestenjaModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_obavestenja.count()>0)
    {
        m_obavestenja.removeFirst();
    }
    endRemoveRows();
}

void ObavestenjaModel::pregledaj(int i)
{
    if(m_obavestenja[i].vidjen()==false)
    {
        m_obavestenja[i].cekiraj(true);
    }
}

int ObavestenjaModel::getCount()
{
    qDebug()<<m_obavestenja.count();
    return m_obavestenja.count();

}

void ObavestenjaModel::removeAll()
{
    beginRemoveRows(QModelIndex(), 0,m_obavestenja.count());
    m_obavestenja.clear();
    endRemoveRows();
}

void ObavestenjaModel::obrisi(int i)
{
    beginRemoveRows(QModelIndex(),i,i);
    if(m_obavestenja.count()>0)
    {
        MySqlService &s = MySqlService::MySqlInstance();
        MyQuery query;
        query="DELETE FROM Obavestenje where idObavestenja=%1";
        query<< m_obavestenja[i].idO();
        s.SendQuery(query);
        m_obavestenja.removeAt(i);
    }
    endRemoveRows();
}
int ObavestenjaModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_obavestenja.count();
}

QVariant ObavestenjaModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_obavestenja.count())
    {
        return QVariant();
    }
    const obavestenje &o = m_obavestenja[index.row()];
    if (role == SlikaRole)
    {
        return o.slika();
    }
    else if (role == TextRole)
    {
        return o.tekst();
    }
    else if(role==IdLokacije_dogadjajaRole)
    {
        return o.idLD();
    }
    else if(role==VidjenRole)
    {
        return o.vidjen();
    }
    else if(role==LidRole)
    {
        return o.lid();
    }
    else if(role==KorisnikRole)
    {
        return o.id();
    }
    else if(role==IdORole)
    {
        return o.idO();
    }
    return QVariant();
}

QHash<int, QByteArray> ObavestenjaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    roles[TextRole] = "tekst";
    roles[IdLokacije_dogadjajaRole] = "idLD";
    roles[VidjenRole] = "vidjen";
    roles[LidRole] = "lid";
    roles[KorisnikRole] = "sender";
     roles[IdORole] = "idO";
    return roles;
}


