import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
Rectangle
{
    color: "#121177"
    id: prikaz4
    Button
    {
        width: 100
        height: 30

        onClicked:
        {
            fileDialog.open()
        }
    }
    Image {
        id: profilnaslika
        width:300
        height: 300
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted:
        {
            console.log("You chose: " + fileDialog.fileUrls)
            profilnaslika.source=fileDialog.fileUrl
            event.upload(fileDialog.fileUrl)
        }
        onRejected:
        {
            console.log("Canceled")
        }

    }
}
