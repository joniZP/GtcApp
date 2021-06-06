
#include <QAbstractListModel>
#include <QStringList>
class lokacija
{
public:
    lokacija(const int& id,const QString &slika, const QString &naziv,const QString &grad);
//![0]

    int id() const;
    QString slika() const;
    QString naziv() const;
    QString grad() const;

private:
    int m_id;
    QString m_slika;
    QString m_naziv;
    QString m_grad;
//![1]
};
