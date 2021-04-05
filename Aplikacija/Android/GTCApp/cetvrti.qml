import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
Rectangle{
    color: "#445512"
    id: prikaz4
    width: 300
    height: 300

    ScrollView {
           id: scView
           anchors.centerIn: parent
           width: 200; height: 24 // The initial height is one line
           background: Rectangle {
               anchors.fill: parent
               border.color: "gray"
               radius: 5
           }

           TextArea {
               Material.accent: "white"
               id: contentText
               property int preContentHeight: 0
               wrapMode: TextArea.Wrap; selectByMouse: true;
               onContentHeightChanged: {
                   //The height of each line is 14, and it will scroll automatically when the input is greater than 3 lines
                   if(contentHeight > 14 && contentHeight < 56) {
                       if(contentHeight != preContentHeight) {
                           preContentHeight = contentHeight;
                           scView.height += 14;
                       }
                   }
               }
           }
       }

}
