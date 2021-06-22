#ifndef MPROFIL_H
#define MPROFIL_H

#include <QObject>
#include<LINKS.h>

class MProfil : public QObject
{
    Q_OBJECT

private:
    QString korisnickoIme;
    QString ime;
    QString prezime;
    QString email;
    QString lozinka;
    float ocena;
    bool verifikovan;
    int brojOcena;
    QString telefon;
    bool slika;
    QString slikaURL;

public:
   // explicit MProfil(QObject *parent = nullptr);
    MProfil(QString korisnickoIme,QString ime,QString prezime, QString email, QString lozinka, float ocena, bool verifikovan, int brojOcena, QString telefon, bool slika);
    MProfil(QString ime, QString prezime,QString korisnickoime,bool slika);
    MProfil(){};
    Q_INVOKABLE
    QString getKorisnickoIme() const;
    Q_INVOKABLE
    void setKorisnickoIme(const QString &value);
    Q_INVOKABLE
    QString getIme() const;
    Q_INVOKABLE
    void setIme(const QString &value);
    Q_INVOKABLE
    QString getPrezime() const;
    Q_INVOKABLE
    void setPrezime(const QString &value);
    Q_INVOKABLE
    QString getEmail() const;
    Q_INVOKABLE
    void setEmail(const QString &value);
    Q_INVOKABLE
    QString getLozinka() const;
    Q_INVOKABLE
    void setLozinka(const QString &value);
    Q_INVOKABLE
    float getOcena() const;
    Q_INVOKABLE
    void setOcena(float value);
    Q_INVOKABLE
    bool getVerifikovan() const;
    Q_INVOKABLE
    void setVerifikovan(bool value);
    Q_INVOKABLE
    int getBrojOcena() const;
    Q_INVOKABLE
    void setBrojOcena(int value);
    Q_INVOKABLE
    QString getTelefon() const;
    Q_INVOKABLE
    void setTelefon(const QString &value);
    Q_INVOKABLE
    bool getSlika() const;
    Q_INVOKABLE
    void setSlika(bool value);
    Q_INVOKABLE
    QString getSlikaURL() const;
    Q_INVOKABLE
    void setSlikaURL(const QString &value);

signals:

};

#endif // MPROFIL_H
