#include "markermodel.h"

MarkerModel * MarkerModel ::instance = NULL;
MarkerModel::MarkerModel()
{

}
MarkerModel & MarkerModel ::GetInstance()
{
    if(instance == NULL)
    {
        instance = new MarkerModel();
    }
    return *instance;
}
void MarkerModel ::dodajmarker(const QGeoCoordinate &coordinate)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_coordinates.append(coordinate);
    endInsertRows();
}

void MarkerModel::remove()
{
    beginRemoveRows(QModelIndex(), 0, 0);
    if(m_coordinates.count()>0)
    {
        m_coordinates.removeFirst();
    }
    endRemoveRows();
}
int MarkerModel ::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_coordinates.count();
}

QVariant MarkerModel::data(const QModelIndex &index, int role) const
{

    if (index.row() < 0 || index.row() >= m_coordinates.count())
    {
        return QVariant();
    }
    const QGeoCoordinate &koordinata = m_coordinates[index.row()];
    if (role == positionRole)
    {
        return koordinata.Coordinate2D;
    }
    return QVariant();
}

QHash<int, QByteArray> MarkerModel ::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[positionRole] = "position";
    return roles;
}


