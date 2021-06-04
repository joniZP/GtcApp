#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include<QObject>
#include<QtSql>
#include<QtSql>
#include<QGeoCoordinate>
class MarkerModel: public QAbstractListModel{
    Q_OBJECT

private:

    enum MarkerRoles
     {
         positionRole = Qt::UserRole + 1
     };

    static MarkerModel* instance;
    MarkerModel();
    public:
    static MarkerModel& GetInstance();
    void dodajmarker(const QGeoCoordinate &coordinate);
    void remove()
    {
        beginRemoveRows(QModelIndex(), 0, 0);
        if(m_coordinates.count()>0)
        {
             m_coordinates.removeFirst();
        }
        endRemoveRows();
    }
    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
      QList<QGeoCoordinate> m_coordinates;
private:

};
