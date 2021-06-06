QT += quick
QT += sql
QT += quickcontrols2
QT += qml quick
QT += network
QT += gui
QT += location positioning
CONFIG += c++11
PKGCONFIG += openssl

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
SOURCES += \
        EmailVerificator.cpp \
        FileUploader.cpp \
        LOCALDATA.cpp \
        Lokacija.cpp \
        LokacijaModel.cpp \
        MySqlKrsta.cpp \
        UpisLokacijaDogadjaj.cpp \
        dogadjajdodaj.cpp \
        events.cpp \
        klasa.cpp \
        komentar.cpp \
        komentarimodel.cpp \
        lokacijadodaj.cpp \
        main.cpp \
        markermodel.cpp \
        slikamodel.cpp \
        ucitavanjelokacije.cpp

RESOURCES += qml.qrc \
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
    LOCALDATA.h \
    Lokacija.h \
    LokacijaModel.h \
    MLokacija.h \
    MySqlKrsta.h \
    UpisLokacijaDogadjaj.h \
    dogadjajdodaj.h \
    events.h \
    klasa.h \
    komentar.h \
    komentarimodel.h \
    lokacijadodaj.h \
    markermodel.h \
    slikamodel.h \
    ucitavanjelokacije.h
android: include(C:/Users/PC/AppData/Local/Android/Sdk/android_openssl/openssl.pri)
