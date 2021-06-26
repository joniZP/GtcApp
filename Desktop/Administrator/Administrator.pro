QT += quick
QT += quickcontrols2
QT += qml quick
QT += network
QT += sql
QT += gui

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        LINKS.cpp \
        UcitavanjeDogadjaja.cpp \
        UcitavanjeLokacije.cpp \
        dogadjaj.cpp \
        dogadjajmodel.cpp \
        emailVerificator.cpp \
        events.cpp \
        komentar.cpp \
        komentarmodel.cpp \
        lokacija.cpp \
        lokacijaModel.cpp \
        main.cpp \
        mySqlService.cpp \
        slika.cpp \
        slikaModel.cpp

RESOURCES += qml.qrc \
    ikonice.qrc \
    ikonice.qrc \
    ikonice.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    LINKS.h \
    MLokacija.h \
    MySqlService.h \
    UcitavanjeDogadjaja.h \
    UcitavanjeKomentara.h \
    UcitavanjeLokacije.h \
    dogadjaj.h \
    dogadjajmodel.h \
    emailVerificator.h \
    events.h \
    komentar.h \
    komentarmodel.h \
    lokacija.h \
    lokacijaModel.h \
    slika.h \
    slikaModel.h

DISTFILES +=
