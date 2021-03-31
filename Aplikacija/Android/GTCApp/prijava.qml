import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

Rectangle {

ColumnLayout{
    width:parent.width


    TextField {
        id: textField
        Layout.topMargin: 120
        placeholderText: qsTr("Korisnicko ime")
         Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
    }

    TextField {
        Layout.alignment: Qt.AlignHCenter
        id: textField1
        placeholderText: qsTr("Lozinka")
        Material.background: Material.Orange

         //Layout.alignment: Qt.AlignHCenter
           Layout.minimumWidth: parent.width/5*4
    }

    Button {
         Layout.alignment: Qt.AlignHCenter
        id: button
        Layout.minimumWidth: parent.width/5*4
        text: qsTr("Prijavi se")
    }
    Text {
         Layout.alignment: Qt.AlignHCenter
        id: text3
        text: qsTr("Zaboravili ste lozinku?")
        font.pixelSize: 12
        MouseArea{
            anchors.fill:parent
            onClicked:
            {

            }
        }
    }
RowLayout{
     Layout.alignment: Qt.AlignHCenter
    Text {
        id: text1
        text: qsTr("Nemate nalog?")
        font.pixelSize: 12
    }

    Text {
        id: text2
        text: qsTr("Registruj se")
        font.pixelSize: 12
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
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
