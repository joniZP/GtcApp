import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
Rectangle
{

   anchors.fill: parent
   ScrollView
   {
       width: parent.width
       height: parent.height

       ListView
       {
            boundsBehavior: ListView.StopAtBounds
            clip:true
            anchors.fill: parent
            width: parent.width
            height: parent.height
            model:_slika
            delegate: ItemDelegate
            {
                height:200
                width:parent.width
               required property int id
               required property string slika
               required property string naziv
               required property string grad

                   Rectangle
                   {
                   width: parent.width
                   height: parent.height-10
                   anchors.verticalCenter: parent.verticalCenter
                   Rectangle
                   {
                         //border.color:"#595959"
                       id:slikarect
                       height: parent.height
                       width: 200
                       //color: "red"
                       anchors.left: parent.left
                       Image
                       {
                           id:lokacijaprofilimage
                           source: slika
                           width: parent.width
                           height: parent.height
                       }
                   }
                   Rectangle
                   {
                       id:nazivrect
                       height: parent.height
                       width: 170
                       anchors.left: slikarect.right
                       Text
                       {
                           id:nazivlokacijeprofil
                           text: qsTr(naziv)
                           anchors.left: parent.left
                           anchors.leftMargin: 20
                           anchors.verticalCenter: parent.verticalCenter
                       }
                   }
                   Rectangle
                   {
                       id:gradrect
                       height: parent.height
                       width:200
                       anchors.left: nazivrect.right
                       Text
                       {
                           id:opislokacijeprofil
                           text: qsTr(grad)
                           anchors.left: parent.left
                           anchors.leftMargin: 15
                           anchors.verticalCenter: parent.verticalCenter
                       }
                   }
                   Rectangle
                   {
                       id:autorrect
                       height: parent.height
                       width:200
                       anchors.left: gradrect.right
                       Text
                       {
                           id:autorprofil
                           //text: qsTr(grad)
                           text: "autor"
                           anchors.left: parent.left
                           anchors.leftMargin: 15
                           anchors.verticalCenter: parent.verticalCenter
                       }
                   }
                   Rectangle
                   {
                       id:prijaviorect
                       height: parent.height
                       width:200
                       anchors.left: autorrect.right
                       Text
                       {
                           id:prijavioprofil
                           //text: qsTr(grad)
                           text: "prijavio"
                           anchors.left: parent.left
                           anchors.leftMargin: 15
                           anchors.verticalCenter: parent.verticalCenter
                       }
                   }
                   Rectangle
                   {
                       id:razlog
                       height: parent.height
                       width:200
                       anchors.left: prijaviorect.right
                       Text
                       {
                           id:razlogprofil
                          // text: qsTr(grad)
                           text:"Razlog"
                           anchors.left: parent.left
                           anchors.leftMargin: 15
                           anchors.verticalCenter: parent.verticalCenter
                       }
                   }
                   Rectangle //--------------------LOGIN DUGME----------------------------------
               {
                   id: declinebutton
                   width:100
                   height: 50
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left:razlog.right
                   color: mouseArea.pressed ? "white" : "red"
                   radius:10
                   scale:  mouseArea.containsMouse ? 0.6 :0.7
                      smooth: mouseArea.containsMouse
                      MouseArea {
                          id: mouseArea
                          anchors.fill: parent // BEZ NJEGA JE 0X0 mouseArea
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
                   color: mouseArea.pressed ? "red":"white"
                   font.pointSize: 10
               }
               }
                   Rectangle //--------------------LOGIN DUGME----------------------------------
               {
                       id: acceptbutton
                       width:100
                       height: 50
                      anchors.verticalCenter: parent.verticalCenter
                       anchors.left:declinebutton.right
                       anchors.leftMargin:10
                   color: declineArea.pressed ? "white" : "green"
                   radius:10
                   scale:  declineArea.containsMouse ? 0.6 :0.7
                      smooth: mouseArea.containsMouse
                      MouseArea {
                          id: declineArea
                          anchors.fill: parent // BEZ NJEGA JE 0X0 mouseArea
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
                   color:declineArea.pressed ? "green":"white"
                   font.pointSize: 10
               }
               }

                   MouseArea
                   {
                       anchors.fill:parent
                       onClicked:
                       {
                           opislokacijeprofil.text=id
                           block.visible=true
                           funkcija(id)
                           block.visible=false
                           pageLoader.source= "lokacija.qml"
                       }
                   }


            }
               Rectangle
               {
                   width: parent.width
                   height: 1
                   color: "#c9c9c9"
                   anchors.bottom: parent.bottom
               }
        }
    }
}
}
