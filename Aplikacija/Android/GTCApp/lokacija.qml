import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import QtLocation 5.6
import QtPositioning 5.6
import QtGraphicalEffects 1.12
//import QtWebView 1.1
import MLokacija 1.0

Rectangle
{
    id:par
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
            onStatusChanged:
            {
                if(slikalokacija.status==Image.Ready)
                {
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
    height:lokacija_opis_kontejner.height+380




    Rectangle
    {
        id:rectneki
      width:parent.width
      anchors.top: parent.top
      anchors.topMargin: 10
    Rectangle
    {
        id: lokacija_opis_kontejner
        width: parent.width-20
        height: naziv_lokacije.height+opis_lokacije.height+gradlokacija.height+kategorijalokacije.height+25
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        Text {
            id: naziv_lokacije
            text: qsTr(location.getNaziv())
            font.family: "Helvetica"
            font.pointSize: 18
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            wrapMode: Text.WordWrap
        }
        Text {
            id: gradlokacija
            text: qsTr(location.getGrad())
            font.family: "Helvetica"
            font.pointSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: naziv_lokacije.bottom
            anchors.topMargin: 2
        }

        Text {
            id: opis_lokacije
            anchors.top: gradlokacija.bottom
            anchors.topMargin: 10
            text: qsTr(location.getOpis())
            font.family: "Helvetica"
            font.pointSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width-50
            wrapMode: Text.WordWrap
        }

        Text {
            id: kategorijalokacije
            text: qsTr(location.getKategorija())
            font.family: "Helvetica"
            font.pointSize: 14
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
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


                           if(mProfilInst.getKorisnickoIme()===location.getKreator())
                           {
                               ucitavanjeProfilaInstance.ucitajLokacijeiDogadjaje(mProfilInst.getKorisnickoIme())
                               natpis="Moj profil"
                               pageLoader.source = "mojprofil.qml"
                           }
                           else
                           {
                               getProfilByUsername(location.getKreator())
                               natpis="Profil"
                               pageLoader.source = "profil.qml"

                           }
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
           id: likecomsharecontainer
           width: parent.width-20
           height: 80
           anchors.top: lokacija_kreator.bottom
           anchors.topMargin: 5
           anchors.horizontalCenter: parent.horizontalCenter
           color: "white"
           Rectangle
           {
              id: brojLK
              anchors.top: parent.top
              width: parent.width
              height: 30

              Image
              {
                  id: brlikeimage
                  width: 25
                  height: 25
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.left: parent.left
                  anchors.leftMargin: 10
                  source: "qrc:/new/prefix1/heart.png"
              }
              Text
              {
                  id: brlike
                  anchors.left: brlikeimage.right
                  anchors.leftMargin: 5
                  anchors.verticalCenter: parent.verticalCenter
                  text: qsTr(location.getBrLajkaString(0))
              }
              Text
              {
                  id: brkomentaratext
                  anchors.right: parent.right
                  anchors.rightMargin: 10
                  anchors.verticalCenter: parent.verticalCenter
                  text: qsTr(location.getBrKomentaraString(0))
              }
              MouseArea
              {
                  anchors.fill: parent
                  onClicked:
                  {
                      if(!localData.getUlogovan())
                      {
                         komentarunos.visible=false
                      }
                      else
                      {
                           komentarunos.visible=true
                      }
                      block.visible=true;
                      ucitajInstance.ucitajKomentare(location.getId())
                      komentaridrawer.open()
                      block.visible = false;
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

           Rectangle
           {
               width: parent.width
               height: 50
               anchors.top: brojLK.bottom
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
                      source: likelogic.vratiIkonicu()
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
                  id:likelokacijaklik
                  anchors.fill: parent
                  onClicked:
                  {
                    if(localData.getUlogovan())
                    {
                        likelogic.clickOnLike();
                        var ikonica=likelogic.vratiIkonicu();
                        like_slika.source = ikonica;
                        if(ikonica==="qrc:/new/prefix1/heart.png")
                        {
                            brlike.text=qsTr(location.getBrLajkaString(1))
                        }
                        else
                        {
                            brlike.text=qsTr(location.getBrLajkaString(-1))
                        }

                    }
                    else
                    {
                          ulogujsepopup.open()
                    }

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
                      source: "../new/prefix1/comment1.png"
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
                      if(!localData.getUlogovan())
                      {
                         komentarunos.visible=false
                         koment.height=koment.height+40
                      }
                      else
                      {
                           komentarunos.visible=true
                      }
                      block.visible=true;
                      ucitajInstance.ucitajKomentare(location.getId())
                      komentaridrawer.open()
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
                  id:podelilokacijaklik
                  anchors.fill: parent
                  onClicked:
                  {
                      if(localData.getUlogovan())
                      {
                          block.visible=true
                          prijateljiEvents.prikaziListuPrijatelja()
                          deljenje_lokacije.visible=true
                          block.visible=false
                      }
                      else
                      {
                          ulogujsepopup.open()
                      }
                  }
              }
              }
          }
           }

       }




}
}
Drawer
{
    id: komentaridrawer
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
               required property string id
               required property string kreatorid
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
                           Timer
                           {
                              id:delaykomentar
                              repeat: false
                              interval: 200
                              onTriggered:
                              {
                                  if(mProfilInst.getKorisnickoIme()===kreatorid)
                                  {
                                      ucitavanjeProfilaInstance.ucitajLokacijeiDogadjaje(mProfilInst.getKorisnickoIme())
                                      natpis="Moj profil"
                                      pageLoader.source = "mojprofil.qml"
                                  }
                                  else
                                  {
                                      getProfilByUsername(kreatorid)
                                      natpis="Profil"
                                      pageLoader.source = "profil.qml"

                                  }
                                  block.visible = false;
                              }
                          }

                           MouseArea
                           {
                               anchors.fill: parent
                               onClicked:
                               {
                                   komentaridrawer.close()
                                   block.visible = true;
                                   delaykomentar.start()

                               }
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
                          anchors.right: parent.right
                          anchors.rightMargin: 10
                          anchors.top: parent.top
                          anchors.topMargin: -5
                          id: prijavi
                          font.pixelSize: 25
                          text: qsTr("...")

                          MouseArea
                          {
                              anchors.fill: parent
                              onClicked:
                              {
                                  menu.open()
                              }
                          }
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


                    Menu
                    {
                        width: 100
                       // height: item1.height
                        id: menu
                        x:prijavi.x-menu.width+prijavi.width
                        y:prijavi.y+prijavi.height
                        MenuItem
                        {
                            id:item1
                            anchors.centerIn: parent
                            text: qsTr("Prijavi")

                            onClicked:
                            {
                                if(localData.getUlogovan())
                                {
                                    lokacijaprijavapopup.open();
                                    report.setParameters(id,2);
                                }
                                else
                                {
                                   ulogujsepopup.open()
                                }
                            }
                        }

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
               blockcomment.visible =true;
               ucitajInstance.dodajKomentar(location.getId(),komentartext1.text);
               komentartext1.remove(0,komentartext1.length)
                brkomentaratext.text=qsTr(location.getBrKomentaraString(1))
               blockcomment.visible = false;
           }
       background:Image {
           anchors.fill: parent
           id: send
           source: "/new/prefix1/pngkit_send-icon-png_1882365.png"


       }
       }

   }

   }


    Rectangle
    {
        id:blockcomment
        anchors.fill: parent
        visible: false
        color: "transparent"
        z:999


        Rectangle{
        id: blockcolor
        anchors.fill: blockcomment
        color: "white"
        opacity: 0.4
        }

        AnimatedImage
        {
            source: "/new/prefix1/spinnerpage.gif"
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

}






///////deljenje lokacije
Rectangle
{
    id:deljenje_lokacije
    visible: false
    anchors.fill:parent
    MouseArea
    {
        anchors.fill: parent
    }

    color: "transparent"
    Rectangle
    {
        id:rectanglelistaprijatelja
        width: parent.width*0.8
        height: parent.height*0.8
        anchors.centerIn: parent
        ScrollView{
            id:scrollprijatelji
         width: parent.width
         height: parent.height-dugmevratise.height-20

    ListView {
        boundsBehavior: ListView.StopAtBounds
        clip:true
        anchors.fill: parent
        model:_prijateljimodel
        delegate: ItemDelegate {
            height:70
            width:scrollprijatelji.width
           required property string korisnickoime
           required property string slika
           required property string ime
           required property string index

           Rectangle
           {
               anchors.fill: parent
               Rectangle
               {
               id:glavnirect
               width: parent.width
               height: parent.height-10
               anchors.verticalCenter: parent.verticalCenter
               color: "transparent"

               Rectangle
               {

                   //border.color:"#595959"
                   color: "transparent"
                   id:slikaprofil
                   height: parent.height
                   width: parent.height
                   anchors.left: parent.left
                   Image
                   {
                      id:zahtevimage
                      visible: true
                      source: slika
                       width: parent.width
                       height: parent.height
                       fillMode: Image.PreserveAspectCrop
                       layer.enabled: true
                       layer.effect: OpacityMask
                       {
                           maskSource: mask
                       }

                   }

               }

               Rectangle
               {
                   id:nazivprofil
                   height: parent.height
                   width: parent.width-parent.height
                   anchors.left: slikaprofil.right
                   color: "transparent"
                   Text
                   {
                       text: qsTr(ime)
                       anchors.left: parent.left
                       anchors.leftMargin: 20
                       anchors.top: parent.top
                       anchors.topMargin: 2
                       width: parent.width
                       wrapMode: Text.WordWrap
                   }

                   Image {

                       source: "/new/prefix1/send.png"
                       id:posalji
                       visible: true
                       width: parent.height*0.4
                       height:parent.height*0.4
                       anchors.right: parent.right
                       anchors.rightMargin: 10
                       anchors.verticalCenter: parent.verticalCenter
                       MouseArea
                       {
                           anchors.fill: parent
                           onClicked:
                           {

                               notification.podeliLokaciju(location.getId(),korisnickoime)
                               posalji.visible=false
                               console.log(index)
                           }
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
        Button{
            id: dugmevratise
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 20
            height: parent.height/10
            width: parent.width/4
            //anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Nazad")
            onClicked:
            {
                deljenje_lokacije.visible=false
            }
        }
    }
}
//////deljenjne lokacije
}
