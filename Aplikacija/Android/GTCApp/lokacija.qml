import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import QtLocation 5.6
import QtPositioning 5.6
import QtGraphicalEffects 1.12
//import QtWebView 1.1
import UcitavanjeLokacije 1.0
import MLokacija 1.0

Rectangle {
    id:par
/*
    Component.onCompleted:
    {
       let ll= ucitajInstance.getLokacija(1)
       location = ll;
    }
*/


anchors.fill: parent
Flickable{
//  contentHeight: 800
 anchors.fill: parent
 boundsBehavior: Flickable.StopAtBounds
 contentWidth: parent.width
 contentHeight: slider.height+hhh.height
 clip: true
SwipeView{
     id:slider
     anchors.top: parent.top
     height: par.height/2.3
     width: parent.width
     property var model :ListModel{}
     clip:true
     Repeater {
         model:_slikamodel
         Image{
             id:slikalokacija
            width: slider.width
            height: slider.height
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
                source: "/new/prefix1/spinnerpicture.gif"
                width: 150
                height: 150
                anchors.centerIn: parent
               // visible: slikalokacija.progress!=1
            }
         }

     }
  }
PageIndicator {
   anchors.bottom: slider.bottom
  // anchors.topMargin: verticalMargin
   anchors.horizontalCenter: parent.horizontalCenter
   currentIndex: slider.currentIndex
   count: slider.count
}
Rectangle
{
    id:hhh
    anchors.top: slider.bottom
    color: "#d3d3d3"
    width: parent.width
    height: 1000




    Rectangle
    {

      width:parent.width
      anchors.top: parent.top
      anchors.topMargin: 10

    Rectangle
    {
        id: lokacija_opis_kontejner
        width: parent.width-20
        height: naziv_lokacije.height+opis_lokacije.height+20
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        Text {
            id: naziv_lokacije
            text: qsTr(location.getNaziv())
            font.family: "Helvetica"
            font.pointSize: 18
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: opis_lokacije
            anchors.top: naziv_lokacije.bottom
            anchors.topMargin: 20
            text: qsTr(location.getOpis())

            font.family: "Helvetica"
            font.pointSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width-50
            wrapMode: Text.WordWrap
        }
        }

    Rectangle {

        id: webView
        anchors.top: lokacija_opis_kontejner.bottom
        anchors.topMargin: 10
        width: parent.width-20
        anchors.horizontalCenter: parent.horizontalCenter
        height: 200
        Plugin {
               id: mapPlugin
               name: "osm" // "mapboxgl", "esri", ...
               // specify plugin parameters if necessary
               // PluginParameter {
               //     name:
               //     value:
               // }
           }

           Map {
               anchors.fill: parent
               plugin: mapPlugin
               center: QtPositioning.coordinate(location.getX(),location.getY())
               zoomLevel: 14
               MapQuickItem {
                   id: marker
                   anchorPoint.x: image.width/4
                   anchorPoint.y: image.height
                   coordinate: QtPositioning.coordinate(location.getX(),location.getY());

                   sourceItem: Image {
                       id: image
                       source: "qrc:/new/prefix1/pin.png"
                       width: 20
                       height: 20
                   }
               }

           }
    }


       Rectangle
       {
           id: lokacija_kreator
           width: parent.width-20
           height: 50
           anchors.top: webView.bottom
           anchors.topMargin: 10
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

                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {
                          block.visible = true;
                          getProfilByUsername(location.getKreator())
                          pageLoader.source = "profil.qml"
                          block.visible = false;
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
           id: lokacija_kreat
           width: parent.width-20
           height: 50
           anchors.top: lokacija_kreator.bottom
           anchors.topMargin: 5
           anchors.horizontalCenter: parent.horizontalCenter
           color: "white"
          Rectangle
          {
              id: like
              width: parent.width/3
              height: parent.height
             // color: "red"
              anchors.left: parent.left

              Rectangle{
                  //color:"red"
                  anchors.centerIn: parent
                  width: like_slika.width+like_tekst.width+5
                  height: parent.height
              Image {
                      id: like_slika
                      source: ucitajInstance.vratiIkonicu()
                      width: parent.height*0.5
                      height:parent.height*0.5
                      fillMode: Image.PreserveAspectCrop
                      anchors.left: parent.left
                      anchors.verticalCenter:parent.verticalCenter
                      anchors.leftMargin: 5
              }
              Text {
                  id: like_tekst
                  text: qsTr("Svidja mi se")
                  font.family: "Helvetica"
                  font.pointSize: 14
                  anchors.left: like_slika.right
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.leftMargin: 5
              }
              MouseArea
              {
                  anchors.fill: parent
                  onClicked:
                  {
                    ucitajInstance.clickOnLike();
                    like_slika.source = ucitajInstance.vratiIkonicu();
                  }
              }
              }
          }
          Rectangle
          {

              id:komentar_dugme
              width: parent.width/3
              height: parent.height
              //color: "blue"
              anchors.left: like.right

              Rectangle{
                  //color:"red"
                  anchors.centerIn: parent
                  width: komentar_slika.width+komentar_text.width+10
                  height: parent.height
              Image {
                      id: komentar_slika
                      source: "../new/prefix1/comment.png"
                      width: parent.height*0.5
                      height:parent.height*0.5
                      fillMode: Image.PreserveAspectCrop
                      anchors.left: parent.left
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.leftMargin: 5
              }
              Text {
                  id: komentar_text
                  text: qsTr("Komentar")
                  font.family: "Helvetica"
                  font.pointSize: 14
                  anchors.left: komentar_slika.right
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.leftMargin: 5
              }
              MouseArea
              {
                  anchors.fill: parent
                  onClicked:
                  {
                      block.visible=true;
                      ucitajInstance.ucitajKomentare(location.getId())
                      draw.open()
                      block.visible = false;
                  }
              }
              }

          }
          Rectangle
          {
              width: parent.width/3
              height: parent.height
             // color: "green"
              anchors.left: komentar_dugme.right

              Rectangle{
                 // color:"red"
                  anchors.centerIn: parent
                  width: share_slika.width+share_tekst.width+10
                  height: parent.height
              Image {
                      id: share_slika
                      source: "../new/prefix1/share.png"
                      width: parent.height*0.5
                      height:parent.height*0.5
                      fillMode: Image.PreserveAspectCrop
                      anchors.left: parent.left
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.leftMargin: 5
              }
              Text {
                  id: share_tekst
                  text: qsTr("Podeli")
                  font.family: "Helvetica"
                  font.pointSize: 14
                  anchors.left: share_slika.right
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.leftMargin: 5
              }
              MouseArea
              {
                  anchors.fill: parent
                  onClicked:
                  {

                  }
              }
              }
          }






       }
}
}
Drawer
{
    id: draw
    //interactive: false
    width:parent.width
    dragMargin: 0
    height: parent.height/5*4
    edge: Qt.BottomEdge
    Rectangle
    {
        anchors.fill: parent
   Rectangle
   {
       id:koment
       width: parent.width
       height: parent.height-flickable.height
       ScrollView
       {
          //anchors.fill: parent
          anchors.top: parent.top
          height: parent.height
          //anchors.topMargin: 10
          width:  parent.width

          Rectangle{
              id:linija
              anchors.top: parent.top
            height: 5
            width: parent.width
            color:"#2596be"
          }

       ListView
       {
           boundsBehavior: ListView.StopAtBounds
           //anchors.fill: parent
           anchors.top: linija.bottom
           width: parent.width
           height: parent.height-15
           anchors.topMargin: 10
           clip: true
           model: _kommodel
           spacing: 10
           delegate:ItemDelegate
           {
               required property string slika
               required property string tekst
               required property string ime
               width:parent.width
               height: tex.implicitHeight+tex0.implicitHeight+20
                    Image
                    {
                           id: img11
                           source: slika
                           //anchors.verticalCenter: parent.verticalCenter
                           width: 30
                           height: 30
                           fillMode: Image.PreserveAspectCrop
                           layer.enabled: true
                           layer.effect: OpacityMask {
                               maskSource: mask
                           }
                    }
                    Rectangle {
                     anchors.leftMargin: 10
                      id: roundRect
                      radius: 10
                      color: "#ede7e6"

                      width: parent.width-50
                      height: tex.implicitHeight+tex0.implicitHeight+10
                      anchors.left: img11.right
                      Text {
                          font.bold:true
                          topPadding: 5
                          leftPadding: 10
                          id: tex0
                          text: qsTr(ime)
                      }
                    Text {
                         anchors.top: tex0.bottom
                         topPadding: 5
                         anchors.leftMargin: 30
                         leftPadding: 10
                         width: parent.width-20
                         id:tex
                         clip: true
                         wrapMode: Text.Wrap
                         text: qsTr(tekst)
                    }
                    }


           }
       }
   }
   }
   Rectangle
   {
       id: komentarunos
       anchors.top: koment.bottom
       width: parent.width
       height: parent.height/10
       //color: "red"

       ScrollView {
           id: flickable
           width: parent.width
           height: Math.max(40,Math.min(contentHeight, 60))
           contentWidth: width
           contentHeight: komentartext1.implicitHeight
           background: Rectangle {
               anchors.fill: parent
               border.color: "gray"
               radius: 5

           }
           TextArea {
                 id: komentartext1
                      leftPadding: 6
                      rightPadding: 30
                      topPadding: 0
                      bottomPadding: 0
                      background: null

                      wrapMode: Text.WordWrap

           }
       }

       Button{

           width: 30
           height: 30
           anchors.right:flickable.right
           anchors.verticalCenter: flickable.verticalCenter
           onClicked:
           {
               //if(komentartext1.text)
                  // var regExp = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                   //if(!regExp.test(email.text))
               block.visible =true;
               ucitajInstance.dodajKomentar(location.getId(),komentartext1.text);
               komentartext1.remove(0,komentartext1.length)
               block.visible = false;
           }
       background:Image {
           anchors.fill: parent
           id: send
           source: "/new/prefix1/pngkit_send-icon-png_1882365.png"


       }
       }

   }

   }
}

}

}
