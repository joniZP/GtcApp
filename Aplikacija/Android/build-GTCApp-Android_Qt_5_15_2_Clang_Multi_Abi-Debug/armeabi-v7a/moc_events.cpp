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
    QByteArrayData data[20];
    char stringdata0[155];
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
QT_MOC_LITERAL(7, 51, 7), // "prijava"
QT_MOC_LITERAL(8, 59, 8), // "password"
QT_MOC_LITERAL(9, 68, 4), // "fun2"
QT_MOC_LITERAL(10, 73, 4), // "fun3"
QT_MOC_LITERAL(11, 78, 4), // "fun4"
QT_MOC_LITERAL(12, 83, 13), // "dodajkomentar"
QT_MOC_LITERAL(13, 97, 4), // "text"
QT_MOC_LITERAL(14, 102, 8), // "username"
QT_MOC_LITERAL(15, 111, 20), // "zaboravljena_lozinka"
QT_MOC_LITERAL(16, 132, 6), // "upload"
QT_MOC_LITERAL(17, 139, 3), // "url"
QT_MOC_LITERAL(18, 143, 4), // "fun1"
QT_MOC_LITERAL(19, 148, 6) // "klasa*"

    },
    "events\0registracija\0\0ime\0korisnickoime\0"
    "email\0sifra\0prijava\0password\0fun2\0"
    "fun3\0fun4\0dodajkomentar\0text\0username\0"
    "zaboravljena_lozinka\0upload\0url\0fun1\0"
    "klasa*"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_events[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    4,   59,    2, 0x0a /* Public */,
       7,    2,   68,    2, 0x0a /* Public */,
       9,    0,   73,    2, 0x0a /* Public */,
      10,    0,   74,    2, 0x0a /* Public */,
      11,    0,   75,    2, 0x0a /* Public */,
      12,    2,   76,    2, 0x0a /* Public */,
      15,    1,   81,    2, 0x0a /* Public */,
      16,    1,   84,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      18,    0,   87,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Bool, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,    3,    4,    5,    6,
    QMetaType::Int, QMetaType::QString, QMetaType::QString,    4,    8,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   13,   14,
    QMetaType::QString, QMetaType::QString,   14,
    QMetaType::Void, QMetaType::QString,   17,

 // methods: parameters
    0x80000000 | 19,

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
        case 1: { int _r = _t->prijava((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 2: _t->fun2(); break;
        case 3: _t->fun3(); break;
        case 4: _t->fun4(); break;
        case 5: _t->dodajkomentar((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 6: { QString _r = _t->zaboravljena_lozinka((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 7: _t->upload((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: { klasa* _r = _t->fun1();
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
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
