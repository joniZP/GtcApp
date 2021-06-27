import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0



Rectangle{
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1f3c5e" }
          //  GradientStop { position: 0.33; color: "yellow" }
            GradientStop { position: 1.0; color: "#2970b1" }
        }
    anchors.fill: parent
    //color:parent.color
    ColumnLayout
    {
       anchors.fill: parent

    ColumnLayout
    {
        Layout.alignment: Qt.AlignCenter//   anchors.fill: parent
        width:parent.width
        spacing:0


        Rectangle
        {
            color:"transparent"
       //     anchors.horizontalCenter: parent.horizontalCenter
            Layout.alignment: Qt.AlignTop
            width:450
            height:50
            Text {
                id: textiznad
                anchors.centerIn: parent
                text:"PRIJAVA NA SISTEM"
                font.pixelSize: 20
                font.bold: true
                color:"white"
            }
        }

        Rectangle{


            color: "transparent"
            height:170
            width:450
            Layout.alignment:Qt.AlignCenter
            ColumnLayout
            {
                spacing:0
              TextField{
                  id: username
                  Image
                  {
                      id:usericon
                      height:20
                      width:20
                      source: "../ikonice/user.png"
                      anchors.left: parent.left
                      anchors.leftMargin: 10
                      anchors.verticalCenter: parent.verticalCenter
                      opacity:0.4
                  }
                   placeholderText: "username"
                   leftPadding: 40
                   topPadding: 20
                    font.pointSize: 10
                   Layout.preferredHeight: 50
                   Layout.preferredWidth: 450
                    //Layout.alignment: AlignTop
                }
                TextField{
                    id: password
                    Image
                    {
                        id:passicon
                        height:20
                        width:20
                        source: "../ikonice/lock.png"
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                         anchors.verticalCenter: parent.verticalCenter
                        opacity:0.4
                    }
                  placeholderText: "password"
                  leftPadding: 40
                  topPadding: 20
                  font.pointSize: 10
                  Layout.preferredHeight: 50
                  Layout.preferredWidth: 450
                    //Layout.alignment: AlignVCenter
                }
                   Rectangle
                   {
                       Layout.preferredHeight: 50
                       Layout.preferredWidth: 450
                       //Layout.alignment: AlignBottom
                       color: buttonce.pressed ? "#1b4676":"#1e9ad9"
                       MouseArea{
                           id:buttonce
                           anchors.fill: parent
                           hoverEnabled: true
                           onClicked:
                           {
                               if(username.text!="" && password.text!="")
                               {
                               if(korisnikEvents.prijava(username.text, password.text)===1)
                                 {
                                   setprofile();
                                   username.text=""
                                   password.text=""
                                   textiznad.text=""
                                   pageLoader.source= "odobriLokacijuForm.qml";
                                 }
                               else
                                 {
                                   console.log("gStanmprtam nestrp")
                                   textiznad.text="Korisnicko ime/lozinka pogresno/a"
                                   textiznad.color="red";
                                 }
                               }

                           }
                       }

                    Text{
                        anchors.centerIn: parent
                        text:"LOGIN"
                        color:"white"
                        font.pointSize: 10
                        font.bold: true
                    }

                }
                Rectangle//REGISTRACIJA i zaboravljena lozinka
                   {
                       color: "transparent"
                       Layout.preferredHeight: 40
                       Layout.preferredWidth: 450
                       ColumnLayout
                       {

                           anchors.fill:parent
                           spacing: 0

                           Rectangle//zaboravljena lozinka
                           {
                               color: "transparent"
                               Layout.preferredHeight: 20
                               Layout.preferredWidth: 450
                               Text
                               {
                                   //
                                   //topPadding: 10

                                   anchors.centerIn: parent
                                   color: zablozinkabutton.pressed ? "#003d57" : "#33AAFF"
                                   MouseArea{
                                       id:zablozinkabutton
                                       anchors.fill: parent
                                       hoverEnabled: true
                                       onClicked:
                                       {
                                           pageLoader.source="zaboravljenaLozinkaForm.qml"
                                       }
                                   }
                                   text:"Zaboravili ste lozinku?"
                                   font.pixelSize: 15
                                   font.bold: false

                               }
                           }
                       RowLayout{
                           Layout.preferredHeight: 20
                           Layout.preferredWidth: 450
                           //anchors.fill:parent
                           spacing:0
                           Rectangle
                           {
                               width:225
                               height:20
                               color:"transparent"
                             //anchors.left: parent
                               Text
                               {
                                   anchors.right: parent.right
                                   text:"Niste registrovani?"
                                   font.pixelSize: 15
                                   font.bold: false
                                   color:"white"
                               }

                           }
                           Rectangle
                           {
                               width:225
                               height:20

                               color:"transparent"
                               //anchors.right: parent
                               Text
                               {
                                   //anchors.leftMargin: parent
                                   color: registracijabutton.pressed ? "#003d57" : "#33FFF4"
                                   MouseArea{
                                       id:registracijabutton
                                       anchors.fill: parent
                                       hoverEnabled: true
                                       onClicked:
                                       {
                                           pageLoader.source="registracijaForm.qml"
                                       }
                                   }
                                   text:"  Registrujte se"
                                   font.pixelSize: 15
                                   font.bold: false
                                  // font.family: "Helvetica"


                               }

                           }
                       }

                     }

            }

        }
    }
    }
    }
}
