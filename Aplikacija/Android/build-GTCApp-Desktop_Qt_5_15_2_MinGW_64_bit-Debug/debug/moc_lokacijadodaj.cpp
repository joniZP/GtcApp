/****************************************************************************
** Meta object code from reading C++ file 'lokacijadodaj.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GTCApp/lokacijadodaj.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'lokacijadodaj.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_lokacijaDodaj_t {
    QByteArrayData data[18];
    char stringdata0[212];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_lokacijaDodaj_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_lokacijaDodaj_t qt_meta_stringdata_lokacijaDodaj = {
    {
QT_MOC_LITERAL(0, 0, 13), // "lokacijaDodaj"
QT_MOC_LITERAL(1, 14, 8), // "getnaziv"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 8), // "setnaziv"
QT_MOC_LITERAL(4, 33, 1), // "a"
QT_MOC_LITERAL(5, 35, 7), // "getgrad"
QT_MOC_LITERAL(6, 43, 7), // "setgrad"
QT_MOC_LITERAL(7, 51, 7), // "getopis"
QT_MOC_LITERAL(8, 59, 7), // "setopis"
QT_MOC_LITERAL(9, 67, 8), // "getsliku"
QT_MOC_LITERAL(10, 76, 10), // "dodajsliku"
QT_MOC_LITERAL(11, 87, 13), // "getkorisnikid"
QT_MOC_LITERAL(12, 101, 13), // "setkorisnikid"
QT_MOC_LITERAL(13, 115, 20), // "getkoordinatnasirina"
QT_MOC_LITERAL(14, 136, 20), // "setkoordinatnasirina"
QT_MOC_LITERAL(15, 157, 20), // "getkoordinatnaduzina"
QT_MOC_LITERAL(16, 178, 20), // "setkoordinatnaduzina"
QT_MOC_LITERAL(17, 199, 12) // "getbrojslika"

    },
    "lokacijaDodaj\0getnaziv\0\0setnaziv\0a\0"
    "getgrad\0setgrad\0getopis\0setopis\0"
    "getsliku\0dodajsliku\0getkorisnikid\0"
    "setkorisnikid\0getkoordinatnasirina\0"
    "setkoordinatnasirina\0getkoordinatnaduzina\0"
    "setkoordinatnaduzina\0getbrojslika"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_lokacijaDodaj[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      15,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   89,    2, 0x02 /* Public */,
       3,    1,   90,    2, 0x02 /* Public */,
       5,    0,   93,    2, 0x02 /* Public */,
       6,    1,   94,    2, 0x02 /* Public */,
       7,    0,   97,    2, 0x02 /* Public */,
       8,    1,   98,    2, 0x02 /* Public */,
       9,    1,  101,    2, 0x02 /* Public */,
      10,    1,  104,    2, 0x02 /* Public */,
      11,    0,  107,    2, 0x02 /* Public */,
      12,    1,  108,    2, 0x02 /* Public */,
      13,    0,  111,    2, 0x02 /* Public */,
      14,    1,  112,    2, 0x02 /* Public */,
      15,    0,  115,    2, 0x02 /* Public */,
      16,    1,  116,    2, 0x02 /* Public */,
      17,    0,  119,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString, QMetaType::Int,    4,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::QString,

       0        // eod
};

void lokacijaDodaj::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<lokacijaDodaj *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->getnaziv();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 1: _t->setnaziv((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: { QString _r = _t->getgrad();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->setgrad((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: { QString _r = _t->getopis();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 5: _t->setopis((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: { QString _r = _t->getsliku((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 7: _t->dodajsliku((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: { QString _r = _t->getkorisnikid();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: _t->setkorisnikid((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 10: { QString _r = _t->getkoordinatnasirina();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 11: _t->setkoordinatnasirina((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 12: { QString _r = _t->getkoordinatnaduzina();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 13: _t->setkoordinatnaduzina((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 14: { QString _r = _t->getbrojslika();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject lokacijaDodaj::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_lokacijaDodaj.data,
    qt_meta_data_lokacijaDodaj,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *lokacijaDodaj::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *lokacijaDodaj::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_lokacijaDodaj.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int lokacijaDodaj::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 15)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 15)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 15;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
