/****************************************************************************
** Meta object code from reading C++ file 'UcitavanjeLokacije.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Administrator/UcitavanjeLokacije.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'UcitavanjeLokacije.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_UcitavanjeLokacije_t {
    QByteArrayData data[7];
    char stringdata0[71];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_UcitavanjeLokacije_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_UcitavanjeLokacije_t qt_meta_stringdata_UcitavanjeLokacije = {
    {
QT_MOC_LITERAL(0, 0, 18), // "UcitavanjeLokacije"
QT_MOC_LITERAL(1, 19, 6), // "ucitaj"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 11), // "getLokacija"
QT_MOC_LITERAL(4, 39, 10), // "MLokacija*"
QT_MOC_LITERAL(5, 50, 2), // "id"
QT_MOC_LITERAL(6, 53, 17) // "ucitajOdobravanje"

    },
    "UcitavanjeLokacije\0ucitaj\0\0getLokacija\0"
    "MLokacija*\0id\0ucitajOdobravanje"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_UcitavanjeLokacije[] = {

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
       1,    0,   29,    2, 0x02 /* Public */,
       3,    1,   30,    2, 0x02 /* Public */,
       6,    0,   33,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    0x80000000 | 4, QMetaType::Int,    5,
    QMetaType::Void,

       0        // eod
};

void UcitavanjeLokacije::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<UcitavanjeLokacije *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->ucitaj(); break;
        case 1: { MLokacija* _r = _t->getLokacija((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< MLokacija**>(_a[0]) = std::move(_r); }  break;
        case 2: _t->ucitajOdobravanje(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject UcitavanjeLokacije::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_UcitavanjeLokacije.data,
    qt_meta_data_UcitavanjeLokacije,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *UcitavanjeLokacije::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *UcitavanjeLokacije::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_UcitavanjeLokacije.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int UcitavanjeLokacije::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
