
import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle
{
    id: prikaz4
    anchors.fill: parent
    color: "#2ab1de"
    Rectangle
    {
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        ScrollView
        {
            id:scrollpretraga
            width: parent.width
            height: parent.height

            ListView
            {
                 boundsBehavior: ListView.StopAtBounds
                 clip:true
                 anchors.fill: parent
                 width: parent.width
                 height: parent.height
                 model:_model
                 delegate: ItemDelegate
                 {
                     height:100
                     width:scrollpretraga.width
                    required property int id
                    required property string slika
                    required property string naziv
                    required property string grad
                        Rectangle
                        {
                        width: parent.width
                        height: parent.height-10
                        anchors.verticalCenter: parent.verticalCenter
                        Rectangle
                        {
                              //border.color:"#595959"
                            id:slikarect
                            height: parent.height
                            width: parent.height
                            clip: true
                            //color: "red"
                            anchors.left: parent.left
                            Image
                            {
                                id:lokacijaitemslika
                                source: slika
                                width: parent.width
                                height: parent.height
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit

                                onStatusChanged:
                                {
                                    if(lokacijaitemslika.status==Image.Ready)
                                    {
                                        spiner.visible=false
                                       var a=lokacijaitemslika.paintedHeight/lokacijaitemslika.paintedWidth
                                       if(lokacijaitemslika.paintedWidth<slikarect.width)
                                       {
                                           var b=lokacijaitemslika.width-lokacijaitemslika.paintedWidth
                                           lokacijaitemslika.height=lokacijaitemslika.height+b*a
                                       }
                                       else if(lokacijaitemslika.paintedHeight<slikarect.height)
                                       {
                                           var d=lokacijaitemslika.height-lokacijaitemslika.paintedHeight
                                           lokacijaitemslika.width=lokacijaitemslika.width+d/a
                                       }
                                    }
                                }

                                AnimatedImage
                                {
                                    id:spiner
                                    source: "/new/prefix1/spinnerpicture.gif"
                                    width: 100
                                    height: 100
                                    anchors.centerIn: parent
                                   // visible: slikalokacija.progress!=1
                                }
                            }
                        }
                        Rectangle
                        {
                            id:nazivrect
                            height: parent.height
                            width: 170
                            anchors.left: slikarect.right
                            Text
                            {
                                id:nazivlokacijeprofil
                                text: qsTr(naziv)
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                width: parent.width-20
                                wrapMode: Text.WordWrap
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        Rectangle
                        {
                            id:gradrect
                            height: parent.height
                            width:parent.width-parent.height-200
                            anchors.left: nazivrect.right
                            Text
                            {
                                id:opislokacijeprofil
                                text: qsTr(grad)
                                anchors.left: parent.left
                                anchors.leftMargin: 15
                                anchors.verticalCenter: parent.verticalCenter
                                wrapMode: Text.WordWrap
                                width: parent.width
                            }
                        }
                        MouseArea
                        {
                            anchors.fill:parent
                            onClicked:
                            {
                                block.visible=true
                                getLokacijaById(id)
                                block.visible=false
                                natpis="Lokacija"
                                pageLoader.source= "lokacija.qml"


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

///////////////////////////////////////////////

}

}
