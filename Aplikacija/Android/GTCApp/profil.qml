
import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12

Rectangle{
    property int pom: 0
    property var slikazvezda: [zvezda1,zvezda2,zvezda3,zvezda4,zvezda5]
    function oceni(k)
    {
        for(var i=0;i<5;i++)
        {
            if(i<k)
            {
                slikazvezda[i].source="qrc:/new/prefix1/star.png"
            }
            else
            {
                 slikazvezda[i].source="qrc:/new/prefix1/star-empty.png"
            }
        }
    }

    function refreshIcon(username)
    {
        dodajprijateljaimage.source = prijateljiEvents.getSlikaByUsername(username);
    }

    gradient: Gradient{
    GradientStop{position:0.0; color:"#549cff"}
     GradientStop{position:1.0; color:"#d3d3d3"}
    }
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
                        id:dodajprijateljaimage
                        height:(parent.height)/100*80
                        width:(parent.height)/100*80
                        source: prijateljiEvents.getFriendSlika();
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

                                prijateljiEvents.postaviNovoStanje();
                                dodajprijateljaimage.source =  prijateljiEvents.getFriendSlika();
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
                            source: mProfil.getSlikaURL()
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
            id:imeprezimerect
                    color:"transparent"
                    height:parent.height*0.1
                    width:parent.width

                    Text {
                        id: imeiprezimeprofil
                        text: qsTr(mProfil.getIme()+" "+mProfil.getPrezime())//\n
                        //anchors.centerIn: parent
                        //anchors.top: parent
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 20
                        color: "white"
                        font.bold: true
                    }

         }

        Rectangle{
            color:"transparent"
            height:parent.height*0.1
            width:parent.width
            RowLayout{
                anchors.fill: parent
                spacing:0

                    Image {

                        Layout.preferredHeight: parent.height*0.5
                        Layout.preferredWidth: parent.height*0.5
                              id: zvezda1
                              source: "qrc:/new/prefix1/star-empty.png"

                              MouseArea
                              {
                                  anchors.fill:parent
                                  onClicked:
                                  {
                                      oceni(1)
                                  }

                              }
                    }



                    Image {
                        Layout.preferredHeight: parent.height*0.5
                        Layout.preferredWidth: parent.height*0.5
                              id: zvezda2
                              source: "qrc:/new/prefix1/star-empty.png"

                              MouseArea
                              {
                                  anchors.fill:parent
                                  onClicked:
                                  {
                                      oceni(2)
                                  }


                              }
                          }


                    Image {
                        Layout.preferredHeight: parent.height*0.5
                        Layout.preferredWidth: parent.height*0.5
                              id: zvezda3
                              source: "qrc:/new/prefix1/star-empty.png"
                              fillMode: Image.PreserveAspectCrop
                              MouseArea
                              {
                                  anchors.fill:parent
                                  onClicked:
                                  {
                                     oceni(3)
                                  }


                              }
                          }


Image {
                        Layout.preferredHeight: parent.height*0.5
                        Layout.preferredWidth: parent.height*0.5
                              id: zvezda4
                              source: "qrc:/new/prefix1/star-empty.png"
                              fillMode: Image.PreserveAspectCrop
                              MouseArea
                              {
                                  anchors.fill:parent
                                  onClicked:
                                  {
                                      oceni(4)
                                  }


                              }
                          }



                    Image {
                        Layout.preferredHeight: parent.height*0.5
                        Layout.preferredWidth: parent.height*0.5
                              id: zvezda5
                              source: "qrc:/new/prefix1/star-empty.png"
                              MouseArea
                              {
                                  anchors.fill:parent
                                  onClicked:
                                  {
                                     oceni(5)
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
                        text: "Ocena: "+mProfil.getOcena()//OVDE TREBA DA SE DODA OCENA KOJA SE RACUNA
                        font.pointSize: 10
                        color:"white"
                        font.bold: true
                        font.italic: true
                    }
                }



            }
        }
        Rectangle{//resto
            gradient: Gradient{
            GradientStop{position:0.0; color:"#d3d3d3"}
             GradientStop{position:1.0; color:"#d3d3d3"}
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
                   color: mouseareakreiranidogadjaji.pressed ? "white":"#549cff"
                    Text{
                        id: prvitext
                        text:"Kreirane\nlokacije"
                        anchors.centerIn: parent
                        font.pixelSize: 14
                        color: mouseareakreiranidogadjaji.pressed ? "#549cff":"white"
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
                            prvi.color="white"
                            treci.color="#549cff"
                            drugi.color="#549cff"
                            prvitext.color="#549cff"
                            drugitext.color="white"

                            trecitext.color="white"

                        }
                    }
                    border.color: "#1E2BAF"
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
                    border.color: "#1E2BAF"
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
                    border.color: "#1E2BAF"
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


ListView {
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
                           opislokacijeprofil.text=id
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
            model:_korisnikdogadjajmodel
            delegate: ItemDelegate {
                width: profildolerectangle1.width
                height: profildolerectangle1.height*0.25
                required property string tip
                required property string opis
                required property string vreme
                required property int id

               RowLayout
                {
                      // @disable-check M16
                    anchors.fill:parent
                 /*   Image {
                        id:dogadjajprofilimage
                        source: slika
                        Layout.preferredWidth: parent.height
                        Layout.preferredHeight: parent.height
                    }*/
                    Text {
                        id:tipdogadjajaprofil
                        text: qsTr(tip)
                    }

                    Text {
                        id:opisdogadjajaprofil
                        text: qsTr(opis)
                    }
                    Text {
                        id:vremedogadjajaprofil
                        text: qsTr(vreme)
                    }
                    MouseArea{
                        id:mouseareaprofildogadjaj
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
                        text:qsTr(mProfil.getEmail())
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
                        text: qsTr(mProfil.getTelefon())
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
