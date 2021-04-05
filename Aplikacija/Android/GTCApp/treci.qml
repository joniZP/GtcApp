import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle
{
    color: "#125599"
    id: prikaz4
    width: 300
    height: 300

    Flickable{
    //  contentHeight: 800
     anchors.fill: parent
     boundsBehavior: Flickable.StopAtBounds
     contentWidth: parent.width; contentHeight: 800

     //contentHeight: 800
     //clip: true
      Item
   {
       id:item4
       width: parent.width
        anchors.top: item3.bottom
       height: 200
       Rectangle
       {
           anchors.fill: parent
           color: "pink"
       }
   }
   Item
   {
       id:item5
       width: parent.width
       implicitHeight: 400
        anchors.top: item3.bottom
       height: 400
       Rectangle
       {
           anchors.fill: parent
           color: "pink"
       }
   }
   Item
   {
       id:item6
       width: parent.width
       implicitHeight: 400
        anchors.top: item5.bottom
       height: 400
       Rectangle
       {
           anchors.fill: parent
           color: "green"
       }
   }
}
    }
