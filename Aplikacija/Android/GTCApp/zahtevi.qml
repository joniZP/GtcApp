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
       text: qsTr("Zahtevi")
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
       id:scrolzahtevi
       anchors.top: linijica.bottom
       width: parent.width
       height: parent.height

       ListView
       {
            boundsBehavior: ListView.StopAtBounds
            clip:true
            anchors.fill: parent
            width: parent.width
            height: parent.height
            model:_zahtevimodel
            delegate: ItemDelegate
            {
                height:70
                width:scrolzahtevi.width
               required property int id
               required property string slika
               required property string ime
               required property int index
               required property bool prihvacen
               required property bool vidjen
               Rectangle
               {
                   color: vidjen==true?"transparent":"#b8dff2";
                   anchors.fill: parent
                   Rectangle
                   {
                   id:glavnirect
                   width: parent.width
                   height: parent.height-10
                   anchors.verticalCenter: parent.verticalCenter
                   color:"transparent"


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
                       }
                       Rectangle
                       {
                           id: mask
                           width: 50
                           height: 50
                           radius: 30
                           visible: false
                       }
                       MouseArea
                       {
                           anchors.fill: parent
                           onClicked:
                           {
                                block.visible = true
                               getProfilByUsername(id)
                               natpis="Profil"
                               pageLoader.source = "profil.qml"
                               block.visible = false
                           }
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
                           text: qsTr(ime)
                           anchors.left: parent.left
                           anchors.leftMargin: 20
                           anchors.top: parent.top
                           anchors.topMargin: 2
                           width: parent.width
                           wrapMode: Text.WordWrap
                       }

                       Button
                       {
                           id:prihvatidugme
                           width: 80
                           height: 35
                           anchors.right: parent.right
                           anchors.rightMargin: 10
                           anchors.bottom: parent.bottom
                           anchors.bottomMargin: 5
                           Text
                           {
                                text: qsTr("Izbrisi")
                                anchors.centerIn: parent
                           }
                           onClicked:
                           {
                               _zahtevimodel.obrisi(index)
                           }
                       }
                       Button
                       {

                           width: 80
                           height: 35
                           anchors.right: prihvatidugme.left
                           anchors.rightMargin: 10
                           anchors.bottom: parent.bottom
                           anchors.bottomMargin: 5
                           Text
                           {
                               text: qsTr("Potvrdi")
                               anchors.centerIn: parent
                           }
                           onClicked:
                           {
                                _zahtevimodel.prihvati(index)
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
}
