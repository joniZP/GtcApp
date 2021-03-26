import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
Window{
    width: 1920
    height: 1080
    visible: true
    //color: "blue"
  title: qsTr("GTCAdministrator")
  ColumnLayout
  {
      spacing:0
      width: parent.width
      height: parent.height
    Rectangle
    {
       //anchors.top : parent.top
        Layout.alignment: top
       Layout.minimumWidth: parent.width
       Layout.minimumHeight: 20
        color:"#0088ff"
    }
       RowLayout
       {
           Layout.fillWidth: true
           Layout.fillHeight: true
           spacing:0
           Rectangle
           {
               Layout.minimumHeight: parent.height
               Layout.minimumWidth: parent.width/5
               color: "#0088ff"
               MItem{
                   x:0
                   y:0
                   w:parent.width
                   h:parent.height/5
                   txt:"ProbaProba"
                   clr:parent.color
               }
               MItem{
                   x:0
                   y:parent.height/5
                   w:parent.width
                   h:parent.height/5
                   txt:"Dva tri"
                   clr:parent.color
               }
               MItem{
                   x:0
                   y:parent.height/5*2
                   w:parent.width
                   h:parent.height/5
                   txt:"Tri cetri"
                   clr:parent.color
               }


               Image {

                   id: logo
                   x:70
                   y:parent.height-(sourceSize.height/4)-50
                   source: "../new/prefix1/GTCLogo.png"
                   width: sourceSize.width/4
                   height:sourceSize.height/4
               }
           }
           Rectangle
           {
               Layout.fillWidth: true
               Layout.fillHeight: true
                color:"white"
           }
       }
  }
}
