#include "MLokacija.h"



void MLokacija::setKreator(const QString &value)
{
    kreator = value;
}

void MLokacija::setKategorija(const QString &value)
{
    kategorija=value;
}

void MLokacija::setOpis(const QString &value)
{
    opis = value;
}

void MLokacija::setGrad(const QString &value)
{
    grad = value;
}

int MLokacija::getBrSlika() const
{
    return brSlika;
}

void MLokacija::setBrSlika(int value)
{
    brSlika = value;
}

void MLokacija::setLike(int value)
{
    like = value;
}

int MLokacija::getBrKomentara() const
{
    return brKomentara;
}

void MLokacija::setBrKomentara(int value)
{
    brKomentara = value;
}

QString MLokacija::getBrLajkaString(int b)
{
    like+=b;
    return QString::number(like);
}

QString MLokacija::getBrKomentaraString(int b)
{
    int br=0;
    if(b!=0)
    {
        KomentariModel &k=KomentariModel::GetInstance();
        br=k.getBrKom();
    }
    else
    {
        br=getBrKomentara();
    }
    if(br==1)
    {
        return QString::number(br)+" komentar";
    }
    else if(br>9)
    {
        int d=br%10;
        int p=(br/10)%10;
        if(d==1&&p!=1)
        {
            return QString::number(br)+" komentar";
        }
    }
    return QString::number(br)+" komentara";
}

void MLokacija::navigacija()
{

    QString link="https://www.google.com/maps/dir/?api=1&destination="+QString::number(xcoo)+","+QString::number(ycoo);
    qDebug()<<"navigacija "<<link;
    QDesktopServices::openUrl(QUrl(link));

}

MLokacija::MLokacija(int id, QString kreator, QString punoime, QString naziv, QString opis, QString grad, int like, double xcoo, double ycoo, QString kategorija)
{
    this->grad=grad;
    this->id = id;
    this->kreator = kreator;
    this->like=like;
    this->naziv=naziv;
    this->opis = opis;
    this->xcoo=xcoo;
    this->ycoo = ycoo;
    this->punoime = punoime;
    this->kategorija=kategorija;
}

void MLokacija::setId(int value)
{
    id = value;
}
