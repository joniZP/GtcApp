import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle
{
    color: "#125599"
    id: prikaz4
    width: 300
    height: 300



    Rectangle {
           anchors.fill: flickable
           radius: 20
       }

       Flickable {
           id: flickable
           width: parent.width
           height: Math.min(contentHeight, 300)
           contentWidth: width
           contentHeight: textArea.implicitHeight

           TextArea.flickable: TextArea {
               id: textArea
               text: qsTr("Hello, world! Hello, world! Hello, world! Hello, world! ")
               wrapMode: Text.WordWrap
           }
           ScrollBar.vertical: ScrollBar {}
       }
    }
