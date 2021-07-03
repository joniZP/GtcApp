import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12


Rectangle
{

   anchors.fill: parent
   Rectangle
   {
       id: of
       anchors.top: parent.top
       height: 50
       width: parent.width
       color:"red"
       Rectangle
       {
           id: id
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"

           anchors.left: of.left
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: name
               text: qsTr("ID")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: opis
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"

           anchors.left: id.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: names
               text: qsTr("Tekst komentara")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: tip
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"

           anchors.left: opis.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: namess
               text: qsTr("Username")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: vreme
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"

           anchors.left: tip.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: namesss
               text: qsTr("Lokacija/Dogadjaj")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: razlog
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"

           anchors.left: vreme.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: namessss
               text: qsTr("Razlog")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: odluka
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"

           anchors.left: razlog.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: namesssss
               text: qsTr("ODLUKA")
               anchors.centerIn: parent
           }
       }

   }

   ScrollView
   {

       anchors.top: of.bottom
       width: parent.width
       height: parent.height

       ListView
       {
            boundsBehavior: ListView.StopAtBounds
            clip:true
            anchors.fill: parent
            width: parent.width
            height: parent.height
            model: _KModel
            delegate: ItemDelegate
            {

                height:150
                width:parent.width


                required property int idreport
                required property string tekst
                required property string username
                required property int lokdog
                required property string razlog
                //required property int idkom
                required property int index

                    Rectangle
                    {
                    width: parent.width
                    height: parent.height-10
                    anchors.verticalCenter: parent.verticalCenter
                    Rectangle
                    {
                        id:slikarect
                        height: parent.height
                        width: parent.width/6
                        //border.color: "#1b4676"
                        anchors.left: parent.left

                        border.color: "#1b4676"
                        Text{
                        color:"#1b4676"
                        font.bold: true
                            id:iddogadjajatext
                            text: idreport
                            anchors.centerIn: parent
                            wrapMode: Text.Wrap

                        }
                    }
                    Rectangle
                    {
                        id:nazivrect
                        height: parent.height
                       width: parent.width/6
                       //border.color: "#1b4676"
                        anchors.left: slikarect.right

                        border.color: "#1b4676"
                        Text{
                        color:"#1b4676"
                        font.bold: true
                            width:parent.width
                            //height: parent.height
                            id:nazivlokacijeprofil
                            text: qsTr(tekst)
                            anchors.centerIn: parent
                            wrapMode: Text.Wrap

                        }
                    }
                    Rectangle
                    {
                        id:gradrect
                        height: parent.height
                      width: parent.width/6
                      //border.color: "#1b4676"
                        anchors.left: nazivrect.right

                        border.color: "#1b4676"
                        Text{
                        color:"#1b4676"
                        font.bold: true

                            //width:parent.width
                            //height: parent.height
                            id:naz
                            anchors.leftMargin: 10
                            text: username
                            anchors.centerIn: parent
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle
                    {
                        id:autorrect
                        height: parent.height
                        width: parent.width/6
                        //border.color: "#1b4676"
                        anchors.left: gradrect.right

                        border.color: "#1b4676"
                        Text{
                        color:"#1b4676"
                        font.bold: true

                            id:autorprofil
                            text: lokdog===0 ? "Dogadjaj" : "Lokacija";
                            anchors.centerIn: parent
                        }

                    }
                    Rectangle
                    {
                        id:vremerect
                        height: parent.height
                        width: parent.width/6
                        //border.color: "#1b4676"
                        anchors.left: autorrect.right

                        border.color: "#1b4676"
                        Text{
                        color:"#1b4676"
                        font.bold: true
                            width:parent.width
                            //height: parent.height
                            id:fdf
                            text: razlog
                            anchors.centerIn: parent
                            wrapMode: Text.Wrap
                        }
                    }

               Rectangle
               {


                   height:parent.height
                   width: parent.width/6
                   anchors.left: vremerect.right
                   //border.color: "#1b4676"

               Rectangle //--------------------LOGIN DUGME----------------------------------
               {
                   id: declinebutton
                   //border.color: "#1b4676"
                   width: (parent.width*6)/15
                   height: 50
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.right:acceptbutton.left
                   //anchors.rightMargin: 10
                   color: mouseArea.pressed ? "white" : "red"
                   radius:10
                   scale:  mouseArea.containsMouse ? 0.6 :0.8
                      smooth: mouseArea.containsMouse
                      MouseArea {
                          id: mouseArea
                          anchors.fill: parent // BEZ NJEGA JE 0X0 mouseArea
                          anchors.margins: -10
                          hoverEnabled: true
                          onClicked:
                          {
                              block.visible=true;
                              //console.log("ID KOMENTARA::::::  "+idkom);
                             _KModel.obrisiprijavu(index);
block.visible=false;


                          }

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
                      width: (parent.width*6)/15
                      //border.color: "#1b4676"
                       height: 50
                      anchors.verticalCenter: parent.verticalCenter
                       anchors.right:parent.right
                       anchors.rightMargin:20
                   color: declineArea.pressed ? "white" : "green"
                   radius:10
                   scale:  declineArea.containsMouse ? 0.6 :0.8
                      smooth: mouseArea.containsMouse
                      MouseArea {
                          id: declineArea
                          anchors.fill: parent // BEZ NJEGA JE 0X0 mouseArea
                          anchors.margins: -10
                          hoverEnabled: true
                          onClicked:
                          {
                              block.visible=true;
                              //console.log("ID KOMENTARA::::::  "+idkom);
                              _KModel.prihvatiprijavu(index);
                              block.visible=false;
                              //pageLoader.source="loginForm.qml"

                          }
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
