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
        opacity:1
       radius:3
        border.color: "white"
        border.width: 1

        RowLayout
        {
        spacing: 20
         // @disable-check M16
        height:parent.height
       Rectangle
       {
           id: imag
           color: clr
           Layout.alignment: Qt.AlignLeft
           Image
           {
               id: image
               anchors.fill: parent
               source: src
           }

           width: 30
           height: 30
           Layout.leftMargin:50
           //Layout.alignment: Qt.AlignVCenter
     }


       Text
       {
           id: name
           text: qsTr(txt)
           color:"white"
           font.pointSize: 15
           font.bold:true
           //anchors.centerIn: parent
       }
    }
}
}
