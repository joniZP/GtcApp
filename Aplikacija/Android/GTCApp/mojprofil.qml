import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.0

Rectangle{
    property int pom: 0
    color: "#80b5ff"
    id: glavni
    anchors.fill:parent
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

                    onClicked:
                    {
                        natpis="Izmena profila"
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
                                block.visible = true
                                prijateljiEvents.prikaziListuPrijatelja()
                                rectanglelistaprijatelja.visible=true
                                 block.visible = false
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
                            source: mProfilInst.getSlikaURL()// "../new/prefix1/slika.jfif"
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

                                width: (parent.height)/100*40
                                height:(parent.height)/100*40
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
                                            //events.izmenislikuprofila(fileDialog.fileUrl);
                                            korisnikEvents.izmeniSlikuProfila(fileDialog.fileUrl);
                                            refreshSlika(fileDialog.fileUrl);

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
            id: imeprezimerect
                    color:"transparent"
                    height:parent.height*0.1
                    width:parent.width

                    Text {
                        id: imeiprezimeprofil
                        text: qsTr(mProfilInst.getIme() +" "+ mProfilInst.getPrezime())
                        //anchors.centerIn: parent
                        //anchors.top: parent
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 20
                        color: "white"
                        font.bold: true
                    }

         }

        Rectangle{//ocena
            color:"transparent"
            height:parent.height*0.1
            width:parent.width
            anchors.top:imeprezimerect.bottom
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
                        text: "Ocena: "+ mProfilInst.getOcena();
                        font.pointSize: 12
                        color:"white"
                        font.bold: false
                        font.italic: true
                    }

                }

            }
        }
        Rectangle{//resto


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
                    color: mouseareakreiranidogadjaji.pressed ? "white":"#549cff"
                    Text{
                        id:prvitext
                        text:"Kreirane\nlokacije"
                        anchors.centerIn: parent
                        font.pixelSize: 14
                       color: mouseareakreiranidogadjaji.pressed ? "#549cff":"white"
                        font.bold: true


                    }
                    MouseArea{
                        id: mouseareakreiranelokacije
                        hoverEnabled: true
                        anchors.fill: parent
                        onClicked: {
                            profildolerectangle2.visible=false
                            profildolerectangle3.visible=false
                            profildolerectangle1.visible=true
                            prvi.color="white"
                            treci.color="#549cff"
                            drugi.color="#549cff"
                            prvitext.color="#549cff"
                            drugitext.color="white"

                            trecitext.color="white"
                        }
                    }
                    //border.color: "#1E2BAF"
                    //border.width: 0.5




                }
                Rectangle{
                    id:drugi
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width*0.33
                    color: mouseareakreiranidogadjaji.pressed ? "white":"#549cff"
                    Text{
                        id: drugitext
                        text:"Kreirani\ndogađaji"
                        anchors.centerIn: parent
                        font.pixelSize: 14
                       color: mouseareakreiranidogadjaji.pressed ? "#549cff":"white"
                        font.bold: true



                    }
                    MouseArea{
                        id: mouseareakreiranidogadjaji
                        hoverEnabled: true
                        anchors.fill: parent
                        onClicked: {
                            profildolerectangle2.visible=true
                            profildolerectangle3.visible=false
                            profildolerectangle1.visible=false
                            prvi.color="#549cff"
                            treci.color="#549cff"
                            drugi.color="white"
                            drugitext.color="#549cff"
                            prvitext.color="white"
                            trecitext.color="white"
                        }
                    }
                    //border.color: "#1E2BAF"
                   // border.width: 0.5


                }
                Rectangle{
                    id:treci
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width*0.33
                   color: mouseareakreiranidogadjaji.pressed ? "white":"#549cff"
                    Text{
                        id: trecitext
                        text:"Kontakt"
                        anchors.centerIn: parent
                        font.pixelSize: 14
                       color: mouseareakreiranidogadjaji.pressed ? "#549cff":"white"
                        font.bold: true


                    }

                    MouseArea{
                        id: mouseareakontakt
                        hoverEnabled: true
                        anchors.fill: parent
                        onClicked: {
                            profildolerectangle2.visible=false
                            profildolerectangle3.visible=true
                            profildolerectangle1.visible=false
                            prvi.color="#549cff"
                            treci.color="white"
                            drugi.color="#549cff"
                            trecitext.color="#549cff"
                            drugitext.color="white"
                            prvitext.color="white"

                        }
                    }
                   // border.color: "#1E2BAF"
                    //border.width: 0.5


                }
            }
        }
        Rectangle{//resto1
            id:profildolerectangle1
            height:parent.height*0.4
            width:parent.width
            color:"white"

            ScrollView{
                id:scrollkorisniklokacija
             width: parent.width
             height: parent.height


          ListView
          {
           boundsBehavior: ListView.StopAtBounds
           clip:true
           anchors.fill: parent
           width: parent.width
           height: parent.height
            model:_korisniklokacijamodel
            delegate: ItemDelegate {
                height:100
                width:scrollkorisniklokacija.width
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
                       clip: true
                       anchors.left: parent.left
                       Image
                       {
                           id:lokacijaprofilimage
                           source: slika
                           width: parent.width
                           height: parent.height
                           anchors.centerIn: parent
                           fillMode: Image.PreserveAspectFit
                           onStatusChanged:
                           {
                               if(lokacijaprofilimage.status==Image.Ready)
                               {
                                   spiner.visible=false
                                  var a=lokacijaprofilimage.paintedHeight/lokacijaprofilimage.paintedWidth
                                  if(lokacijaprofilimage.paintedWidth<slikarect.width)
                                  {
                                      var b=lokacijaprofilimage.width-lokacijaprofilimage.paintedWidth
                                      lokacijaprofilimage.height=lokacijaprofilimage.height+b*a
                                  }
                                  else if(lokacijaprofilimage.paintedHeight<slikarect.height)
                                  {
                                      var d=lokacijaprofilimage.height-lokacijaprofilimage.paintedHeight
                                      lokacijaprofilimage.width=lokacijaprofilimage.width+d/a
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
                           width: parent.width
                           wrapMode: Text.WordWrap
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
                           block.visible=true
                           getLokacijaById(id)
                           block.visible=false
                           naziv="Lokacija"
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
        Rectangle{//resto2
            id:profildolerectangle2
            height:parent.height*0.4
            width:parent.width
            color:"white"

            ScrollView{
             width: parent.width
             height: parent.height


ListView {
             boundsBehavior: ListView.StopAtBounds
             clip:true
           anchors.fill: parent
           width: parent.width
           height: parent.height
            model:_korisnikdogadjajmodel
            delegate: ItemDelegate {
                width: profildolerectangle1.width
                height: profildolerectangle1.height*0.25
                required property string tip
                required property string opis
                required property string vreme
                required property int id
////////////////

                Rectangle{
                width: parent.width
                height: parent.height-10
                anchors.verticalCenter: parent.verticalCenter
                Rectangle
                {
                    id:tiprect
                    height: parent.height
                    width: parent.width/3
                    anchors.left: parent.left
                    Text
                    {
                        id:tipdogadjajaprofil
                        text: qsTr(tip)
                        width: parent.width
                        wrapMode: Text.WordWrap
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                Rectangle
                {
                    id:opisrect
                    height: parent.height
                    width:parent.width/3
                    anchors.left: tiprect.right
                    Text
                    {
                        id:opisdogadjajaprofil
                        text: qsTr(opis)
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        wrapMode: Text.WordWrap
                        width: parent.width
                    }
                }
                Rectangle
                {
                    id:vremerect
                    height: parent.height
                    width:parent.width/3
                    anchors.left: opisrect.right
                    Text
                    {
                        id:vremedogadjajaprofil
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
                        block.visible = true;
                        getDogadjajById(id);
                        natpis="Dogadjaj"
                        pageLoader.source= "dogadjaj.qml"
                        block.visible = false;
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


                ////////////////////////


            }
        }
        }
        }
        Rectangle{//resto3
            id:profildolerectangle3
            height:parent.height*0.4
            width:parent.width
            color:"white"
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
                        text:mProfilInst.getEmail()
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
                        text:mProfilInst.getTelefon()
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
        color:"#A7DBFA"
       // gradient: Gradient{
     //   GradientStop{position:0.0; color:"#2A9FF3"}
     //    GradientStop{position:1.0; color:"#2A9FF3"}
      //  }



        //color:"transparent"

        ScrollView{
            id:scrollprijatelji
         width: parent.width
         height: parent.height//-dugmevratise.height-20

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
                           _prijateljimodel.obrisi(index)
                           prijateljiEvents.izbrisiPrijatelja(korisnickoime)
                           console.log(index)
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
