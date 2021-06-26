/****************************************************************************
** Meta object code from reading C++ file 'lokacijaModel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Administrator/lokacijaModel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'lokacijaModel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_LokacijaModel_t {
    QByteArrayData data[7];
    char stringdata0[86];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_LokacijaModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_LokacijaModel_t qt_meta_stringdata_LokacijaModel = {
    {
QT_MOC_LITERAL(0, 0, 13), // "LokacijaModel"
QT_MOC_LITERAL(1, 14, 22), // "izbrisiprijavulokacije"
QT_MOC_LITERAL(2, 37, 0), // ""
QT_MOC_LITERAL(3, 38, 1), // "a"
QT_MOC_LITERAL(4, 40, 15), // "izbrisilokaciju"
QT_MOC_LITERAL(5, 56, 13), // "obrisiprijavu"
QT_MOC_LITERAL(6, 70, 15) // "prihvatiprijavu"

    },
    "LokacijaModel\0izbrisiprijavulokacije\0"
    "\0a\0izbrisilokaciju\0obrisiprijavu\0"
    "prihvatiprijavu"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_LokacijaModel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   34,    2, 0x02 /* Public */,
       4,    1,   37,    2, 0x02 /* Public */,
       5,    1,   40,    2, 0x02 /* Public */,
       6,    1,   43,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,

       0        // eod
};

void LokacijaModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<LokacijaModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->izbrisiprijavulokacije((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->izbrisilokaciju((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->obrisiprijavu((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->prihvatiprijavu((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject LokacijaModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QAbstractListModel::staticMetaObject>(),
    qt_meta_stringdata_LokacijaModel.data,
    qt_meta_data_LokacijaModel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *LokacijaModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *LokacijaModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_LokacijaModel.stringdata0))
        return static_cast<void*>(this);
    return QAbstractListModel::qt_metacast(_clname);
}

int LokacijaModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractListModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
