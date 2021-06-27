#include "komentarmodel.h"

Komentarmodel *Komentarmodel::instance=NULL;
Komentarmodel::Komentarmodel()
{

}
Komentarmodel &Komentarmodel::GetInstance()
{
    if(instance==NULL)
    {
        instance = new Komentarmodel();
    }
        return *instance;
}
    void Komentarmodel::dodajKomentar(const Komentar &sl)
    {
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_Komentari << sl;
        endInsertRows();
    }
    int Komentarmodel::rowCount(const QModelIndex &parent) const
    {
        Q_UNUSED(parent);
        return m_Komentari.count();
    }

    QVariant Komentarmodel::data(const QModelIndex &index, int role) const
    {

        if (index.row() < 0 || index.row() >= m_Komentari.count())
        {
            return QVariant();
        }
        const Komentar &Komentar = m_Komentari[index.row()];
        if (role == IdReport)
        {
            return Komentar.idreport();
        }
        else if (role == TekstKomentaraRole)
        {
            return Komentar.tekst();
        }
        else if(role==UsernameRole)
        {
            return Komentar.username();
        }
        else if(role==LokDogRole)
        {
            return Komentar.lokdog();
        }
        else if(role==RazlogRole)
        {
            return Komentar.razlog();
        }
        else if(role==IdLokDogRole)
        {
            return Komentar.idlokdog();
        }
        else if(role==IDKomRole)
        {
            return Komentar.idkom();
        }
        return QVariant();
    }

    QHash<int, QByteArray>Komentarmodel::roleNames() const
    {
        QHash<int, QByteArray> roles;
        roles[IdReport] = "idreport";
          roles[TekstKomentaraRole] = "tekst";
          roles[UsernameRole] = "username";
          roles[LokDogRole] = "lokdog";
          roles[RazlogRole] = "razlog";
          roles[IdLokDogRole] = "idlokdog";
          roles[IDKomRole] = "idkom";
        return roles;
    }
