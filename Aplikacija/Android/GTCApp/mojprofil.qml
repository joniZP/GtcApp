import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.0

Rectangle{
    property int pom: 0
    gradient: Gradient{
    GradientStop{position:0.0; color:"#2A9FF3"}
     GradientStop{position:1.0; color:"white"}
    }
    id: glavni
    anchors.fill:parent
    color:parent.color
    ColumnLayout{
          // @disable-check M16
        anchors.fill:parent
        spacing:0
        Rectangle{//dodajprijatelja
            //Layout.alignment: Qt.AlignTop
            height:parent.height*0.1
            width:parent.width
            color:"transparent"



            Image{
                id:izmeniinformacije
                height:(parent.height)/100*80
                width:(parent.height)/100*80
                source: "qrc:/new/prefix1/change.png"
                //dodaj sliku posaljizahtev

                anchors.left: parent.left
                anchors.leftMargin: (parent.height)/100*10
                anchors.top: parent.top
                anchors.topMargin:(parent.height)/100*10
                anchors.bottom: parent.bottom
                anchors.bottomMargin:(parent.height)/100*10

                MouseArea{
                    anchors.fill: parent
                    id:mouseareaizmeniinformacije

                    onClicked: {

                        pageLoader.source="izmeniprofil.qml"

                      }
            }

            }

                    Image{
                        id:listaprijateljaimage
                        height:(parent.height)/100*80
                        width:(parent.height)/100*80
                        source: "qrc:/new/prefix1/friendlist.png"
                        //dodaj sliku posaljizahtev

                        anchors.right: parent.right
                        anchors.rightMargin: (parent.height)/100*10
                        anchors.top: parent.top
                        anchors.topMargin:(parent.height)/100*10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin:(parent.height)/100*10

                        MouseArea{
                            anchors.fill: parent
                            id:listaprijateljaarea

                            onClicked: {
                                rectanglelistaprijatelja.visible=true

                              }
                    }

                    }

                }
           Rectangle{//profilnaslika

                    id: profilnarectangle
                    color:"transparent"
                    height:parent.height*0.2
                    width:parent.width


                        //visible: false
                    Image {
                            id: profilnaimage
                            source: "../new/prefix1/slika.jfif"
                            width: (parent.height)/100*80
                            height:(parent.height)/100*80
                            fillMode: Image.PreserveAspectCrop
                            anchors.centerIn: parent
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                maskSource: mask
                            }
                            MouseArea{
                                id:mouseareaprofilna
                                anchors.fill:parent
                                hoverEnabled: true
                                onPressed:
                                {

                                    profilnaimage.width=glavni.width
                                    profilnaimage.height=glavni.height/100*40
                                    profilnaimage.layer.enabled=false
                                    imeiprezimeprofil.visible=false
                                    izmeniprofilnu.visible=false

                                }
                                onClicked: {

                                    profilnaimage.width=(profilnarectangle.height)/100*80
                                    profilnaimage.height=(profilnarectangle.height)/100*80
                                    profilnaimage.layer.enabled=true
                                    imeiprezimeprofil.visible=true
                                    izmeniprofilnu.visible=true


                                }
                            }
                            Image
                            {
                                id: izmeniprofilnu

                                width: (parent.height)/100*60
                                height:(parent.height)/100*60
                                anchors.bottom: parent.bottom
                                anchors.right: parent.right
                                source: "qrc:/new/prefix1/change.png"
                                MouseArea
                                {
                                    id:mouseizmeniprofilnu
                                    hoverEnabled: true
                                    anchors.fill:parent
                                    onClicked:
                                    {
                                        fileDialog.open();
                                    }
                                    onExited:
                                    {
                                        opacity: 1
                                    }
                                    onEntered:
                                    {
                                        opacity: 0.1
                                    }
                                    FileDialog {
                                        id: fileDialog
                                        title: "Please choose a file"
                                        folder: shortcuts.home
                                        onAccepted:
                                        {
                                            profilnaimage.source=fileDialog.fileUrl
                                            events.izmenislikuprofila(fileDialog.fileUrl);
                                        }
                                        onRejected:
                                        {
                                            console.log("Canceled")
                                        }
                                    }
                                }
                            }


                        }

                        Rectangle {
                            id: mask
                            width: (parent.height)/100*80
                            height:(parent.height)/100*80
                            radius: ((parent.height)/100*80)/2
                            visible: false
                        }

                }


        Rectangle{//ime i prezime
                    color:"transparent"
                    height:parent.height*0.1
                    width:parent.width

                    Text {
                        id: imeiprezimeprofil
                        text: qsTr("Ime Prezime\n")
                        //anchors.centerIn: parent
                        //anchors.top: parent
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 20
                    }

         }

        Rectangle{//ocena
            color:"transparent"
            height:parent.height*0.1
            width:parent.width
            RowLayout{
                  // @disable-check M16
                anchors.fill: parent
                spacing:0
                Rectangle{//text gde treba da se doda ocena
                    color:"transparent"
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width
                    Text{
                        anchors.centerIn: parent
                        id: ocenaprofila
                        text: "Ocena: "+ocenaprofilavrednost.text
                        font.pointSize: 10
                        color:"green"
                        font.bold: false
                        font.italic: true
                    }

                }
                    Text{
                        visible: false
                        id: ocenaprofilavrednost
                        text: "5"

                    }
            }
        }
        Rectangle{//resto
            gradient: Gradient{
            GradientStop{position:0.0; color:"#131E99"}
             GradientStop{position:1.0; color:"#7E85CE"}
            }

            height:parent.height*0.1
            width:parent.width
            color:"transparent"
            RowLayout{
                //Layout.alignment: Qt.AlignHCenter
                  // @disable-check M16
                anchors.fill: parent
                spacing:0
                Rectangle{
                    //color:"transparent"
                    id:prvi

                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width*0.33
                    color: mouseareakreiranelokacije.pressed ? "#131E99":"#131E99"
                    Text{
                        text:"Kreirane\nlokacije"
                        anchors.centerIn: parent
                        font.pixelSize: 14
                        color:"white"
                        font.italic: true


                    }
                    MouseArea{
                        id: mouseareakreiranelokacije
                        hoverEnabled: true
                        anchors.fill: parent
                        onClicked: {
                            profildolerectangle2.visible=false
                            profildolerectangle3.visible=false
                            profildolerectangle1.visible=true
                            prvi.color="#131E99"
                            treci.color="#3D4BD8"
                            drugi.color="#3D4BD8"

                        }
                    }
                    border.color: "#1E2BAF"
                    //border.width: 0.5




                }
                Rectangle{
                    id:drugi
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width*0.33
                    color: mouseareakreiranidogadjaji.pressed ? "#131E99":"#3D4BD8"
                    Text{
                        text:"Kreirani\ndogađaji"
                        anchors.centerIn: parent
                        font.pixelSize: 14
                        color:"white"
                        font.italic: true



                    }
                    MouseArea{
                        id: mouseareakreiranidogadjaji
                        hoverEnabled: true
                        anchors.fill: parent
                        onClicked: {
                            profildolerectangle2.visible=true
                            profildolerectangle3.visible=false
                            profildolerectangle1.visible=false
                            prvi.color="#3D4BD8"
                            treci.color="#3D4BD8"
                            drugi.color="#131E99"
                        }
                    }
                    border.color: "#1E2BAF"
                   // border.width: 0.5


                }
                Rectangle{
                    id:treci
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width*0.33
                    color: mouseareakontakt.pressed ? "#131E99":"#3D4BD8"
                    Text{
                        text:"Kontakt"
                        anchors.centerIn: parent
                        font.pixelSize: 14
                        color:"white"
                        font.italic: true


                    }
                    MouseArea{
                        id: mouseareakontakt
                        hoverEnabled: true
                        anchors.fill: parent
                        onClicked: {
                            profildolerectangle2.visible=false
                            profildolerectangle3.visible=true
                            profildolerectangle1.visible=false
                            prvi.color="#3D4BD8"
                            treci.color="#131E99"
                            drugi.color="#3D4BD8"
                        }
                    }
                    border.color: "#1E2BAF"
                    //border.width: 0.5


                }
            }
        }
        Rectangle{//resto1
            id:profildolerectangle1
            height:parent.height*0.4
            width:parent.width
            color:"transparent"

            ScrollView{
             width: parent.width
             height: parent.height

        ListView {
             boundsBehavior: ListView.StopAtBounds
             clip:true
           anchors.fill: parent
           width: parent.width
           height: parent.height
            model:_model
            delegate: ItemDelegate {
                width: profildolerectangle1.width
                height: profildolerectangle1.height*0.25
                required property string id
                required property string slika
                required property string tekst
                required property string boja

               RowLayout
                {
                      // @disable-check M16
                    anchors.fill:parent
                    Image {
                        id:lokacijaprofilimage
                        source: "../new/prefix1/slika.jfif"
                        Layout.preferredWidth: parent.height
                        Layout.preferredHeight: parent.height
                    }
                    Text {
                        id:nazivlokacijeprofil
                        text: qsTr("Naziv")
                    }

                    Text {
                        id:opislokacijeprofil
                        text: qsTr("Opis")
                    }
                    Text {
                        id:opislokacijaid
                        text: qsTr("id")
                    }
                    MouseArea{
                        id:mouseareaprofillokacija
                     anchors.fill:parent
                     onPressed: {
                         lokacijaprofilimage.opacity=0.5
                     }
                     onExited: {
                         lokacijaprofilimage.opacity=1
                     }
                     onEntered: {
                         lokacijaprofilimage.opacity=0.5
                     }
                     onClicked: {
                  //   pageLoader.source= "LoginForm.qml"
                     }
                    }
                }

               }
        }
        }
        }
        Rectangle{//resto2
            id:profildolerectangle2
            height:parent.height*0.4
            width:parent.width
            color:"transparent"

            ScrollView{
             width: parent.width
             height: parent.height

        ListView {
             boundsBehavior: ListView.StopAtBounds
             clip:true
           anchors.fill: parent
           width: parent.width
           height: parent.height
            model:_model
            delegate: ItemDelegate {
                width: profildolerectangle1.width
                height: profildolerectangle1.height*0.25
                required property string slika
                required property string tekst
                required property string boja

               RowLayout
                {
                      // @disable-check M16
                    anchors.fill:parent
                    Image {
                        id:dogadjajprofilimage
                        source: "../new/prefix1/slika.jfif"
                        Layout.preferredWidth: parent.height
                        Layout.preferredHeight: parent.height
                    }
                    Text {
                        id:nazivdogadjajaprofil
                        text: qsTr("Naziv")
                    }

                    Text {
                        id:opisdogadjajaprofil
                        text: qsTr("Opis dogadjaja iz baze procitan")
                    }
                    MouseArea{
                        id:mouseareaprofildogadjaj
                     anchors.fill:parent
                     onPressed: {
                         dogadjajprofilimage.opacity=0.5
                     }
                     onExited: {
                         dogadjajprofilimage.opacity=1
                     }
                     onEntered: {
                         dogadjajprofilimage.opacity=0.5
                     }
                     onClicked: {
                     pageLoader.source= "LoginForm.qml"
                     }
                    }
                }

               }
        }
        }
        }
        Rectangle{//resto3
            id:profildolerectangle3
            height:parent.height*0.4
            width:parent.width
            color:"transparent"
            ColumnLayout{
                  // @disable-check M16
                anchors.fill:parent
                spacing:0
                Rectangle{
                    color:"transparent"
                    Layout.preferredHeight: parent.height/2
                    Layout.preferredWidth: parent.width
                    RowLayout{
                          // @disable-check M16
                        anchors.fill:parent
                        spacing:0
                        Image {
                            fillMode: Image.PreserveAspectCrop
                            Layout.preferredHeight: parent.height/2
                            Layout.preferredWidth: parent.height/2
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            id: emailprofilslika
                            source: "../new/prefix1/emaill.png"


                        }
                        Rectangle{
                            Layout.preferredHeight: parent.height/2
                            Layout.preferredWidth: parent.width-parent.height/2-10
                            color:"transparent"
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        id: emailprofil
                        text:"email"
                        anchors.left: parent.left
                        anchors.leftMargin: 15

                    }}
                    }
                }
                Rectangle{
                    color:"transparent"
                    Layout.preferredHeight: parent.height/2
                    Layout.preferredWidth: parent.width
                    RowLayout{
                          // @disable-check M16
                        anchors.fill:parent
                        spacing:0
                        Image {
                            fillMode: Image.PreserveAspectCrop
                            Layout.preferredHeight: parent.height/2
                            Layout.preferredWidth: parent.height/2
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left:parent
                            anchors.leftMargin: 10
                            id: telefonprofilslika
                            source: "../new/prefix1/smartphone-call.png"


                        }
                        Rectangle{
                            Layout.preferredHeight: parent.height/2
                            Layout.preferredWidth: parent.width-parent.height/2-10
                            color:"transparent"
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        id: telefonprofil
                        text:"telefon"
                        anchors.left: parent.left
                        anchors.leftMargin: 15

                    }}
                    }
                }
                /*Rectangle{
                    color:"blue"
                    Layout.preferredHeight: parent.height/3
                    Layout.preferredWidth: parent.width
                }*/

            }
        }
    }
    Rectangle
    {
        id:rectanglelistaprijatelja
        anchors.fill:parent
        visible: false
        gradient: Gradient{
        GradientStop{position:0.0; color:"#2A9FF3"}
         GradientStop{position:1.0; color:"white"}
        }


        height:parent.height
        width:parent.width
        //color:"transparent"

        ScrollView{
         width: parent.width
         height: parent.height-dugmevratise.height-20

    ListView {
         boundsBehavior: ListView.StopAtBounds
         clip:true
       anchors.fill: parent
       width: parent.width
       height: parent.height
        model:_model
        delegate: ItemDelegate {
            width: profildolerectangle1.width
            height: profildolerectangle1.height*0.25
            required property string slika
            required property string ime
            required property string prezime
            required property string profil

           RowLayout
            {
                  // @disable-check M16
                anchors.fill:parent
                Image {
                    id:mojprofilprijateljimage
                    source: slika
                    Layout.preferredWidth: parent.height
                    Layout.preferredHeight: parent.height
                }
                Text {
                    id:mojprofilimeprijatelja
                    text: ime
                }

                Text {
                    id:mojprofilprezimeprijatelja
                    text: prezime
                }
                MouseArea{
                    id:mouseareaprijatelj
                 anchors.fill:parent
                 onPressed: {
                     dogadjajprofilimage.opacity=0.5
                 }
                 onExited: {
                     dogadjajprofilimage.opacity=1
                 }
                 onEntered: {
                     dogadjajprofilimage.opacity=0.5
                 }
                 onClicked: {
                 pageLoader.source= profil
                 }
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
            text: qsTr("OK")
            hoverEnabled: true
                    background:
                        Rectangle {
                        id:bb
                        border.width: 3
                        border.color: "#6AB1F9"
                        radius: 9
                        color: "#2A9FF3"
                    }
                    onPressed:
                    {
                         bb.color="#2775C4"

                    }
                    onPressedChanged: {
                        bb.color="#2A9FF3"
                    }
            onClicked:
            {
              rectanglelistaprijatelja.visible=false
            }
        }
    }
}

