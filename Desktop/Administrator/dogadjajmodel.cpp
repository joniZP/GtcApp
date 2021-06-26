#include "dogadjajmodel.h"

Dogadjajmodel *Dogadjajmodel::instance=NULL;


Dogadjajmodel::Dogadjajmodel()
{

}
Dogadjajmodel &Dogadjajmodel::GetInstance()
{
    if(instance==NULL)
    {
        instance = new Dogadjajmodel();
    }
        return *instance;
}
    void Dogadjajmodel::dodajDogadjaj(const Dogadjaj &sl)
    {
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_dogadjaji << sl;
        endInsertRows();
    }
    int Dogadjajmodel::rowCount(const QModelIndex &parent) const
    {
        Q_UNUSED(parent);
        return m_dogadjaji.count();
    }

    QVariant Dogadjajmodel::data(const QModelIndex &index, int role) const
    {

        if (index.row() < 0 || index.row() >= m_dogadjaji.count())
        {
            return QVariant();
        }
        const Dogadjaj &Dogadjaj = m_dogadjaji[index.row()];
        if (role == IdDogadjajaRole)
        {
            return Dogadjaj.idDogadjaja();
        }
        else if (role == IdLokacijeRole)
        {
            return Dogadjaj.idLokacije();
        }
        else if(role==VremeRole)
        {
            return Dogadjaj.vreme();
        }
        else if(role==OpisRole)
        {
            return Dogadjaj.opis();
        }
        else if(role==TipRole)
        {
            return Dogadjaj.tip();
        }
        else if(role==UsernameRole)
        {
            return Dogadjaj.username();
        }
        else if(role==RazlogRole)
        {
            return Dogadjaj.razlog();
        }
        return QVariant();
    }

    QHash<int, QByteArray>Dogadjajmodel::roleNames() const
    {
        QHash<int, QByteArray> roles;
        roles[IdDogadjajaRole] = "idDogadjaja";
        roles[IdLokacijeRole] = "idLokacije";
        roles[VremeRole] = "vreme";
        roles[OpisRole] = "opis";
        roles[TipRole] = "tip";
        roles[UsernameRole] = "username";
        roles[RazlogRole] = "razlog";
        return roles;
    }
