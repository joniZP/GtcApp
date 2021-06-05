#include "slikaModel.h"
slikamodel *slikamodel::instance=NULL;
slikamodel::slikamodel()
{

}
slikamodel &slikamodel::GetInstance()
{
    if(instance==NULL)
    {
        instance = new slikamodel();
    }
        return *instance;
}
    void slikamodel::dodajSliku(const Slika &sl)
    {
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_slike << sl;
        endInsertRows();
    }
    int slikamodel::rowCount(const QModelIndex &parent) const
    {
        Q_UNUSED(parent);
        return m_slike.count();
    }

    QVariant slikamodel::data(const QModelIndex &index, int role) const
    {

        if (index.row() < 0 || index.row() >= m_slike.count())
        {
            return QVariant();
        }
        const Slika &slika = m_slike[index.row()];
        if (role == TypeRole)
        {
            return slika.slika();
        }
        else if (role == SizeRole)
        {
            return slika.tekst();
        }
        else if(role==ColorRole)
        {
            return slika.boja();
        }
        return QVariant();
    }

    QHash<int, QByteArray>slikamodel::roleNames() const
    {
        QHash<int, QByteArray> roles;
        roles[TypeRole] = "slika";
        roles[SizeRole] = "tekst";
        roles[ColorRole] = "boja";
        return roles;
    }
