import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
//import QtQuick.Controls.Material 2.3
Rectangle {

    anchors.fill: parent
    TextField {
        anchors.top: parent.top
        anchors.topMargin: parent.height/3
        anchors.horizontalCenter: parent.horizontalCenter
        id: email
        placeholderText: qsTr("Email adresa")
       // Material.background: Material.Orange
         //Layout.alignment: Qt.AlignHCenter
         width: parent.width/5*4
    }
    Text {
        id: greskaemail
        text: qsTr("Email nije validan")
        visible: false
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.top: email.bottom
        color: "red"
        anchors.left: email.left
        font.family: "Helvetica"
        font.pointSize: 12
        anchors.topMargin: -5
    }

    Button {

        id: button
       width: parent.width/5*4
       anchors.top: greskaemail.bottom
       anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Posalji")
        onClicked:
        {
            greskaemail.visible=false
            let b=false;
            var regExp = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            if(!regExp.test(email.text))
            {
                email.text=""
               greskaemail.visible=true
                b=true;
            }


            if(b===false)
            {
                block.visible=true
                korisnikEvents.zaboravljena_lozinka(email.text)
                natpis="Prijava"
                pageLoader.source = "prijava.qml"
                block.visible=false
            }
        }
    }


}


