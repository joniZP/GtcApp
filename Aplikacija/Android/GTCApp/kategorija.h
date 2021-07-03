#ifndef KATEGORIJA_H
#define KATEGORIJA_H
#include<qstring.h>
class Kategorija
{
public:
    Kategorija(const QString &kategorija, const bool &cekirana,const int &indeks);

    QString kategorija() const;
    bool cekirana() const;
    int indeks() const;
    void setCekirana(bool b);
private:
    QString m_kategorija;
    bool m_cekirana;
    int m_indeks;

};
#endif // KATEGORIJA_H
