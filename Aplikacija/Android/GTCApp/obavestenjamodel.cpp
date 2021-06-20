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
        return o.id();
    }
    else if(role==CheckedRole)
    {
        return o.checked();
    }
    else if(role==LidRole)
    {
        return o.lid();
    }
    return QVariant();
}

QHash<int, QByteArray> ObavestenjaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    roles[TextRole] = "tekst";
    roles[IdLokacije_dogadjajaRole] = "id";
    roles[CheckedRole] = "cekirano";
    roles[LidRole] = "lid";
    return roles;
}


