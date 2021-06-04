import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12

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
                        id:dodajprijateljaimage
                        height:(parent.height)/100*80
                        width:(parent.height)/100*80
                        source: "../new/prefix1/add-friend.png"
                        //dodaj sliku posaljizahtev

                        anchors.right: parent.right
                        anchors.rightMargin: (parent.height)/100*10
                        anchors.top: parent.top
                        anchors.topMargin:(parent.height)/100*10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin:(parent.height)/100*10

                        MouseArea{
                            anchors.fill: parent
                            id:dodajprijateljaarea

                            onClicked: {
                                var a=0//kreiraj u c++ globalnu promenljivu za ovo koja ce da pamti dal je zahtev posla, kako bi mogo da se obrise ako ne zelim da ga posaljem
                                if(a===0){
                                   dodajprijateljaimage.source="../new/prefix1/request-send.png"
                                    a=1
                                }
                                else
                                {
                                     dodajprijateljaimage.source="../new/prefix1/add-friend.png"
                                    a=0
                                }
                                   //dodaj sliku zahtev poslat
                                //tu treba da se odradi i ako mu je vec prijatelj, da cim udje u profil da se skloni ova slika
                                //to ce da znaci if(u listi prijatelja){dodajprijateljaimage.source="" dodajprijateljaimage.height=0 i w=0}
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

                                }
                                onClicked: {

                                    profilnaimage.width=(profilnarectangle.height)/100*80
                                    profilnaimage.height=(profilnarectangle.height)/100*80
                                    profilnaimage.layer.enabled=true
                                    imeiprezimeprofil.visible=true

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
            property int pom: 10
            property int pom2: 10

            RowLayout{
                //Layout.alignment: Qt.AlignHCenter
                  // @disable-check M16
                anchors.fill: parent
                spacing:0


                Rectangle{
                    color:"transparent"

                    Layout.preferredHeight: parent.height*0.5
                    Layout.preferredWidth: parent.height*0.5
                    Image {

                        anchors.fill:parent
                              id: zvezda1
                              source: "../new/prefix1/star-empty.png"

                              MouseArea{
                                  anchors.fill:parent
                                  id: zv1
                                  hoverEnabled: true
                                  onClicked:
                                  {
                                      pom+=1

                                  }
                                  onEntered: {
                                      zvezda1.opacity=0.3

                                  }
                                  onExited: {
                                      zvezda1.opacity=1

                                  }
                              }
                    }
                }
                Rectangle{
                    color:"transparent"

                    Layout.preferredHeight: parent.height*0.5
                    Layout.preferredWidth: parent.height*0.5
                    Image {
                        anchors.fill:parent
                              id: zvezda2
                              source: "../new/prefix1/star-empty.png"

                              MouseArea{
                                  anchors.fill:parent
                                  id: zv2
                                  hoverEnabled: true
                                  onClicked:
                                  {

                                  }
                                  onEntered: {
                                      zvezda1.opacity=0.3
                                      zvezda2.opacity=0.3
                                  }
                                  onExited: {
                                      zvezda1.opacity=1
                                      zvezda2.opacity=1
                                  }
                              }
                          }
                }
                Rectangle{
                    color:"transparent"

                    Layout.preferredHeight: parent.height*0.5
                    Layout.preferredWidth: parent.height*0.5
                    Image {
                        anchors.fill:parent
                              id: zvezda3
                              source: "../new/prefix1/star-empty.png"
                              fillMode: Image.PreserveAspectCrop
                          }
                    MouseArea{
                        anchors.fill:parent
                        id: zv3
                        hoverEnabled: true
                        onClicked:
                        {

                        }
                        onEntered: {
                            zvezda1.opacity=0.3
                            zvezda2.opacity=0.3
                            zvezda3.opacity=0.3
                        }
                        onExited: {
                            zvezda1.opacity=1
                            zvezda2.opacity=1
                            zvezda3.opacity=1
                        }
                    }
                }
                Rectangle{
                    color:"transparent"

                    Layout.preferredHeight: parent.height*0.5
                    Layout.preferredWidth: parent.height*0.5
                    Image {
                        anchors.fill:parent
                              id: zvezda4
                              source: "../new/prefix1/star-empty.png"
                              fillMode: Image.PreserveAspectCrop
                              MouseArea{
                                  anchors.fill:parent
                                  id: zv4
                                  hoverEnabled: true
                                  onClicked:
                                  {

                                  }
                                  onEntered: {
                                      zvezda1.opacity=0.3
                                      zvezda2.opacity=0.3
                                      zvezda3.opacity=0.3
                                      zvezda4.opacity=0.3
                                  }
                                  onExited: {
                                      zvezda1.opacity=1
                                      zvezda2.opacity=1
                                      zvezda3.opacity=1
                                      zvezda4.opacity=1
                                  }
                              }
                          }
                }
                Rectangle{
                    color:"transparent"

                    Layout.preferredHeight: parent.height*0.5
                    Layout.preferredWidth: parent.height*0.5
                    Image {
                        anchors.fill:parent
                              id: zvezda5
                              source: "../new/prefix1/star-empty.png"
                              MouseArea{
                                  anchors.fill:parent
                                  id: zv5
                                  hoverEnabled: true
                                  onClicked:
                                  {

                                  }
                                  onEntered: {
                                      zvezda1.opacity=0.3
                                      zvezda2.opacity=0.3
                                      zvezda3.opacity=0.3
                                      zvezda4.opacity=0.3
                                      zvezda5.opacity=0.3
                                  }
                                  onExited: {
                                      zvezda1.opacity=1
                                      zvezda2.opacity=1
                                      zvezda3.opacity=1
                                      zvezda4.opacity=1
                                      zvezda5.opacity=1
                                  }
                              }

                          }
                }


                Rectangle{//text gde treba da se doda ocena
                    color:"transparent"
                    Layout.preferredHeight: parent.height
                    Layout.preferredWidth: parent.width-parent.height*0.5*5
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        Layout.preferredHeight: parent.height*0.5
                        Layout.preferredWidth: parent.height*0.5
                        id: ocenaprofila
                        text: "Ocena: "+""//OVDE TREBA DA SE DODA OCENA KOJA SE RACUNA
                        font.pointSize: 10
                        color:"#DC5421"
                        font.bold: true
                        font.italic: true
                    }
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
                        text: qsTr("Opis lokacije iz baze procitan")
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
}

