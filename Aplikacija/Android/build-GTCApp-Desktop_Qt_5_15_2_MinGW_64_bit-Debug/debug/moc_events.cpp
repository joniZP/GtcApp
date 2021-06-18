/****************************************************************************
** Meta object code from reading C++ file 'events.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GTCApp/events.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'events.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_events_t {
    QByteArrayData data[25];
    char stringdata0[224];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_events_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_events_t qt_meta_stringdata_events = {
    {
QT_MOC_LITERAL(0, 0, 6), // "events"
QT_MOC_LITERAL(1, 7, 12), // "registracija"
QT_MOC_LITERAL(2, 20, 0), // ""
QT_MOC_LITERAL(3, 21, 3), // "ime"
QT_MOC_LITERAL(4, 25, 13), // "korisnickoime"
QT_MOC_LITERAL(5, 39, 5), // "email"
QT_MOC_LITERAL(6, 45, 5), // "sifra"
QT_MOC_LITERAL(7, 51, 13), // "izmenaprofila"
QT_MOC_LITERAL(8, 65, 21), // "trenutnokorisnickoime"
QT_MOC_LITERAL(9, 87, 7), // "telefon"
QT_MOC_LITERAL(10, 95, 18), // "izmenislikuprofila"
QT_MOC_LITERAL(11, 114, 5), // "slika"
QT_MOC_LITERAL(12, 120, 7), // "prijava"
QT_MOC_LITERAL(13, 128, 8), // "password"
QT_MOC_LITERAL(14, 137, 4), // "fun2"
QT_MOC_LITERAL(15, 142, 4), // "fun3"
QT_MOC_LITERAL(16, 147, 4), // "fun4"
QT_MOC_LITERAL(17, 152, 13), // "dodajkomentar"
QT_MOC_LITERAL(18, 166, 4), // "text"
QT_MOC_LITERAL(19, 171, 8), // "username"
QT_MOC_LITERAL(20, 180, 20), // "zaboravljena_lozinka"
QT_MOC_LITERAL(21, 201, 6), // "upload"
QT_MOC_LITERAL(22, 208, 3), // "url"
QT_MOC_LITERAL(23, 212, 4), // "fun1"
QT_MOC_LITERAL(24, 217, 6) // "klasa*"

    },
    "events\0registracija\0\0ime\0korisnickoime\0"
    "email\0sifra\0izmenaprofila\0"
    "trenutnokorisnickoime\0telefon\0"
    "izmenislikuprofila\0slika\0prijava\0"
    "password\0fun2\0fun3\0fun4\0dodajkomentar\0"
    "text\0username\0zaboravljena_lozinka\0"
    "upload\0url\0fun1\0klasa*"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_events[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    4,   69,    2, 0x0a /* Public */,
       7,    6,   78,    2, 0x0a /* Public */,
      10,    2,   91,    2, 0x0a /* Public */,
      12,    2,   96,    2, 0x0a /* Public */,
      14,    0,  101,    2, 0x0a /* Public */,
      15,    0,  102,    2, 0x0a /* Public */,
      16,    0,  103,    2, 0x0a /* Public */,
      17,    2,  104,    2, 0x0a /* Public */,
      20,    1,  109,    2, 0x0a /* Public */,
      21,    1,  112,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      23,    0,  115,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Bool, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,    3,    4,    5,    6,
    QMetaType::Bool, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,    8,    3,    4,    5,    6,    9,
    QMetaType::Bool, QMetaType::QString, QMetaType::QString,   11,    4,
    QMetaType::Int, QMetaType::QString, QMetaType::QString,    4,   13,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   18,   19,
    QMetaType::QString, QMetaType::QString,   19,
    QMetaType::Void, QMetaType::QString,   22,

 // methods: parameters
    0x80000000 | 24,

       0        // eod
};

void events::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<events *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { bool _r = _t->registracija((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 1: { bool _r = _t->izmenaprofila((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5])),(*reinterpret_cast< QString(*)>(_a[6])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 2: { bool _r = _t->izmenislikuprofila((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 3: { int _r = _t->prijava((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 4: _t->fun2(); break;
        case 5: _t->fun3(); break;
        case 6: _t->fun4(); break;
        case 7: _t->dodajkomentar((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 8: { QString _r = _t->zaboravljena_lozinka((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: _t->upload((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 10: { klasa* _r = _t->fun1();
            if (_a[0]) *reinterpret_cast< klasa**>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject events::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_events.data,
    qt_meta_data_events,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *events::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *events::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_events.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int events::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
