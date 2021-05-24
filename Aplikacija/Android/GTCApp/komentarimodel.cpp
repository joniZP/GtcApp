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
    if (role == TypeRole)
    {
        return Komentari.slika();
    }
    else if (role == SizeRole)
    {
        return Komentari.tekst();
    }
    else if(role==ColorRole)
    {
        return Komentari.ime();
    }
    return QVariant();
}

QHash<int, QByteArray> KomentariModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TypeRole] = "slika";
    roles[SizeRole] = "tekst";
    roles[ColorRole] = "ime";
    return roles;
}


