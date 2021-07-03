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
       id:pretragaUnosRectangle
       anchors.top: parent.top
       width: parent.width/5
       height:30
       Rectangle
       {
           width: parent.width-5
           height: parent.height-5
           anchors.centerIn: parent
           border.color: "black"
           TextInput
           {

               id:unospretraga

               height: parent.height
               width: parent.width-parent.height-5
               font.underline: false
               verticalAlignment: TextInput.AlignVCenter
               anchors.left: parent.left
               anchors.leftMargin: 5
               maximumLength: 30

               // background: null
           }
           Rectangle
           {
               color: "transparent"
               width: parent.height
               height: parent.height
               anchors.left: unospretraga.right
               Image
               {
                   id: slika
                   source: "qrc:/ikonice/loupe.png"
                   width: parent.height*0.8
                   height: parent.height*0.8
                   anchors.centerIn: parent
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {
                           block.visible=true
                            ucitajprofilInstance.ucitaj(unospretraga.text)
                           block.visible=false
                       }
                   }
               }
           }
       }
   }
   Rectangle
   {
       id: of
       anchors.top: pretragaUnosRectangle.bottom
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
               text: qsTr("Korisnicko ime")
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
               text: qsTr("Ime")
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
               text: qsTr("Prezime")
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
               text: qsTr("E-mail")
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
               text: qsTr("Slika")
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
            model: _PModel
            delegate: ItemDelegate
            {

                height:150
                width:parent.width


                required property string korisnickoime
                required property string ime
                required property string prezime
                required property string email
                required property string brslika
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
                            text: korisnickoime
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

                            //height: parent.height
                            id:nazivlokacijeprofil;
                            text: qsTr(ime);
                            anchors.centerIn: parent


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
                            text: prezime
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
                            text: qsTr(email)
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
                        Image
                        {
                            id:slikaprofil
                            anchors.fill: parent
                            fillMode: Image.PreserveAspectFit
                            source: brslika
                            onProgressChanged:
                            {
                                if(slikaprofil.progress==1)
                                {
                                   // slider.height=slikalokacija.paintedHeight
                                    spiner.visible=false
                                }
                            }
                            AnimatedImage
                            {
                                id:spiner
                                source: "qrc:/ikonice/spinnerpage.gif"
                                width: 150
                                height: 150
                                anchors.centerIn: parent
                               // visible: slikalokacija.progress!=1
                            }
                        }
                       /*{ Text{
                        color:"#1b4676"
                        font.bold: true
                            text: brslika
                            anchors.centerIn: parent
                            wrapMode: Text.Wrap
                        }*/
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
                   width: (parent.width*6)/8
                   height: 50
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.right:parent.right
                  anchors.rightMargin: 20
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
                               //console.log("IDNDEKS ZA PROVERU "+index);
                                _PModel.izbrisiprofil(index);
                               block.visible=false;

                          }

                      }
               Text{
                   anchors.top:parent.top
                   font.bold: true
                  font.family: "Helvetica"

                   anchors.centerIn: parent
                   text:"OBRISI"
                   color: mouseArea.pressed ? "red":"white"
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



