import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
Rectangle
{
   anchors.fill: parent
   Text
   {
       id: obavestenjatekst
       text: qsTr("Obavestenja")
       font.family: "Helvetica"
       font.pointSize: 30
       anchors.horizontalCenter: parent.horizontalCenter
   }
   Rectangle
   {
       id:linijica
       width: parent.width
       height: 1
       color: "#c9c9c9"
       anchors.top: obavestenjatekst.bottom
       anchors.topMargin:10
   }


   ScrollView
   {
       id:scrolobavestenja
       anchors.top: linijica.bottom
       width: parent.width
       height: parent.height-obavestenjatekst.implicitHeight-5

       ListView
       {
            boundsBehavior: ListView.StopAtBounds
            clip:true
            anchors.fill: parent
            width: parent.width
            height: parent.height
            model:_obavestenjamodel
            delegate: ItemDelegate
            {
                height:60
                width:scrolobavestenja.width
               required property int idLD
               required property string slika
               required property string tekst
               required property int index
               required property bool vidjen
               required property bool lid
               required property string sender
                required property int idO
               Rectangle
               {
                   id:rectobavestenje
                   anchors.fill: parent
                   color: vidjen==true?"white":"#b8dff2";
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
                       id:slikarect
                       height: parent.height
                       width: parent.height
                       anchors.left: parent.left
                       Image
                       {
                           id:lokacijaprofilimage
                           source: slika
                           width: parent.width
                           height: parent.height
                           fillMode: Image.PreserveAspectCrop
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
                                   getProfilByUsername(sender)
                                   natpis="Profil"
                                   pageLoader.source = "profil.qml"
                                   block.visible = false;
                               }
                           }
                       }
                       Rectangle {
                           id: mask
                           width: 50
                           height: 50
                           radius: 30
                           visible: false
                       }
                   }

                   Rectangle
                   {
                       id:nazivrect
                       height: parent.height
                       width: parent.width-parent.height
                       anchors.left: slikarect.right
                       color: "transparent"
                       Text
                       {
                           id:nazivlokacijeprofil
                           text: qsTr(tekst)
                           anchors.left: parent.left
                           anchors.leftMargin: 20
                           anchors.verticalCenter: parent.verticalCenter
                           width: parent.width
                           wrapMode: Text.WordWrap
                       }

                       MouseArea
                       {

                           width: parent.width-10
                           height: parent.height
                           anchors.left: parent.left
                           onClicked:
                           {
                               block.visible=true
                               _obavestenjamodel.pregledaj(index)
                               rectobavestenje.color="white"

                               if(lid==false)
                               {
                                   getLokacijaById(idLD)
                                   natpis="Lokacija"
                                   pageLoader.source= "lokacija.qml"
                               }
                               else
                               {
                                   getDogadjajById(idLD)
                                   natpis="Dogadjaj"
                                   pageLoader.source= "dogadjaj.qml"
                               }
                               notification.setVidjeni(idO)
                               rectobavestenje.color ="white";
                                  block.visible=false

                           }

                       }
                   }


                   Image {
                       id: obrisiobavestenje
                       source: "qrc:/new/prefix1/close-removebg-preview.png"
                       height:15
                       width: 15
                       anchors.right: parent.right
                       anchors.top: parent.top
                       anchors.rightMargin: 2
                       MouseArea
                       {
                           z: 100
                           anchors.fill: parent
                           onClicked:
                           {
                               block.visible=true
                               _obavestenjamodel.obrisi(index)
                               block.visible=false

                           }
                       }
                   }

                   ///////



            }
              /* Rectangle
               {
                   width: parent.width
                   height: 1
                   color: "#c9c9c9"
                   anchors.bottom: parent.bottom
               }
               */
        }
       }
    }
}
}
