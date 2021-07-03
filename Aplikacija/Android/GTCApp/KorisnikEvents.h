#ifndef KORISNIKEVENTS_H
#define KORISNIKEVENTS_H
#include<MySqlService.h>
#include<EmailVerificator.h>
#include <QObject>
#include<LOCALDATA.h>
#include<LINKS.h>
#include<FileUploader.h>

class KorisnikEvents : public QObject
{
    Q_OBJECT
public:
    explicit KorisnikEvents(QObject *parent = nullptr);



    Q_INVOKABLE
    bool registracija(QString ime,QString prezime,QString korisnickoime,QString email,QString sifra);

    Q_INVOKABLE
    void izmenaProfila(QString ime,QString prezime,QString sifra, QString telefon);

    Q_INVOKABLE
    bool izmeniSlikuProfila(QString slikaurl);

    Q_INVOKABLE
    void zaboravljena_lozinka(QString email);

    Q_INVOKABLE
    int prijava(QString korisnickoime,QString password);

    Q_INVOKABLE
    void odjava();



signals:

};

#endif // KORISNIKEVENTS_H
