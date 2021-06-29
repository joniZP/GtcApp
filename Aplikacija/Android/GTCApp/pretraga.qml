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
        height: parent.height/6
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
                                                block.visible=true
                                                if(lokacijaradio.checked)
                                                {
                                                    scrollpretraga.visible=true
                                                    scrollpretragadogadjaj.visible=false
                                                    pretrazi.pretrazi(unospretraga.text,0)
                                                }
                                                else
                                                {
                                                    scrollpretraga.visible=false
                                                    scrollpretragadogadjaj.visible=true
                                                     pretrazi.pretrazi(unospretraga.text,1)
                                                }

                                                kategorijapopup.visible=false
                                                mestopopup.visible=false

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
                                id:kategorija
                                height: parent.height
                                width: parent.width/2
                                anchors.left: parent.left
                                color: "#549cff"
                                border.color: "#333333"
                                radius: 3
                                Image {
                                    id: cityimage
                                    source: "/new/prefix1/kategorije.png"
                                    anchors.verticalCenter: kategorija.verticalCenter
                                    width:parent.height
                                    height:parent.height*0.8
                                    anchors.left: kategorija.left
                                    anchors.leftMargin: 10
                                }

                                Text{
                                anchors.left: cityimage.right
                                anchors.leftMargin: 10
                                anchors.verticalCenter: cityimage.verticalCenter
                                text: "Kategorija"
                                color: "white"
                                font.bold: true
                                }

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

                                    onPressed: {
                                      kategorija.color="#68a6fc"
                                    }
                                    onReleased: {
                                         kategorija.color = "#549cff";
                                    }

                                }
                            }
                            Rectangle
                            {
                                id:mesto
                                height: parent.height
                                width: parent.width/2
                                anchors.left: kategorija.right
                                color: "#549cff"
                                border.color: "#333333"
                                radius: 3


                Image {
                                    id: mestoimage
                                    source: "/new/prefix1/city.png"
                                    anchors.verticalCenter:  mesto.verticalCenter
                                    width:parent.height
                                    height:parent.height*0.8
                                    anchors.left: mesto.left
                                    anchors.leftMargin: 10
                                }

                                Text{
                                anchors.left: mestoimage.right
                                anchors.leftMargin: 10
                                anchors.verticalCenter: mestoimage.verticalCenter
                                text: "Mesto"
                                color: "white"
                                font.bold: true

                                }

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

                                    onPressed: {
                                      mesto.color="#68a6fc"
                                    }
                                    onReleased: {
                                         mesto.color = "#549cff";
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
            visible: false
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
                                id:lokacijaitemslika
                                source: slika
                                width: parent.width
                                height: parent.height


                                onProgressChanged:
                                {
                                    if(lokacijaitemslika.progress==1)
                                    {
                                       // slider.height=slikalokacija.paintedHeight
                                        spiner.visible=false
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
                                width: parent.width
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
                               // opislokacijeprofil.text=id
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

        ScrollView
        {
                visible: false
                id:scrollpretragadogadjaj
                width: parent.width
                height: parent.height

                ListView
                {
                     boundsBehavior: ListView.StopAtBounds
                     clip:true
                     anchors.fill: parent
                     width: parent.width
                     height: parent.height
                     model:_korisnikdogadjajmodel
                     delegate: ItemDelegate
                     {
                         height:60
                         width:scrollpretraga.width
                         required property string tip
                         required property string opis
                         required property string vreme
                         required property int id

                            Rectangle
                            {
                            width: parent.width
                            height: parent.height
                            anchors.verticalCenter: parent.verticalCenter
                            Rectangle
                            {
                                id:nazivdogadjaja
                                height: parent.height
                                width: parent.width/4
                                anchors.left: parent.left
                                Text
                                {
                                    id:nazivdogadjajaprofil
                                    text: qsTr(tip)
                                    anchors.left: parent.left
                                    anchors.leftMargin: 20
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                            Rectangle
                            {
                                id:opisdogadjaja
                                height: parent.height
                                width: parent.width*3/8
                                anchors.left:nazivdogadjaja.right
                                Text
                                {
                                    anchors.fill: parent
                                    id:opisdogadjajatekst
                                    text: qsTr(opis)
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    font.pixelSize: 20
                                    anchors.verticalCenter: parent.verticalCenter
                                    wrapMode: Text.WordWrap
                                    minimumPixelSize: 10
                                    maximumLineCount: 4
                                    fontSizeMode: Text.Fit
                                    verticalAlignment: Text.AlignVCenter

                                }
                            }

                            Rectangle
                            {
                                id:vremedogadjaja
                                height: parent.height
                                 width: parent.width*3/8
                                anchors.left: opisdogadjaja.right
                                Text
                                {
                                    id:vremedogadjajatekst
                                    text: qsTr(vreme)
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
                                    getDogadjajById(id)
                                    block.visible=false
                                    natpis="Dogadaj"
                                    pageLoader.source= "dogadjaj.qml"
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





////////////////////////////////////////////////////////////
        Rectangle
        {
            id:kategorijapopup
            width: parent.width/2
            anchors.left: parent.left
            anchors.top: parent.top
            border.color: "#c9c9c9"
            visible: false

            ////radio..

            Rectangle
            {
                id:radio
                anchors.top: parent.top
                width: parent.width
                height: 30
                ButtonGroup
                {
                    id: grupa
                }

                Rectangle{
                    id:prviradio
                    height: parent.height
                    width: parent.width/2
                    anchors.left: parent.left
                    RadioButton
                    {
                        id:lokacijaradio
                        checked: pretragaLD
                        ButtonGroup.group: grupa
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Lokacije")
                        scale: 0.75
                        anchors.left: parent.left
                        anchors.leftMargin: -10

                    }
                }
                Rectangle{
                    height: parent.height
                    width: parent.width/2
                    anchors.left: prviradio.right
                    RadioButton
                    {
                         checked: !pretragaLD
                         id:dogadjajradio
                         ButtonGroup.group: grupa
                         anchors.verticalCenter: parent.verticalCenter
                         text: qsTr("Dogadjaji")
                         scale: 0.75
                         anchors.left: parent.left
                         anchors.leftMargin: -10

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
            ////radio




           // kategorije
            ScrollView
            {
                width: parent.width
                anchors.top: radio.bottom
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
                                height: parent.height
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
            border.color: "#c9c9c9"
            visible: false
            ScrollView
            {
                width: parent.width
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
                         required property string mesto
                         required property int indeks
                         property int klik:0

                            Rectangle
                            {
                                width: parent.width
                                height: parent.height
                                anchors.verticalCenter: parent.verticalCenter

                                Rectangle
                                {
                                    id:mestorect
                                    height: parent.height
                                    width: parent.width
                                    Text
                                    {
                                        id:mestotext
                                        text: qsTr(mesto)
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
