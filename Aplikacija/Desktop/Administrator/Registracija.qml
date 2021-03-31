import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0
Item {
    Rectangle
    {
        gradient: Gradient{
        GradientStop{position:0.0; color:"#1f3c5e"}
         GradientStop{position:1.0; color:"#2970b1"}
        }

        anchors.fill: parent
        color:parent.color
        ColumnLayout
        {
            anchors.fill:parent
            ColumnLayout
            {

            Layout.alignment: Qt.AlignCenter
            width:parent.width
            spacing:0
               Rectangle
               {
                   color:"transparent"
                   anchors.horizontalCenter:parent.horizontalCenter
                   Layout.alignment: Qt.AlignTop
                   width:450
                   height:50
                   Text {
                       id: textiznad
                       anchors.centerIn: parent
                       text: qsTr("text")
                       font.bold:true
                       font.pixelSize: 20
                       color:"white"

                   }

               }
               Rectangle
               {
                   color:"transparent"
                   height:470
                   width:450
                   Layout.alignment: Qt.AlignCenter
                   ColumnLayout
                   {
                       spacing:0
                       TextField
                       {
                           id:ime
                           placeholderText: "Ime"
                           font.pixelSize: 20
                           leftPadding: 10
                           topPadding: 10
                           Layout.preferredHeight: 50
                           Layout.preferredWidth: 450
                           Layout.alignment: AlignTop
                           onTextChanged: imerect.visible=false
                           //border.width: 1
                           //radius:10



                       }
                       Rectangle//obavestenje o neispravnosti
                       {

                           color:"transparent"
                           anchors.horizontalCenter:parent.horizontalCenter
                           Layout.alignment: Qt.AlignTop
                           width:450
                           height:20
                           Text {
                               id:imerect

                               visible: false
                               anchors.left: parent
                               text: qsTr("Unesite ime.")
                               //font.bold:true
                               font.pixelSize: 15
                               color:"red"

                           }

                       }
                       TextField
                       {
                           id:prezime
                           placeholderText: "Prezime"
                           font.pixelSize: 20
                           leftPadding: 10
                           topPadding: 10
                           Layout.preferredHeight: 50
                           Layout.preferredWidth: 450
                           Layout.alignment: AlignTop
                          // radius: 10
                           onTextChanged: prezrect.visible=false

                       }
                       Rectangle//obavestenje o neispravnosti
                       {

                           color:"transparent"
                           anchors.horizontalCenter:parent.horizontalCenter
                           Layout.alignment: Qt.AlignTop
                           width:450
                           height:20
                           Text {
                               id:prezrect

                               visible: false
                               anchors.left: parent
                               text: qsTr("Unesite prezime.")
                               //font.bold:true
                               font.pixelSize: 15
                               color:"red"

                           }

                       }
                       TextField
                       {
                           id: email
                           placeholderText: "E-mail"
                           font.pixelSize: 20
                           leftPadding: 10
                           topPadding: 10
                           Layout.preferredHeight: 50
                           Layout.preferredWidth: 450
                           Layout.alignment: AlignTop
                           onTextChanged: emailrect.visible=false

                       }
                       Rectangle//obavestenje o neispravnosti
                       {

                           color:"transparent"
                           anchors.horizontalCenter:parent.horizontalCenter
                           Layout.alignment: Qt.AlignTop
                           width:450
                           height:20
                           Text {
                               id: emailrect
                               visible: false
                               anchors.left: parent
                               text: qsTr("E-mail nije validan.")
                               //font.bold:true
                               font.pixelSize: 15
                               color:"red"

                           }

                       }
                       TextField
                       {
                           id:korime
                           placeholderText: "Korisnicko ime"
                           font.pixelSize: 20
                           leftPadding: 10
                           topPadding: 10
                           Layout.preferredHeight: 50
                           Layout.preferredWidth: 450
                           Layout.alignment: AlignTop
                           onTextChanged: korimerect.visible=false

                       }
                       Rectangle//obavestenje o neispravnosti
                       {

                           color:"transparent"
                           anchors.horizontalCenter:parent.horizontalCenter
                           Layout.alignment: Qt.AlignTop
                           width:450
                           height:20
                           Text {

                               id:korimerect
                               visible:false
                               anchors.left: parent
                               text: qsTr("Korisnicko ime vec postoji ili je prekratko.")
                               //font.bold:true
                               font.pixelSize: 15
                               color:"red"

                           }

                       }
                       TextField
                       {
                           id:lozinka
                           placeholderText: "Lozinka"
                           font.pixelSize: 20
                           leftPadding: 10
                           topPadding: 10
                           Layout.preferredHeight: 50
                           Layout.preferredWidth: 450
                           Layout.alignment: AlignTop
                           onTextChanged: lozinkarect.visible=false

                       }
                       Rectangle//obavestenje o neispravnosti
                       {

                           color:"transparent"
                           anchors.horizontalCenter:parent.horizontalCenter
                           Layout.alignment: Qt.AlignTop
                           width:450
                           height:20
                           Text {
                               id:lozinkarect
                               visible: false
                               anchors.left: parent
                               text: qsTr("Lozinka mora da ima vise od 8 karaktera.")
                               //font.bold:true
                               font.pixelSize: 15
                               color:"red"

                           }

                       }
                       TextField
                       {
                           id: potvrdjenalozinka
                           placeholderText: "Potvrditi lozinku"
                           font.pixelSize: 20
                           leftPadding: 10
                           topPadding: 10
                           Layout.preferredHeight: 50
                           Layout.preferredWidth: 450
                           Layout.alignment: AlignTop
                           onTextChanged: potvrdjivanjalozinkarect.visible=false
                           //Keys.enterPressed:

                       }
                       Rectangle//obavestenje o neispravnosti
                       {

                           color:"transparent"
                           anchors.horizontalCenter:parent.horizontalCenter
                           Layout.alignment: Qt.AlignTop
                           width:450
                           height:20
                           Text {
                               id: potvrdjenalozinkarect
                               visible: false
                               anchors.left: parent
                               text: qsTr("Lozinke se ne poklapaju.")
                               //font.bold:true
                               font.pixelSize: 15
                               color:"red"

                           }

                       }
                       Rectangle
                       {
                           Layout.preferredHeight: 50
                           Layout.preferredWidth: 450
                           Layout.alignment: AlignBottom
                           radius:10
                           color: regbutton.pressed ? "#1b4676":"#1e9ad9"

                           MouseArea{
                               id:regbutton
                               anchors.fill: parent
                               hoverEnabled: true
                               onClicked:
                               {
                                   var a=false;

                                   if(ime.text.length<1 || ime.text.length>40)
                                   {
                                       imerect.visible=true;a=true;
                                       //ime.text="";
                                   }
                                   if(prezime.text.length<1 || prezime.text.length>40)
                                   {
                                       prezrect.visible=true;a=true
                                       //prezime.text="";
                                   }
                                   if(korime.text.length<1 || korime.text.length>40)
                                   {
                                      korimerect.visible=true;a=true;
                                      //korime.text="";
                                   }

                                   if(lozinka.text.length<8 || lozinka.text.length>30)
                                   {
                                       lozinkarect.visible=true;a=true;
                                       //lozinka.text="";

                                   }
                                   if(lozinka.text!=potvrdjenalozinka.text)
                                   {
                                       potvrdjenalozinkarect.visible=true;a=true;
                                       //lozinka.text="";
                                      // potvrdjenalozinka.text="";
                                   }
                                   function validateEmail(email) {
                                       const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                                       return re.test(String(email).toLowerCase());
                                   }
                                   if(validateEmail(email.text)===false || email.text.length<1 || email.text.length>40 )
                                   {
                                       emailrect.visible=true;a=true;
                                       //email.text="";
                                   }
                                   if(a===false)
                                   {
                                       //prijavljivanje nakon provere u bazi to ne moze odavde
                                       pageLoader.source="LoginForm.qml"
                                   }
                               }
                           }

                        Text{
                            anchors.centerIn: parent
                            text:"Registracija"
                            color:"white"
                            font.pointSize: 10
                            font.bold: true
                        }
                       }

                   }
               }
            }
        }

    }

}
