import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
    Item {
         property int widt: 100
         property int heigh: 100
         property string id: "id"
         property string recid: "id"
         property string tex: ""
         property alias sourc: image.source
         property string color_: "#ffffff"
         id: id
         width: widt
         height: heigh
         Rectangle
         {
            anchors.fill: parent
             id: recid
             color: color_
         RowLayout
         {
         spacing: 20
          // @disable-check M16
         height:parent.height
        Rectangle
        {
            id: imag
            color: color_
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
            text: qsTr(tex)
        }

    }

   }
 }
