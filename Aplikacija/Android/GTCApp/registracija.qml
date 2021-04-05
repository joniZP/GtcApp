import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
//import QtQuick.Controls.Material 2.3
Rectangle {

ColumnLayout{
    width:parent.width


    TextField {
        id: ime
        Layout.topMargin: 120
        placeholderText: qsTr("Ime i prezime")
         Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
    }
    Text {
        id: greskaime
        text: qsTr("Unesi ime")
        visible: false
        Layout.alignment: Qt.AlignHCenter
        color: "red"
        anchors.left: ime.left
        font.family: "Helvetica"
        font.pointSize: 12
        Layout.topMargin: -10
    }



    TextField {
        Layout.alignment: Qt.AlignHCenter
        id: korisnickoime
        placeholderText: qsTr("Korisnicko ime")
       // Material.background: Material.Orange

         //Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
    }
    Text {
        id: greskakorisnickoime
        text: qsTr("")
        visible: false
        Layout.alignment: Qt.AlignHCenter
        color: "red"
        anchors.left: ime.left
        font.family: "Helvetica"
        font.pointSize: 12
        Layout.topMargin: -10
    }
    TextField {
        Layout.alignment: Qt.AlignHCenter
        id: email
        placeholderText: qsTr("Email adresa")
       // Material.background: Material.Orange
         //Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
    }
    Text {
        id: greskaemail
        text: qsTr("Email nije validan")
        visible: false
        Layout.alignment: Qt.AlignHCenter
        color: "red"
        anchors.left: ime.left
        font.family: "Helvetica"
        font.pointSize: 12
        Layout.topMargin: -10
    }
    TextField {
        Layout.alignment: Qt.AlignHCenter
        id: lozinka
        placeholderText: qsTr("Lozinka")
      //  Material.background: Material.Orange

         //Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
          echoMode: TextInput.Password
    }
    Text {
        id: greskalozinka
        text: qsTr("Lozinka kratka")
        visible: false
        Layout.alignment: Qt.AlignHCenter
        color: "red"
        anchors.left: ime.left
        font.family: "Helvetica"
        font.pointSize: 12
        Layout.topMargin: -10
    }
    TextField {
        Layout.alignment: Qt.AlignHCenter
        id: potvrdalozinke
        placeholderText: qsTr("Potvrdi lozinku")
      //  Material.background: Material.Orange

         //Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
           echoMode: TextInput.Password
    }
    Text {
        id: greskapotvrdalozinke
        text: qsTr("Lozinke se ne poklapaju")
        visible: false
        Layout.alignment: Qt.AlignHCenter
        color: "red"
        anchors.left: ime.left
        font.family: "Helvetica"
        font.pointSize: 12
        Layout.topMargin: -10
    }

    Button {
         Layout.alignment: Qt.AlignHCenter
        id: button
        Layout.minimumWidth: parent.width/5*4
        text: qsTr("Registruj se")
        onClicked:
        {
            greskaemail.visible=false
            greskaime.visible=false
            greskakorisnickoime.visible=false
            greskalozinka.visible=false
            greskapotvrdalozinke.visible=false
            let b=false;
            if(ime.text.length==0||ime.text.length>=40)
            {
                b=true;
                ime.text=""
               greskaime.visible=true
            }
            if(korisnickoime.text.length==0)
            {
                b=true;
                korisnickoime.text=""
                greskakorisnickoime.text="Unesi korisnicko ime"
                greskakorisnickoime.visible=true
            }
            var regExp = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if(!regExp.test(email.text))
            {
                email.text=""
               greskaemail.visible=true
                b=true;
            }
            if(lozinka.text.length>7)
            {
                if(potvrdalozinke.text!=lozinka.text)
                {
                    potvrdalozinke.text=""
                    greskapotvrdalozinke.visible=true
                     b=true;
                }


            }
            else
            {
                potvrdalozinke.text=""
                greskalozinka.visible=true
                lozinka.text=""

                b=true
            }

            if(b==false)
            {
                block.visible=true
                if(!event.registracija(ime.text,korisnickoime.text,email.text,lozinka.text))
                {

                    korisnickoime.text=""
                    greskakorisnickoime.text="Korisnicko ime zauzeto"
                    greskakorisnickoime.visible=true
                    block.visible=false

                }
                else
                {
                    pageLoader.source = "prijava.qml"
                    block.visible=false
                }
            }
        }
    }


}

}


