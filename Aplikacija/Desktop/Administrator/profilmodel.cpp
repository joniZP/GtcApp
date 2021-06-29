#include "profilmodel.h"

profilModel::profilModel()
{

}

profilModel *profilModel::instance=NULL;



profilModel &profilModel::GetInstance()
{
    if(instance==NULL)
    {
        instance = new profilModel();
    }
        return *instance;
}
    void profilModel::dodajprofil(const profil &sl)
    {
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_profili << sl;
        endInsertRows();
    }
    int profilModel::rowCount(const QModelIndex &parent) const
    {
        Q_UNUSED(parent);
        return m_profili.count();
    }

    QVariant profilModel::data(const QModelIndex &index, int role) const
    {

        if (index.row() < 0 || index.row() >= m_profili.count())
        {
            return QVariant();
        }
        const profil &profil = m_profili[index.row()];
        if (role ==korisnickoimeRole)
        {
            return profil.korisnickoime();
        }
        else if (role == imeRole)
        {
            return profil.ime();
        }
        else if(role==prezimeRole)
        {
            return profil.prezime();
        }
        else if(role==emailRole)
        {
            return profil.email();
        }
        else if(role==brslikaRole)
        {
            return profil.brslika();
        }
        return QVariant();
    }

    QHash<int, QByteArray>profilModel::roleNames() const
    {
        QHash<int, QByteArray> roles;
        roles[korisnickoimeRole] = "korisnickoime";
        roles[imeRole] = "ime";
        roles[prezimeRole] = "prezime";
        roles[emailRole] = "email";
        roles[brslikaRole] = "brslika";
        return roles;
    }
