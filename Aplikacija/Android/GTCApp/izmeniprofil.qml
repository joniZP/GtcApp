import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
//import QtQuick.Controls.Material 2.3
Rectangle {

ColumnLayout{

// @disable-check M16
    width:parent.width


    TextField {
        id: ime
        Layout.topMargin: 80
        placeholderText: qsTr("Ime")
        text: mProfilInst.getIme()
         Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
    }
    TextField {
        id: prezime
        placeholderText: qsTr("Prezime")
        text:  mProfilInst.getPrezime()
         Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
    }



    TextField {
        Layout.alignment: Qt.AlignHCenter
        id: korisnickoime
        placeholderText: qsTr("Korisnicko ime")
       // Material.background: Material.Orange
         text:  mProfilInst.getKorisnickoIme()
         //Layout.alignment: Qt.AlignHCenter
        Layout.minimumWidth: parent.width/5*4
        enabled: false
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
        text:  mProfilInst.getEmail()
       // Material.background: Material.Orange
         //Layout.alignment: Qt.AlignHCenter
         Layout.minimumWidth: parent.width/5*4
         enabled: false
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

    TextField {
        Layout.alignment: Qt.AlignHCenter
        id: telefon
        placeholderText: qsTr("Telefon")
         text:  mProfilInst.getTelefon()
        Layout.minimumWidth: parent.width/5*4

    }


    Button {
         Layout.alignment: Qt.AlignHCenter
        id: button
        Layout.minimumWidth: parent.width/5*4
        text: qsTr("Izmeni")
        onClicked:
        {
            greskaemail.visible=false
            greskakorisnickoime.visible=false
            greskalozinka.visible=false
            greskapotvrdalozinke.visible=false
            let b=false;
           // var regExp = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            //if(!regExp.test(email.text))
          //  {
              //  email.text=""
             //  greskaemail.visible=true
              //  b=true;
          //  }
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

            if(b===false)
            {
                block.visible=true
                korisnikEvents.izmenaProfila(ime.text,prezime.text,lozinka.text,telefon.text)
                mProfilInst=localData.getMProfil()
                block.visible=false
            }
        }
    }


}

}


