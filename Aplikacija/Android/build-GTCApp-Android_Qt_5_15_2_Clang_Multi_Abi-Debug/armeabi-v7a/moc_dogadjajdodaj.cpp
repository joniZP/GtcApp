/****************************************************************************
** Meta object code from reading C++ file 'dogadjajdodaj.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GTCApp/dogadjajdodaj.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dogadjajdodaj.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_DogadjajDodaj_t {
    QByteArrayData data[13];
    char stringdata0[123];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DogadjajDodaj_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DogadjajDodaj_t qt_meta_stringdata_DogadjajDodaj = {
    {
QT_MOC_LITERAL(0, 0, 13), // "DogadjajDodaj"
QT_MOC_LITERAL(1, 14, 6), // "gettip"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 6), // "settip"
QT_MOC_LITERAL(4, 29, 1), // "a"
QT_MOC_LITERAL(5, 31, 7), // "getopis"
QT_MOC_LITERAL(6, 39, 7), // "setopis"
QT_MOC_LITERAL(7, 47, 8), // "getvreme"
QT_MOC_LITERAL(8, 56, 8), // "setvreme"
QT_MOC_LITERAL(9, 65, 13), // "getidlokacije"
QT_MOC_LITERAL(10, 79, 13), // "setidlokacije"
QT_MOC_LITERAL(11, 93, 14), // "getidkorisnika"
QT_MOC_LITERAL(12, 108, 14) // "setidkorisnika"

    },
    "DogadjajDodaj\0gettip\0\0settip\0a\0getopis\0"
    "setopis\0getvreme\0setvreme\0getidlokacije\0"
    "setidlokacije\0getidkorisnika\0"
    "setidkorisnika"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DogadjajDodaj[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   64,    2, 0x02 /* Public */,
       3,    1,   65,    2, 0x02 /* Public */,
       5,    0,   68,    2, 0x02 /* Public */,
       6,    1,   69,    2, 0x02 /* Public */,
       7,    0,   72,    2, 0x02 /* Public */,
       8,    1,   73,    2, 0x02 /* Public */,
       9,    0,   76,    2, 0x02 /* Public */,
      10,    1,   77,    2, 0x02 /* Public */,
      11,    0,   80,    2, 0x02 /* Public */,
      12,    1,   81,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,

       0        // eod
};

void DogadjajDodaj::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<DogadjajDodaj *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->gettip();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 1: _t->settip((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: { QString _r = _t->getopis();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->setopis((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: { QString _r = _t->getvreme();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 5: _t->setvreme((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: { QString _r = _t->getidlokacije();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 7: _t->setidlokacije((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: { QString _r = _t->getidkorisnika();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: _t->setidkorisnika((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject DogadjajDodaj::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_DogadjajDodaj.data,
    qt_meta_data_DogadjajDodaj,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *DogadjajDodaj::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DogadjajDodaj::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_DogadjajDodaj.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int DogadjajDodaj::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 10;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
