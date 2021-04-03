import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Rectangle {

ColumnLayout{
    width:parent.width


    TextField {
        id: prijavakorisnickoime
        Layout.topMargin: 120
        placeholderText: qsTr("Korisnicko ime")
         Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
    }
    Text {
        id: korisnickoimegreska
        text: qsTr("Unesi korisnicko ime")
        visible: false
        Layout.alignment: Qt.AlignHCenter
        color: "red"
        anchors.left: prijavalozinka.left
        font.family: "Helvetica"
        font.pointSize: 12
        Layout.topMargin: -10
    }

    TextField {
        Layout.alignment: Qt.AlignHCenter
        id: prijavalozinka
        placeholderText: qsTr("Lozinka")
        Material.background: Material.Orange

         //Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
           echoMode: TextInput.Password
    }
    Text {
        id: lozinkagreska
        text: qsTr("Lozinka nije ispravna")
        visible: false
        Layout.alignment: Qt.AlignHCenter
        color: "red"
        anchors.left: prijavalozinka.left
        font.family: "Helvetica"
        font.pointSize: 12
        Layout.topMargin: -10
    }

    Button {
         Layout.alignment: Qt.AlignHCenter
        id: button
        Layout.minimumWidth: parent.width/5*4
        text: qsTr("Prijavi se")
        onClicked:
        {
             let b=false
             korisnickoimegreska.visible=false
             lozinkagreska.visible=false
             if(prijavakorisnickoime.text.length==0)
             {
                 b=true
                 korisnickoimegreska.visible=true
             }
             if(prijavalozinka.text.length<8)
             {
                 b=true
                 lozinkagreska.visible=true
             }
             if(b==false)
             {
                 block.visible=true
                 let pom=event.prijava(prijavakorisnickoime.text,prijavalozinka.text);
                 block.visible=false
                 if(pom==0)
                 {
                  popuptext.text="Verifikuj email"
                  popup.open();
                 }
                 else if(pom==2)
                 {
                     popuptext.text="Pogresno korisnicko ime ili lozinka"
                     popup.open();
                 }
                 else
                 {
                     pageLoader.source = "pocetna.qml"
                 }
             }
         }

    }

    Text {
         Layout.alignment: Qt.AlignHCenter
        id: text3
        text: qsTr("Zaboravili ste lozinku?")
        font.pixelSize: 15
        MouseArea{
            anchors.fill:parent

        }
    }
RowLayout{
     Layout.alignment: Qt.AlignHCenter
    Text {
        id: text1
        text: qsTr("Nemas nalog?")
        font.pixelSize: 15
    }

    Text {
        id: text2
        text: qsTr("Registruj se")
        font.pixelSize:15
        color: "#549cff"
        MouseArea{
            anchors.fill:parent
            onClicked:
            {
                 pageLoader.source = "registracija.qml"

            }

        }
    }
}


}
Popup {
    id: popup
    width: parent.width/5*4
    height: 150
    modal: true
    focus: true
    anchors.centerIn: parent
    ColumnLayout
    {
        width:parent.width
        spacing: 50
    Text {
        id: popuptext
        text:""
        Layout.alignment: Qt.AlignHCenter
        Layout.topMargin: 10
    }

    Button
    {
        text: qsTr("U redu")
        onClicked: popup.close()
        Layout.alignment: Qt.AlignHCenter
    }
    }
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    // anchors.centerIn: parent
    }
}
