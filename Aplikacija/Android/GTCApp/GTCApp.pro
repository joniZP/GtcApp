QT += quick
QT += sql
QT += quickcontrols2
QT += qml quick
QT += network
QT += gui
QT += location positioning

CONFIG += c++11
PKGCONFIG += openssl


QT += androidextras

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
SOURCES += \
        EmailVerificator.cpp \
        FileUploader.cpp \
        KorisnikEvents.cpp \
        LINKS.cpp \
        LOCALDATA.cpp \
        Lokacija.cpp \
        LokacijaModel.cpp \
        MProfil.cpp \
        MySqlService.cpp \
        Notification.cpp \
        PretragaLokacija.cpp \
        PrijateljiEvents.cpp \
        UcitavanjeProfila.cpp \
        UpisLokacijaDogadjaj.cpp \
        dogadjaj.cpp \
        dogadjajdodaj.cpp \
        events.cpp \
        kategorija.cpp \
        kategorijamodel.cpp \
        klasa.cpp \
        komentar.cpp \
        komentarimodel.cpp \
        korisnikdogadjajmodel.cpp \
        korisniklokacijamodel.cpp \
        lokacijadodaj.cpp \
        main.cpp \
        markermodel.cpp \
        mestomodel.cpp \
        obavestenjamodel.cpp \
        obavestenje.cpp \
        prijateljimodel.cpp \
        profillistelement.cpp \
        slikamodel.cpp \
        ucitavanjelokacije.cpp \
        zahtev.cpp \
        zahtevimodel.cpp \


RESOURCES += qml.qrc \
    DB.qrc \
    aaaa.qrc
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    EmailVerificator.h \
    FileUploader.h \
    KorisnikEvents.h \
    LINKS.h \
    LOCALDATA.h \
    Lokacija.h \
    LokacijaModel.h \
    MDogadjaj.h \
    MLokacija.h \
    MProfil.h \
    MySqlService.h \
    Notification.h \
    PretragaLokacija.h \
    PrijateljiEvents.h \
    UcitavanjeProfila.h \
    UpisLokacijaDogadjaj.h \
    dogadjaj.h \
    dogadjajdodaj.h \
    events.h \
    kategorija.h \
    kategorijamodel.h \
    klasa.h \
    komentar.h \
    komentarimodel.h \
    korisnikdogadjajmodel.h \
    korisniklokacijamodel.h \
    lokacijadodaj.h \
    markermodel.h \
    mestomodel.h \
    obavestenjamodel.h \
    obavestenje.h \
    prijateljimodel.h \
    profillistelement.h \
    slikamodel.h \
    ucitavanjelokacije.h \
    zahtev.h \
    zahtevimodel.h

android: include(C:/Users/PC/AppData/Local/Android/Sdk/android_openssl/openssl.pri)

DISTFILES += \
  NotificationClient.java \


DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml \
    android/src/com/notification/javalib/NotificationClient.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
ANDROID_ABIS = armeabi-v7a




