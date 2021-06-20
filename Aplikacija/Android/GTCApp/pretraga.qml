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
                        MouseArea
                        {
                            anchors.fill: parent
                            //pretrazi.Pretrazi(unospretraga.text)
                            onClicked:
                            {
                                kategorijapopup.visible=false
                                mestopopup.visible=false
                                block.visible=true
                                pretrazi.pretrazi(unospretraga.text)
                                block.visible=false
                            }
                        }
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
                       if(kategorijapopup.visible==true)
                       {
                           kategorijapopup.visible=false
                       }
                       else
                       {
                           kategorijapopup.visible=true
                       }
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
                        if(mestopopup.visible==true)
                        {
                            mestopopup.visible=false
                        }
                        else
                        {
                            mestopopup.visible=true
                        }
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
                                wrapMode: Text.WordWrap
                                width: parent.width
                            }
                        }
                        MouseArea
                        {
                            anchors.fill:parent
                            onClicked:
                            {
                                opislokacijeprofil.text=id
                                block.visible=true
                                getLokacijaById(id)
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


        Rectangle
        {
            id:kategorijapopup
            width: parent.width/2
            anchors.left: parent.left
            anchors.top: parent.top
            height: parent.height
            border.color: "#c9c9c9"
            visible: false
           // kategorije
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
                                    Rectangle
                                    {
                                        id:check
                                        visible: false
                                        width: parent.height
                                        height: parent.height
                                        anchors.right: parent.right
                                        Image
                                        {
                                            width: parent.height-2
                                            height: parent.height-2
                                            anchors.centerIn: parent
                                            source: "qrc:/new/prefix1/check.png"
                                        }
                                    }
                                }


                                MouseArea
                                {
                                    anchors.fill:parent
                                    onClicked:
                                    {
                                           _katmodel.dodaj(indeks)
                                        if(check.visible==true)
                                        {
                                            check.visible=false
                                        }
                                        else
                                        {
                                            check.visible=true
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
             // kategorije

        }

        //mesto
        Rectangle
        {
            id:mestopopup
            width: parent.width/2
            anchors.right: parent.right
            anchors.top: parent.top
            height: parent.height
            border.color: "#c9c9c9"
            visible: false
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
                     model:_mestomodel
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

                                Rectangle
                                {
                                    id:mestorect
                                    height: parent.height
                                    width: parent.width
                                    Text
                                    {
                                        id:mestotext
                                        text: qsTr(kategorija)
                                        anchors.left: parent.left
                                        anchors.leftMargin: 20
                                        anchors.verticalCenter: parent.verticalCenter
                                    }
                                    Rectangle
                                    {
                                        id:checkmesto
                                        visible: false
                                        width: parent.height
                                        height: parent.height
                                        anchors.right: parent.right
                                        Image
                                        {
                                            width: parent.height-2
                                            height: parent.height-2
                                            anchors.centerIn: parent
                                            source: "qrc:/new/prefix1/check.png"
                                        }
                                    }
                                }


                                MouseArea
                                {
                                    anchors.fill:parent
                                    onClicked:
                                    {
                                           _mestomodel.dodaj(indeks)
                                        if(checkmesto.visible==true)
                                        {
                                            checkmesto.visible=false
                                        }
                                        else
                                        {
                                            checkmesto.visible=true
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
        //mesto
    }
}
