#include <KomentariModel.h>
KomentariModel * KomentariModel::instance = NULL;
KomentariModel::KomentariModel()
{

}
KomentariModel &KomentariModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new KomentariModel();
    }
    return *instance;
}
void KomentariModel::dodajkomentar(const Komentar &lok)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_lokacije << lok;
    endInsertRows();
}
int KomentariModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_lokacije.count();
}

QVariant KomentariModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_lokacije.count())
    {
        return QVariant();
    }
    const Komentar &Komentari = m_lokacije[index.row()];
    if (role == SlikaRole)
    {
        return Komentari.slika();
    }
    else if (role == TextRole)
    {
        return Komentari.tekst();
    }
    else if(role==ImeRole)
    {
        return Komentari.ime();
    }
    else if(role==IdRole)
    {
        return Komentari.id();
    }
    else if(role==KreatorRole)
    {
        return Komentari.kreatorid();
    }
    return QVariant();
}

QHash<int, QByteArray> KomentariModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    roles[TextRole] = "tekst";
    roles[ImeRole] = "ime";
    roles[IdRole] = "id";
    roles[KreatorRole] = "kreatorid";
    return roles;
}


