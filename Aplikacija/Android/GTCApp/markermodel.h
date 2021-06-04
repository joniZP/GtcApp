#ifndef MARKERMODEL_H
#define MARKERMODEL_H

#include <QAbstractListModel>
#include <QGeoCoordinate>

class MarkerModel : public QAbstractListModel {
  Q_OBJECT
private:
    static MarkerModel* instance;
    MarkerModel()
    {

    }

public:


    public:
    static MarkerModel& GetInstance()
    {
        if(instance == NULL)
        {
            instance = new MarkerModel();
        }
        return *instance;
    }
  using QAbstractListModel::QAbstractListModel;
  enum MarkerRoles { positionRole = Qt::UserRole + 1 };

  Q_INVOKABLE void addMarker(const QGeoCoordinate &coordinate) {
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_coordinates.append(coordinate);
    endInsertRows();
  }

  int rowCount(const QModelIndex &parent = QModelIndex()) const override {
    Q_UNUSED(parent)
    return m_coordinates.count();
  }

  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const override {
    if (index.row() < 0 || index.row() >= m_coordinates.count())
      return QVariant();
    if (role == MarkerModel::positionRole)
      return QVariant::fromValue(m_coordinates[index.row()]);
    return QVariant();
  }

  QHash<int, QByteArray> roleNames() const {
    QHash<int, QByteArray> roles;
    roles[positionRole] = "position";
    return roles;
  }

private:
  QList<QGeoCoordinate> m_coordinates;
};

#endif // MARKERMODEL_H
