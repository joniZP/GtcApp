import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
Item {
    property int w: 100
    property int h:50
    property string id:"id"
    property string txt:" "
    property alias src: image.source
    property string clr:"#ffffff"

    id:id
    width:w
    height:h
    Rectangle{
        anchors.fill:parent
        color: clr
        RowLayout
        {
        spacing: 20
         // @disable-check M16
        height:parent.height
       Rectangle
       {
           id: imag
           color: clr
           Image
           {
               id: image
               anchors.fill: parent
           }

           width: 30
           height: 30
           Layout.leftMargin:10
           Layout.alignment: Qt.AlignVCenter
     }


       Text
       {
           id: name
           text: qsTr(txt)
       }
    }
}
}
