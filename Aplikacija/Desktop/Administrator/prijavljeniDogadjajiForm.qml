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
color:"#04acf3"
           anchors.left: of.left
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
color:"#04acf3"
           anchors.left: id.right
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: names
               text: qsTr("Opis")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: tip
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"
color:"#04acf3"
           anchors.left: opis.right
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: namess
               text: qsTr("Tip")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: vreme
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"
color:"#04acf3"
           anchors.left: tip.right
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: namesss
               text: qsTr("Razlog")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: razlog
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"
color:"#04acf3"
           anchors.left: vreme.right
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: namessss
               text: qsTr("Vreme")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: odluka
           height:parent.height
           width:parent.width/6
           //border.color: "#1b4676"
color:"#04acf3"
           anchors.left: razlog.right
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
            model: _DModel
            delegate: ItemDelegate
            {

                height:150
                width:parent.width

                required property int idDogadjaja
                required property string opis
                required property string tip
                required property string razlog
                required property string vreme
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
                            text: idDogadjaja
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
                            text: qsTr(opis)
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
                            text: tip
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
                            width:parent.width
                            id:autorprofil
                            text: qsTr(razlog)

                            anchors.verticalCenter: parent.verticalCenter
                            wrapMode: Text.Wrap
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
                            text: qsTr(vreme)
                            anchors.centerIn: parent
                            wrapMode: Text.Wrap
                        }
                    }

                Rectangle{


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
                              console.log("IDNDEKS ZA PROVERU "+index);
                             _DModel.obrisiprijavu(index);
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
                              console.log("IDNDEKS ZA PROVERU "+index);
                              _DModel.prihvatiprijavu(index);
                              //pageLoader.source="loginForm.qml"
                              block.visible=false;
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



