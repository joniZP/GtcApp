import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
//import QtQuick.Controls.Material 2.3
//import KorisnikEvents 1.0

Rectangle {

ColumnLayout{
     // @disable-check M16
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
      //  Material.background: Material.Orange

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
                 let pom=korisnikEvents.prijava(prijavakorisnickoime.text,prijavalozinka.text);
                 block.visible=false
                 if(pom==0)
                 {
                  popuptext.text="Verifikuj email"
                  popup.open();
                 }
                 else if(pom==2)
                 {
                     popuptext.text="Pogresno korisnicko ime ili lozinka"
                     console.log("pre"+popup.x+" "+popup.y)
                     console.log()
                     popup.open()
                     console.log("posle"+popup.x+" "+popup.y)
                 }
                 else
                 {

                      block.visible=true
                     loginID.visible = false;
                     porukeID.visible = true;
                     zahteviID.visible = true;
                     var v=back.nazad(pageLoader.source)
                     if(v ==="qrc:/lokacija.qml")//getIdLDP
                        {
                            getLokacijaById(back.getIdLDP());
                        }
                     else if(v ==="qrc:/dogadjaj.qml")
                        {
                            getDogadjajById(back.getIdLDP());
                        }
                        else if(v ==="qrc:/profil.qml")
                        {
                            getProfilByUsername(back.getIdLDP())
                        }

                        if(v==="qrc:/pocetna.qml")
                        {
                            pretrazi.ucitavanjeLokacijaPocetna();
                        }
                        pageLoader.source=v;
                        refreshProfilData()
                        block.visible=false
                 }
             }
         }

    }

    Text {
         Layout.alignment: Qt.AlignHCenter
        id: text3
        text: qsTr("Zaboravili ste lozinku?")
        font.pixelSize: 15
        color: "#549cff"
        MouseArea{
            anchors.fill:parent
            onClicked:
            {
               natpis="Zaboravljena lozinka"
                pageLoader.source = "zaboravljena_lozinka.qml"
            }

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
                 natpis="Registracija"
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
    x:(parent.width-popup.width)/2
    y:(parent.height-popup.height)/2


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
        onClicked:
        {
            popup.close()
            pop
        }
        Layout.alignment: Qt.AlignHCenter
    }
    }
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    // anchors.centerIn: parent
    }
}
