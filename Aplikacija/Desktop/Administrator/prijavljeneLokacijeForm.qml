import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import UcitavanjeLokacije 1.0
Rectangle
{

    id: par
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
           width:parent.width/10*2
           border.color: "#1b4676"
           border.width: 2
           color:"#04acf3"
           anchors.left: of.left
           Text {
               id: name
               text: qsTr("Slika")
               color:"white"
               font.bold: true
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: opis
           height:parent.height
           width:parent.width/10
           border.color: "#1b4676"
            border.width: 2
            color:"#04acf3"
           anchors.left: id.right
           Text {
               id: names
               text: qsTr("ID")
               color:"white"
               font.bold: true
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: tip
           height:parent.height
           width:parent.width/10
           border.color: "#1b4676"
           border.width: 2
             color:"#04acf3"
           anchors.left: opis.right
           Text {
               id: namess
               text: qsTr("Lokacija")
               color:"white"
               font.bold: true
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: vreme
           height:parent.height
           width:parent.width/10
           border.color: "#1b4676"
             border.width: 2
               color:"#04acf3"
           anchors.left: tip.right
           Text {
               id: namesss
               text: qsTr("Grad")
               color:"white"
               font.bold: true
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: razlog
           height:parent.height
           width:parent.width/10
           border.color: "#1b4676"
            border.width: 2
              color:"#04acf3"
           anchors.left: vreme.right
           Text {
               id: namessss
               text: qsTr("Username")
               color:"white"
               font.bold: true
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: odluka
           height:parent.height
           width:parent.width/10
           border.color: "#1b4676"
             border.width: 2
               color:"#04acf3"
           anchors.left: razlog.right
           Text {
               id: namesssss
               text: qsTr("ID korisnika")
               color:"white"
               font.bold: true
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: odlukaa
           height:parent.height
           width:parent.width/10
           border.color: "#1b4676"
             border.width: 2
               color:"#04acf3"
           anchors.left: odluka.right
           Text {
               id: namessssss
               text: qsTr("Razlog")
               color:"white"
               font.bold: true
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: odlukaaa
           height:parent.height
           width:parent.width/10*2
           border.color: "#1b4676"
             border.width: 2
               color:"#04acf3"
           anchors.left: odlukaa.right
           Text {
               id: namesssssss
               text: qsTr("ODLUKA")
               color:"white"
               font.bold: true
               anchors.centerIn: parent
           }
       }

   }

   ScrollView
   {
       id:scrollkorisniklokacija
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
            model: _LModel
            delegate: ItemDelegate
            {
                height:150
                width:par.width
               required property int id
               required property string slika
               required property string naziv
               required property string grad
               required property string idkorisnika
               required property string razlog
               required property string username
               required property int index

                   Rectangle
                   {
                   //color: "red"
                   width: parent.width
                   height: parent.height
                   anchors.verticalCenter: parent.verticalCenter
                   Rectangle
                   {
                       id:slikarect
                       height: parent.height
                       width: parent.width/10*2
                       //color: "red"
                       anchors.left: parent.left
                       border.color: "#1b4676"

                                Image{
                                    id:slikalokacija
                                   width:parent.width
                                   height:parent.height
                                   source:slika
                                   fillMode: Image.PreserveAspectFit
                                   onProgressChanged:
                                   {
                                       if(slikalokacija.progress==1)
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
                                   MouseArea
                                   {
                                       anchors.fill:parent
                                       onClicked:
                                       {
                                           block.visible=true
                                          getLokacijaById(id)
                                           popup.visible=true
                                           block.visible=false
                                       }
                                       onEntered:
                                       {
                                           slikarect.opacity= 0.2
                                       }
                                       onExited:
                                       {
                                            slikarect.opacity = 1
                                       }

                                   }
                                }
                   }
                   Rectangle
                   {
                   //    color: "green"
                       id:idrect
                       height: parent.height
                       width: parent.width/10
                       anchors.left: slikarect.right
                       border.color: "#1b4676"
                       Text
                       {
                           id: idprofila
                           text: id
                           color:"#1b4676"
                           font.bold: true
                         //  anchors.left : slikarect.right
                           anchors.centerIn: parent
                       }
                   }
                   Rectangle
                   {
                     // color: "yellow"
                       id:nazivrect
                       height: parent.height
                       width: parent.width/10
                       anchors.left:idrect.right
                       border.color: "#1b4676"
                       Text
                       {
                           id: nazivprofila
                           text: qsTr(naziv)
                           anchors.left: parent.left
                           color:"#1b4676"
                           font.bold: true
                           //anchors.leftMargin: 15

                            anchors.centerIn: parent
                       }
                   }
                   Rectangle
                   {
                      // color:"black"
                       id:gradrect
                       height: parent.height
                       width: parent.width/10
                       anchors.left: nazivrect.right
                       border.color: "#1b4676"
                       Text
                       {
                           id:gradprofil
                           //text: qsTr(grad)
                           text: qsTr(grad)
                           anchors.left: parent.left
                           color:"#1b4676"
                           font.bold: true
                           //anchors.leftMargin: 15

                            anchors.centerIn: parent
                       }
                   }
                   Rectangle
                   {
                       id:idkorisnikarect
                       height: parent.height
                       width: parent.width/10
                       anchors.left: gradrect.right
                       border.color: "#1b4676"
                       Text
                       {
                           id: idkorisnikaprofil
                           //text: qsTr(grad)
                           text: qsTr(idkorisnika)
                           anchors.left: parent.left
                           anchors.centerIn: parent
                           color:"#1b4676"
                           font.bold: true
                       }
                   }

                   Rectangle
                   {
                       id:usernamerect
                       height: parent.height
                       width: parent.width/10
                       anchors.left: idkorisnikarect.right
                       border.color: "#1b4676"
                       Text
                       {
                           id:usrnm
                          // text: qsTr(grad)
                           text:qsTr(username)
                           anchors.centerIn: parent
                           color:"#1b4676"
                           font.bold: true
                       }
                   }
                   Rectangle
                   {
                       id:razlogrect
                       height: parent.height
                       width: parent.width/10
                       anchors.left:usernamerect.right
                       border.color: "#1b4676"
                       Text
                       {
                           width:parent.width
                           id:razlogprofil
                          // text: qsTr(grad)
                           text:qsTr(razlog)
                           color:"#1b4676"
                           font.bold: true
                           anchors.verticalCenter: parent.verticalCenter
                           wrapMode: Text.Wrap
                       }
                   }

                   Rectangle{

                       anchors.left: razlogrect.right
                       border.color: "#1b4676"
                       height: parent.height
                       width: parent.width/10*2
                   Rectangle //--------------------dugme1---------------------------------
                   {
                   id: declinebutton
                   height: 50
                   width: parent.width/2
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.right:acceptbutton.left

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
                             _LModel.obrisiprijavu(index);
                            block.visible=false;
                          }
                                 }
               Text{
                   anchors.top:parent.top
                   font.bold: true
                  font.family: "Helvetica"

                   anchors.centerIn: parent
                   text:"ODBACI \n PRIJAVU"
                   color: mouseArea.pressed ? "red":"white"
                   font.pointSize: 10
                     }
                    }//rect
                   Rectangle //---------------------dugme2-------------------------------
               {
                       id: acceptbutton
                       height: 50
                       width: parent.width/2
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.right:parent.right
                      // anchors.rightMargin:10
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
                              _LModel.prihvatiprijavu(index);
                            block.visible = false;
                          }
                      }
               Text{
                   anchors.top:parent.top
                   font.bold: true
                  font.family: "Helvetica"

                   anchors.centerIn: parent
                   text:"PRIHVATI \n PRIJAVU"
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



   Rectangle {
       id:popup
       visible:false
   anchors.fill: parent
   Flickable{
   //  contentHeight: 800
    anchors.fill: parent
    boundsBehavior: Flickable.StopAtBounds
    contentWidth: parent.width
    contentHeight: slider.height//+undrImg.height
    clip: true
   SwipeView{
        id:slider
        anchors.top: parent.top
        height: par.height/2.3
        width: parent.width
        property var model :ListModel{}
        clip:true
        Repeater {
            model:_slika
            Image{
                id:slikalokacij
               width: slider.width
               height: slider.height
               source:slika
               fillMode: Image.PreserveAspectFit
               onProgressChanged:
               {
                   if(slikalokacij.progress==1)
                   {
                      // slider.height=slikalokacija.paintedHeight
                       spiner.visible=false
                   }
               }
               AnimatedImage
               {
                   id:spiner
                   source: "../Spinner-1s-200px (1).gif"
                   width: 60
                   height: 60
                   anchors.centerIn: parent
                  // visible: slikalokacija.progress!=1
               }
            }

        }
     }
   PageIndicator {
       id: pageind
      anchors.bottom: slider.bottom
     // anchors.topMargin: verticalMargin
      anchors.horizontalCenter: parent.horizontalCenter
      currentIndex: slider.currentIndex
      count: slider.count
   }

   Rectangle
   {
       id:undrImg
       anchors.top: pageind.bottom
       color: "#d3d3d3"
       width: parent.width
       height: 1000

          Rectangle
          {
              id: autorLokacije
              width: parent.width-20
              height: 100
              anchors.top: parent.top
              anchors.topMargin: 20
              anchors.horizontalCenter: parent.horizontalCenter
              color: "white"
              Image {
                      id: profilnaimage
                      source: location.getSlika()
                      width: parent.height*0.8
                      height:parent.height*0.8
                      fillMode: Image.PreserveAspectCrop
                      anchors.left: parent.left
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.leftMargin: 10
                      layer.enabled: true
                      layer.effect: OpacityMask
                      {
                          maskSource: mask
                      }
                      }
              Text {
                  id: kreator_ime
                  text: qsTr(location.getPunoIme())
                  font.family: "Helvetica"
                  font.pointSize: 18
                  anchors.left: profilnaimage.right
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.leftMargin: 10
              }
                  Rectangle {
                      id: mask
                      width: parent.height*0.8
                      height:parent.height*0.8
                      radius: parent.height*0.4
                      visible: false
                  }

          }
          Rectangle
          {
              id: nazivLokacije
              width: parent.width-20
              height: 100
              anchors.top: autorLokacije.bottom
              anchors.topMargin: 10
              anchors.horizontalCenter: parent.horizontalCenter
              color: "white"
              Text{
                  id: nazivtxt
                  text: qsTr(location.getNaziv())
                  font.family: "Helvetica"
                  font.pointSize: 16
                  anchors.verticalCenter: parent.verticalCenter
                 anchors.horizontalCenter: parent.horizontalCenter
                  // anchors.leftMargin: 10
              }
              Text{
                  id: gradtxt
                  text: qsTr(location.getGrad())
                  font.family: "Helvetica"
                  font.pointSize: 16
                  anchors.verticalCenter: parent.verticalCenter
                 anchors.horizontalCenter: parent.horizontalCenter
                  anchors.top: nazivtxt.bottom
              }
          }
          Rectangle{
              id: opislokacije
              width: parent.width-20
              height: 200
              anchors.top: nazivLokacije.bottom
              anchors.topMargin: 10
              anchors.horizontalCenter: parent.horizontalCenter
              Text{
                  id: opistxt
                  text: qsTr(location.getOpis())
                  width: parent.width-20
                  font.family: "Helvetica"
                  font.pointSize: 16
                  anchors.verticalCenter: parent.verticalCenter
                 anchors.horizontalCenter: parent.horizontalCenter
                 wrapMode: Text.WordWrap
                 // anchors.leftMargin: 10
              }
          }

          Button
          {
              id: dugmelolresiperuza4minuta
              width: 60
              height:40

              anchors.top: opislokacije.bottom
              anchors.topMargin: 20
              anchors.horizontalCenter: parent.horizontalCenter
              text:"Nazad"
              onClicked:
              {
                  block.visible=true
                  popup.visible=false
                  block.visible=false
              }
          }

   }
   }
   }



}
