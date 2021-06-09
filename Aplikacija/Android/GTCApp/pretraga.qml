import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.0

Rectangle
{
    anchors.fill: parent
    Rectangle
    {
        id:prvii
        width: parent.width
        height: parent.height/8
        anchors.top: parent.top
        Rectangle
        {
            id:pretragaUnosRectangle
            anchors.top: parent.top
            width: parent.width
            height: parent.height/2
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
                    maximumLength: 80


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
                        source: "qrc:/new/prefix1/loupe.png"
                        width: parent.height*0.8
                        height: parent.height*0.8
                        anchors.centerIn: parent
                    }
                }
            }

        }
        Rectangle
        {
            id:pretragaFilterRectangle
            width: parent.width
            height: parent.height/2
            anchors.top: pretragaUnosRectangle.bottom
            Rectangle
            {
                id:mesto
                height: parent.height
                width: parent.width/2
                anchors.left: parent.left
                color: "red"
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {

                    }
                }
            }
            Rectangle
            {
                id:kategorija
                height: parent.height
                width: parent.width/2
                anchors.left: mesto.right
                color: "blue"
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
    Rectangle
    {

        width: parent.width
        height: parent.height*7/8
        anchors.top: prvii.bottom
        ScrollView
        {
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
                     width:parent.width
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
                            //color: "red"
                            anchors.left: parent.left
                            Image
                            {
                                id:lokacijaprofilimage
                                source: slika
                                width: parent.width
                                height: parent.height
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
                            }
                        }
                        MouseArea
                        {
                            anchors.fill:parent
                            onClicked:
                            {
                                opislokacijeprofil.text=id
                                block.visible=true
                                funkcija(id)
                                block.visible=false
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
    }
}
