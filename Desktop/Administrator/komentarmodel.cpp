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
        if (role == IdKomentaraRole)
        {
            return Komentar.idKomentara();
        }
        else if (role == IdKorisnikaRole)
        {
            return Komentar.idKorisnika();
        }
        else if(role==TekstKomentaraRole)
        {
            return Komentar.tekst();
        }
        else if(role==PripadaRole)
        {
            return Komentar.pripada();
        }
        return QVariant();
    }

    QHash<int, QByteArray>Komentarmodel::roleNames() const
    {
        QHash<int, QByteArray> roles;
        roles[IdKomentaraRole] = "idKomentara";
          roles[IdKorisnikaRole] = "idKorisnika";
          roles[PripadaRole] = "pripada";
          roles[TekstKomentaraRole] = "tekst";
        return roles;
    }
