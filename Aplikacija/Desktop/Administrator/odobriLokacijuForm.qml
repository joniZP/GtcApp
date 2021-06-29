import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
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
           width:parent.width/6
           anchors.left: of.left
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2

           Text
           {
           color:"white"
           font.bold: true
               id: name
               text: qsTr("Slika")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: opis
           height:parent.height
           width:parent.width/6
           anchors.left: id.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2

           Text
           {
           color:"white"
           font.bold: true
               id: names
               text: qsTr("ID")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: tip
           height:parent.height
           width:parent.width/6
           anchors.left: opis.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2

           Text
           {
           color:"white"
           font.bold: true
               id: namess
               text: qsTr("Lokacija")
               anchors.centerIn: parent
           }
       }

       Rectangle
       {
           id: vreme
           height:parent.height
           width:parent.width/6
            anchors.left: tip.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2

           Text
           {
           color:"white"
           font.bold: true
               id: namesss
               text: qsTr("Grad")
               anchors.centerIn: parent
           }
       }
       Rectangle
       {
           id: razlog
           height:parent.height
           width:parent.width/6
           anchors.left: vreme.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2

           Text
           {
           color:"white"
           font.bold: true
               id: namessss
               text: qsTr("ID Korisnika")
               anchors.centerIn: parent
           }
       }

       Rectangle
       {
           id: odlukaaa
           height:parent.height
           width:parent.width/6
           anchors.left: razlog.right
           color:"#04acf3"
           border.color: "#1b4676"
           border.width: 2
           Text{
           color:"white"
           font.bold: true
               id: namesssssss
               text: qsTr("ODLUKA")
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
               required property int index

                   Rectangle
                   {
                   width: parent.width
                   height: parent.height
                   anchors.verticalCenter: parent.verticalCenter
                   Rectangle
                   {
                       id:slikarect
                       height: parent.height
                       width: parent.width/6             
                       anchors.left: parent.left

                                Image
                                {
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
                                          getLokacijaById(id)
                                           popup.visible=true
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
                       id:idrect
                       height: parent.height
                       width: parent.width/6
                       anchors.left: slikarect.right
                       border.color: "#1b4676"

                       Text
                       {
                       color:"#1b4676"
                       font.bold: true
                           id: idprofila
                           text: id             
                           anchors.centerIn: parent
                       }
                   }
                   Rectangle
                   {
                       id:nazivrect
                       height: parent.height
                       width: parent.width/6
                       anchors.left:idrect.right
                       border.color: "#1b4676"

                       Text
                       {
                       color:"#1b4676"
                       font.bold: true
                           id: nazivprofila
                           text: qsTr(naziv)
                           anchors.left: parent.left
                           anchors.centerIn: parent
                       }
                   }
                   Rectangle
                   {
                       id:gradrect
                       height: parent.height
                       width: parent.width/6
                       anchors.left: nazivrect.right
                       border.color: "#1b4676"

                       Text
                       {
                       color:"#1b4676"
                       font.bold: true
                           id:gradprofil
                           text: qsTr(grad)
                           anchors.left: parent.left
                            anchors.centerIn: parent
                       }
                   }
                   Rectangle
                   {
                       id:idkorisnikarect
                       height: parent.height
                       width: parent.width/6
                       anchors.left: gradrect.right
                       border.color: "#1b4676"
                       Text
                       {
                       color:"#1b4676"
                       font.bold: true
                           id: idkorisnikaprofil
                           text: qsTr(idkorisnika)
                           anchors.left: parent.left
                           anchors.centerIn: parent
                       }
                   }

                   Rectangle
                   {
                       anchors.left: idkorisnikarect.right
                       height: parent.height
                       width: parent.width/6
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
                          anchors.fill: parent
                          anchors.margins: -10
                          hoverEnabled: true
                          onClicked:
                          {
                              block.visible=true;
                              console.log("IDNDEKS ZA PROVERU "+id);
                             _LModel.odbaciprijavu(index,id);
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
                    }//rect
                   Rectangle //---------------------dugme2-------------------------------
               {
                       id: acceptbutton
                       height: 50
                       width: parent.width/2
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.right:parent.right
                   color: declineArea.pressed ? "white" : "green"
                   radius:10
                   scale:  declineArea.containsMouse ? 0.6 :0.8
                      smooth: mouseArea.containsMouse
                      MouseArea {
                          id: declineArea
                          anchors.fill: parent
                          anchors.margins: -10
                          hoverEnabled: true
                          onClicked:
                          {
                              block.visible=true;
                              console.log("IDNDEKS ZA PROVERU "+id);
                              _LModel.verifikujLokaciju(id);
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
                       spine.visible=false
                   }
               }
               AnimatedImage
               {
                   id:spine
                   source: "qrc:/ikonice/spinnerpage.gif"
                   width: 150
                   height: 150
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
                      onProgressChanged:
                      {
                          if(profilnaimage.progress==1)
                          {
                             // slider.height=slikalokacija.paintedHeight
                              spiner.visible=false
                          }
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
                  font.family: "Helvetica"
                  font.pointSize: 16
                  anchors.verticalCenter: parent.verticalCenter
                 anchors.horizontalCenter: parent.horizontalCenter
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
                  popup.visible=false
              }
          }

   }
   }
   }
   Rectangle
   {
       id:block
       anchors.fill: parent
       visible: false
       color: "transparent"


       Rectangle{
       id: blockcolor
       anchors.fill: block
       color: "white"
       opacity: 0.4
       }

       AnimatedImage
       {
           source: "../ikonice/spinnerpage.gif"
           width: 150
           height: 150
           anchors.centerIn: parent
       }
       MouseArea {

       anchors.fill: parent

       onClicked: mouse.accepted = true

       }

   }


}
