import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4

//import Sailfish.Silica 1.0 za datetime
import Qt.labs.animation 1.0
import Qt.labs.calendar 1.0
import Qt.labs.folderlistmodel 2.12
import QtQuick.Controls.Universal 2.0

Rectangle
{

    width: parent.width
    height: 300
    anchors.verticalCenter: parent.verticalCenter
    Rectangle
    {
        visible: true
        id:slika1rect
        width: 200
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        Text
        {
            id:prvaslika
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Uploadovanje prve slike")
        }
        AnimatedImage
        {
            id:uploading1
            anchors.left: prvaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
        Image
        {
            id:done1
            visible: !uploading1.visible
            anchors.left: prvaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }

    }
    Rectangle
    {
        visible: false
        id:slika2rect
        anchors.top: slika1rect.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        width: 200
        height: 50
        Text
        {
            id:drugaslika
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Uploadovanje druge slike")
        }
        AnimatedImage
        {
            id:uploading2
            anchors.left: drugaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
        Image
        {
            id:done2
            visible: !uploading2.visible
            anchors.left: drugaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
    }
    Rectangle
    {
        visible: false
        id:slika3rect
        anchors.top: slika2rect.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        width: 200
        height: 50
        Text
        {
            id:trecaslika
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Uploadovanje trece slike")
        }
        AnimatedImage
        {
            id:uploading3
            anchors.left: trecaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
        Image
        {
            id:done3
            visible: !uploading3.visible
            anchors.left: trecaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
    }
    Rectangle
    {
        visible: false
        id:slika4rect
        anchors.top: slika3rect.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        width: 200
        height: 50
        Text
        {
            id:cetvrtaslika
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Uploadovanje cetvrte slike")
        }
        AnimatedImage
        {
            id:uploading4
            anchors.left: cetvrtaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
        Image
        {
            id:done4
            visible: !uploading4.visible
            anchors.left: cetvrtaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
    }
    Rectangle
    {
        visible: false
        id:slika5rect
        anchors.top: slika4rect.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        width: 200
        height: 50
        Text
        {
            id:petaslika
            anchors.left: parent.left
            anchors.top: parent.top
            text: qsTr("Uploadovanje pete slike")
        }
        AnimatedImage
        {
            id:uploading5
            anchors.left: petaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
        Image
        {
            id:done5
            visible: !uploading5.visible
            anchors.left: petaslika.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            width: 60
            height: 30
            source: "qrc:/new/prefix1/loadingimage.gif"
        }
    }
}
