/****************************************************************************
** Meta object code from reading C++ file 'korisnikevents.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Administrator/korisnikevents.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'korisnikevents.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_KorisnikEvents_t {
    QByteArrayData data[12];
    char stringdata0[114];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_KorisnikEvents_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_KorisnikEvents_t qt_meta_stringdata_KorisnikEvents = {
    {
QT_MOC_LITERAL(0, 0, 14), // "KorisnikEvents"
QT_MOC_LITERAL(1, 15, 12), // "registracija"
QT_MOC_LITERAL(2, 28, 0), // ""
QT_MOC_LITERAL(3, 29, 3), // "ime"
QT_MOC_LITERAL(4, 33, 7), // "prezime"
QT_MOC_LITERAL(5, 41, 13), // "korisnickoime"
QT_MOC_LITERAL(6, 55, 5), // "email"
QT_MOC_LITERAL(7, 61, 5), // "sifra"
QT_MOC_LITERAL(8, 67, 20), // "zaboravljena_lozinka"
QT_MOC_LITERAL(9, 88, 8), // "username"
QT_MOC_LITERAL(10, 97, 7), // "prijava"
QT_MOC_LITERAL(11, 105, 8) // "password"

    },
    "KorisnikEvents\0registracija\0\0ime\0"
    "prezime\0korisnickoime\0email\0sifra\0"
    "zaboravljena_lozinka\0username\0prijava\0"
    "password"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_KorisnikEvents[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    5,   29,    2, 0x02 /* Public */,
       8,    1,   40,    2, 0x02 /* Public */,
      10,    2,   43,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Bool, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,    3,    4,    5,    6,    7,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Int, QMetaType::QString, QMetaType::QString,    5,   11,

       0        // eod
};

void KorisnikEvents::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<KorisnikEvents *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { bool _r = _t->registracija((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 1: _t->zaboravljena_lozinka((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: { int _r = _t->prijava((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject KorisnikEvents::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_KorisnikEvents.data,
    qt_meta_data_KorisnikEvents,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *KorisnikEvents::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *KorisnikEvents::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_KorisnikEvents.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int KorisnikEvents::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
