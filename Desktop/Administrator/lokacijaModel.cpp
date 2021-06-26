#include"lokacijaModel.h"
LokacijaModel * LokacijaModel::instance = NULL;
LokacijaModel::LokacijaModel()
{

}
LokacijaModel &LokacijaModel::GetInstance()
{
    if(instance == NULL)
    {
        instance = new LokacijaModel();
    }
    return *instance;
}
void LokacijaModel::dodajlokaciju(const Lokacija &lok)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_lokacije << lok;
    endInsertRows();
}
int LokacijaModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_lokacije.count();
}

QVariant LokacijaModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_lokacije.count())
    {
        return QVariant();
    }
    const Lokacija &Lokacija = m_lokacije[index.row()];
    if (role == SlikaRole)
    {
        return Lokacija.slika();
    }
    else if (role == NazivRole)
    {
        return Lokacija.naziv();
    }
    else if(role==GradRole)
    {
        return Lokacija.grad();
    }
    else if(role==IdRole)
    {
        return Lokacija.id();
    }
    else if(role==idkorisnikaRole)
    {
        return Lokacija.idkorisnika();
    }
    else if(role==RazlogRole)
    {
        return Lokacija.razlog();
    }
    else if(role==usernameRole)
    {
        return Lokacija.username();
    }
    return QVariant();
}

QHash<int, QByteArray> LokacijaModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[SlikaRole] = "slika";
    roles[NazivRole] = "naziv";
    roles[GradRole] = "grad";
    roles[IdRole] = "id";
    roles[idkorisnikaRole]="idkorisnika";
    roles[usernameRole] = "username";
    roles[RazlogRole] = "razlog";
    return roles;
}


