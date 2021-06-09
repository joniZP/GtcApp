import QtQuick 2.0
import QtQuick.Controls 2.5
import Qt.labs.settings 1.1
Item {

    ScrollView
    {
        width: parent.width
        height: parent.height
        property var kategorije:[]
        ListView
        {
             boundsBehavior: ListView.StopAtBounds
             clip:true
             anchors.fill: parent
             width: parent.width
             height: parent.height
             model:_katmodel
             delegate: ItemDelegate
             {
                 height:40
                 width:parent.width
                 required property string kategorija
                 required property int indeks
                 property int klik:0

                    Rectangle
                    {
                        width: parent.width
                        height: parent.height-10
                        anchors.verticalCenter: parent.verticalCenter
                       /* Rectangle ako odlucimo da dodamo ikonice
                        {
                            id:slikarect
                            height: parent.height
                            width: parent.height
                            //color: "red"
                            anchors.left: parent.left
                            Image
                            {
                                id:lokacijaprofilimage
                                source: slika
                                width: parent.width
                                height: parent.height
                            }
                        }*/
                        Rectangle
                        {
                            id:kategorijarect
                            height: parent.height
                            width: parent.width
                            Text
                            {
                                id:kategorijatext
                                text: qsTr(kategorija)
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        MouseArea
                        {
                            anchors.fill:parent
                            onClicked:
                            {
                                   _katmodel.dodaj(indeks)

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
