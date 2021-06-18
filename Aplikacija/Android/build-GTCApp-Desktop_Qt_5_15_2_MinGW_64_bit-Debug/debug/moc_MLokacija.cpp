/****************************************************************************
** Meta object code from reading C++ file 'MLokacija.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../GTCApp/MLokacija.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'MLokacija.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_MLokacija_t {
    QByteArrayData data[12];
    char stringdata0[92];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MLokacija_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MLokacija_t qt_meta_stringdata_MLokacija = {
    {
QT_MOC_LITERAL(0, 0, 9), // "MLokacija"
QT_MOC_LITERAL(1, 10, 5), // "getId"
QT_MOC_LITERAL(2, 16, 0), // ""
QT_MOC_LITERAL(3, 17, 10), // "getKreator"
QT_MOC_LITERAL(4, 28, 8), // "getNaziv"
QT_MOC_LITERAL(5, 37, 7), // "getOpis"
QT_MOC_LITERAL(6, 45, 7), // "getGrad"
QT_MOC_LITERAL(7, 53, 8), // "getLikes"
QT_MOC_LITERAL(8, 62, 4), // "getX"
QT_MOC_LITERAL(9, 67, 4), // "getY"
QT_MOC_LITERAL(10, 72, 8), // "getSlika"
QT_MOC_LITERAL(11, 81, 10) // "getPunoIme"

    },
    "MLokacija\0getId\0\0getKreator\0getNaziv\0"
    "getOpis\0getGrad\0getLikes\0getX\0getY\0"
    "getSlika\0getPunoIme"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MLokacija[] = {

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
       3,    0,   65,    2, 0x02 /* Public */,
       4,    0,   66,    2, 0x02 /* Public */,
       5,    0,   67,    2, 0x02 /* Public */,
       6,    0,   68,    2, 0x02 /* Public */,
       7,    0,   69,    2, 0x02 /* Public */,
       8,    0,   70,    2, 0x02 /* Public */,
       9,    0,   71,    2, 0x02 /* Public */,
      10,    0,   72,    2, 0x02 /* Public */,
      11,    0,   73,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Int,
    QMetaType::QString,
    QMetaType::QString,
    QMetaType::QString,
    QMetaType::QString,
    QMetaType::Int,
    QMetaType::Double,
    QMetaType::Double,
    QMetaType::QString,
    QMetaType::QString,

       0        // eod
};

void MLokacija::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MLokacija *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { int _r = _t->getId();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 1: { QString _r = _t->getKreator();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 2: { QString _r = _t->getNaziv();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 3: { QString _r = _t->getOpis();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 4: { QString _r = _t->getGrad();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 5: { int _r = _t->getLikes();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 6: { double _r = _t->getX();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = std::move(_r); }  break;
        case 7: { double _r = _t->getY();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = std::move(_r); }  break;
        case 8: { QString _r = _t->getSlika();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: { QString _r = _t->getPunoIme();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject MLokacija::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_MLokacija.data,
    qt_meta_data_MLokacija,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *MLokacija::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MLokacija::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_MLokacija.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MLokacija::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
