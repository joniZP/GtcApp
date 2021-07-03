/****************************************************************************
** Meta object code from reading C++ file 'dogadjajmodel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Administrator/dogadjajmodel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dogadjajmodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Dogadjajmodel_t {
    QByteArrayData data[8];
    char stringdata0[107];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Dogadjajmodel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Dogadjajmodel_t qt_meta_stringdata_Dogadjajmodel = {
    {
QT_MOC_LITERAL(0, 0, 13), // "Dogadjajmodel"
QT_MOC_LITERAL(1, 14, 23), // "izbrisiprijavudogadjaja"
QT_MOC_LITERAL(2, 38, 0), // ""
QT_MOC_LITERAL(3, 39, 1), // "a"
QT_MOC_LITERAL(4, 41, 15), // "izbrisidogadjaj"
QT_MOC_LITERAL(5, 57, 19), // "izbrisiDogadjajzaId"
QT_MOC_LITERAL(6, 77, 13), // "obrisiprijavu"
QT_MOC_LITERAL(7, 91, 15) // "prihvatiprijavu"

    },
    "Dogadjajmodel\0izbrisiprijavudogadjaja\0"
    "\0a\0izbrisidogadjaj\0izbrisiDogadjajzaId\0"
    "obrisiprijavu\0prihvatiprijavu"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Dogadjajmodel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x02 /* Public */,
       4,    1,   42,    2, 0x02 /* Public */,
       5,    1,   45,    2, 0x02 /* Public */,
       6,    1,   48,    2, 0x02 /* Public */,
       7,    1,   51,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,

       0        // eod
};

void Dogadjajmodel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Dogadjajmodel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->izbrisiprijavudogadjaja((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->izbrisidogadjaj((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->izbrisiDogadjajzaId((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->obrisiprijavu((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->prihvatiprijavu((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Dogadjajmodel::staticMetaObject = { {
    QMetaObject::SuperData::link<QAbstractListModel::staticMetaObject>(),
    qt_meta_stringdata_Dogadjajmodel.data,
    qt_meta_data_Dogadjajmodel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Dogadjajmodel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Dogadjajmodel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Dogadjajmodel.stringdata0))
        return static_cast<void*>(this);
    return QAbstractListModel::qt_metacast(_clname);
}

int Dogadjajmodel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractListModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
