import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.0

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
                   //source: slika
                  source: slika
                   width: parent.width
                   height: parent.height
                   fillMode: Image.PreserveAspectCrop
                   layer.enabled: true
                   layer.effect: OpacityMask
                   {
                       maskSource: mask
                   }
                   Rectangle {
                       id: mask
                       width: (parent.height)*0.8
                       height:(parent.height)*0.8
                       radius: parent.height*0.4
                       visible: false
                   }

               }
               MouseArea
               {
                   anchors.fill: parent
                   onClicked:
                   {
                       block.visible = true;
                       getProfilByUsername(korisnickoime)
                       pageLoader.source = "profil.qml"
                       natpis="Profil"
                       block.visible = false;
                       //pozovi funkciju da ucita korisnika
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

                   source: "/new/prefix1/star.png"
                   id:prihvatidugme
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
                          // _prijateljimodel.obrisi(index)
                          // prijateljiEvents.izbrisiPrijatelja(korisnickoime)
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
          rectanglelistaprijatelja.visible=false
        }
    }
}
