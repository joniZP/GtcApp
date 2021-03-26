import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
Window {
    width: 450
    height: 300
    visible: true
    //color: "blue"
  title: qsTr("GTCAdministrator")

    ColumnLayout
    {
        width: parent.width
        height : parent.height
       spacing: 0

    Rectangle
    {
        Layout.minimumHeight: 50
        Layout.minimumWidth: parent.width
        color:"#549cff"
        Image {
            id:img
            x:0
            y: 0
            source: "/new/prefix1/dropdown-menu-icon-20.jpg"
            clip: false
            width:50
            height: 50
            MouseArea //:/new/icons/C:/Users/Petar/Downloads/dropdown-menu-icon-20.jpg
            {
                anchors.fill: parent
                onClicked: crtaj.open()
            }
       }
        Image {
            id:img2
            x:parent.width-50
            y: 0
          // source: "../../Downloads/computer-icons-mobile-app-development-android-my-account-icon-ee5ed773331f0106436a0580fb3bce05.png"
            width:50
            height: 50
    }
    }
    Rectangle
    {
        Layout.fillWidth: true
        Layout.fillHeight: true
        color:"#f9f8f8"

    }


    Drawer
    {
     id: crtaj
    width: 350
    height: parent.height

    Rectangle
    {
        anchors.fill: parent
        color : "#549cff"
        opacity: 0.6
       MItem{
          //  clr: "#ff00ff"
            id: dugme1
            w: parent.width
            h: 40
            src:"/new/prefix1/dropdown-menu-icon-20.jpg"
            txt: "Dodaj lokaciju"
        }
        }
    }
    }
}
