import QtQuick 2.0
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import QtLocation 5.6
import QtPositioning 5.6
import QtGraphicalEffects 1.12
Item {
    id: papas

SwipeView{
         id:slider1
         anchors.top: parent.top
         anchors.horizontalCenter: parent.horizontalCenter
         height: parent.height*0.8
         width: parent.width
         clip:true
         Repeater {
             model:_slika
        Rectangle
        {
            color: "blue"
            width: slider1.width
            height: slider1.height
            SwipeView
            {
                 id:slider
                 anchors.top: parent.top
                 anchors.horizontalCenter: parent.horizontalCenter
                 height: parent.height*0.5
                 width: parent.width*0.7
                 clip:true
                 Repeater {
                     model:_slika
                     Image
                     {
                        anchors.top : parent.top
                        id:slikalokacija
                        width: slider.width
                        height: slider.height
                        source:slika
                        fillMode: Image.Stretch

                     }

                       }

            }
            Rectangle
            {
                  x: parent.width/2
                  y:parent.width/2
                Text{
                  text:naziv
                  font.bold:true
                  font.pixelSize: 20
                  color:"white"
                }
            }
            Rectangle
            {
                //  anchors.bottom: parent.bottom
                //  anchors.bottomMargin: 50
                  x: parent.width/2
                  y:parent.width/2-50
                Text{
                    font.bold:true
                    font.pixelSize: 20
                    color:"white"
                  text:naziv


                }
            }
            Rectangle
            {
                  x: parent.width/2
                  y:parent.width/2-100
                Text{
                  text:naziv
                  font.bold:true
                  font.pixelSize: 20
                  color:"white"

                }
            }
            Rectangle
            {
                  x: parent.width/2
                  y:parent.width/2-150
                Text{
                  text:naziv
                  font.bold:true
                  font.pixelSize: 20
                  color:"white"
                }
            }
            }
        }

         }
    Rectangle
{
        id: declinebutton
    width:parent.width/2
    height: parent.height*0.2
    anchors.left:parent.left
     anchors.bottom: parent.bottom
    color: declineArea.pressed ? "white" : "red"
       smooth: declineArea.containsMouse
       MouseArea {
           id: declineArea
           anchors.fill: parent
           anchors.margins: -10
           hoverEnabled: true
           onClicked:pageLoader.source="loginForm.qml"
       }
Text{
    anchors.top:parent.top
    font.bold: true
   font.family: "Helvetica"
    anchors.centerIn: parent
    text:"ODBACI"
    color: declineArea.pressed ? "red":"white"
    font.pointSize: 15
}
}
    Rectangle
{
        id: acceptbutton
    width:parent.width/2
    x: parent.width/2
    height: parent.height*0.2
    anchors.right:parent.right
     anchors.bottom: parent.bottom
    color: acceptArea.pressed ? "white" : "green"

       smooth: acceptArea.containsMouse
       MouseArea {
           id: acceptArea
           anchors.fill: parent
           anchors.margins: -10
           hoverEnabled: true
           onClicked:pageLoader.source="loginForm.qml"
       }
Text{
    anchors.top:parent.top
    font.bold: true
   font.family: "Helvetica"
    anchors.centerIn: parent
    text:"PRIHVATI"
    color:acceptArea.pressed ? "green":"white"
    font.pointSize: 15
}
}
}
