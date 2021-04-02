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
            spacing:50
               Rectangle
               {
                   color:"transparent"
                   anchors.horizontalCenter:parent.horizontalCenter
                  // Layout.alignment: Qt.AlignTop
                   width:450
                   height:30
                   Text {

                       anchors.centerIn: parent
                       text: qsTr("Zaboravljena lozinka\n\n")
                       font.bold:true
                       font.pixelSize: 30
                       color:"white"

                   }
                   Text {

                       anchors.left: parent
                       text: qsTr("Unesite svoju E-mail adresu kako bismo\nVam poslali uputstvo za resetovanje lozinke.")
                       font.bold:false
                       font.pixelSize: 15
                       color:"white"
                       font.italic: true

                   }

               }
               /*Rectangle
               {
                   color:"transparent"
                   anchors.horizontalCenter:parent.horizontalCenter
                   //Layout.alignment: Qt.AlignTop
                   width:450
                   height:20
                   Text {

                       anchors.left: parent
                       text: qsTr("Molimo vas unesite svoju E-mail adresu kako bi\n Vam poslali uputstvo za resetovanje lozinke. ")
                       font.bold:true
                       font.pixelSize: 20
                       color:"white"

                   }

               }*/

               Rectangle
               {
                   color:"transparent"
                   height:100
                   width:450
                   Layout.alignment: Qt.AlignCenter
                   ColumnLayout
                   {
                       spacing:10
                       Rectangle
                       {
                           color:"transparent"
                           anchors.left:parent
                           Layout.alignment: Qt.AlignTop
                           width:450
                           height:20
                           Text {

                               anchors.left: parent
                               text: qsTr("E-mail adresa:")
                               font.bold:true
                               font.pixelSize: 20
                               color:"white"

                           }

                       }
                       RowLayout{
                           spacing: 10
                       TextField
                       {
                           id:email
                           placeholderText: "E-mail"
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
                       Rectangle//DUGME posalji mail za resetovanje lozinke id: lozinkamailbutton
                       {

                          anchors.right: parent.right
                           Layout.alignment: Qt.AlignTop
                           color: lozinkamailbutton.pressed ? "#1b4676":"#1e9ad9"
                           width:200
                           height:50
                           radius: 9
                           Text {

                               anchors.centerIn: parent
                               text: qsTr("Posalji E-mail")
                               font.bold:true
                               font.pixelSize: 20
                               color:"white"
                               //color: lozinkamailbutton.pressed ? "#003d57" : "white"
                               MouseArea{
                                   id:lozinkamailbutton
                                   anchors.fill: parent
                                   hoverEnabled: true
                                   onClicked:
                                   {
                                       pageLoader.source="Registracija.qml"//funkcija za slanje mejla za promenu lozinke
                                   }

                           }

                       }}}
                       Rectangle//dugme nazad na login
                       {

                          anchors.left: parent
                           color:"transparent"
                           width:450
                           height:20
                           Text {

                               anchors.centerIn: parent
                               text: qsTr("Nazad na prijavljivanje.")
                               font.bold:false
                               font.italic: true
                               font.pixelSize: 15
                               //color:"white"
                               color: nazadnaloginbuttoon.pressed ? "#003d57" : "#33AAFF"
                               MouseArea{
                                   id:nazadnaloginbuttoon
                                   anchors.fill: parent
                                   hoverEnabled: true
                                   onClicked:
                                   {
                                       pageLoader.source="LoginForm.qml"
                                   }

                           }

                       }}

}}}}}}
