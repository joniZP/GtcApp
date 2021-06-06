/****************************************************************************
** Meta object code from reading C++ file 'UpisLokacijaDogadjaj.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GTCApp/UpisLokacijaDogadjaj.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'UpisLokacijaDogadjaj.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_UpisLokacijaDogadjaj_t {
    QByteArrayData data[11];
    char stringdata0[78];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_UpisLokacijaDogadjaj_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_UpisLokacijaDogadjaj_t qt_meta_stringdata_UpisLokacijaDogadjaj = {
    {
QT_MOC_LITERAL(0, 0, 20), // "UpisLokacijaDogadjaj"
QT_MOC_LITERAL(1, 21, 13), // "upisiLokaciju"
QT_MOC_LITERAL(2, 35, 0), // ""
QT_MOC_LITERAL(3, 36, 5), // "naziv"
QT_MOC_LITERAL(4, 42, 4), // "grad"
QT_MOC_LITERAL(5, 47, 4), // "opis"
QT_MOC_LITERAL(6, 52, 10), // "dodajSliku"
QT_MOC_LITERAL(7, 63, 3), // "url"
QT_MOC_LITERAL(8, 67, 6), // "setCoo"
QT_MOC_LITERAL(9, 74, 1), // "x"
QT_MOC_LITERAL(10, 76, 1) // "y"

    },
    "UpisLokacijaDogadjaj\0upisiLokaciju\0\0"
    "naziv\0grad\0opis\0dodajSliku\0url\0setCoo\0"
    "x\0y"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_UpisLokacijaDogadjaj[] = {

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
       1,    3,   29,    2, 0x02 /* Public */,
       6,    1,   36,    2, 0x02 /* Public */,
       8,    2,   39,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    3,    4,    5,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::Double, QMetaType::Double,    9,   10,

       0        // eod
};

void UpisLokacijaDogadjaj::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<UpisLokacijaDogadjaj *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->upisiLokaciju((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 1: _t->dodajSliku((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->setCoo((*reinterpret_cast< double(*)>(_a[1])),(*reinterpret_cast< double(*)>(_a[2]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject UpisLokacijaDogadjaj::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_UpisLokacijaDogadjaj.data,
    qt_meta_data_UpisLokacijaDogadjaj,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *UpisLokacijaDogadjaj::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *UpisLokacijaDogadjaj::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_UpisLokacijaDogadjaj.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int UpisLokacijaDogadjaj::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
