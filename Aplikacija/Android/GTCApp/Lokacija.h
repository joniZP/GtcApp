
#include <QAbstractListModel>
#include <QStringList>

class lokacija
{
public:
    lokacija(const QString &slika, const QString &text,const QString &boja);
//![0]

    QString slika() const;
    QString tekst() const;
    QString boja() const;

private:
    QString m_slika;
    QString m_text;
     QString m_boja;
//![1]
};
