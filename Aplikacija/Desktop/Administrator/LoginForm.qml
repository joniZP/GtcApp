import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.0

Item {
    Rectangle{
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1f3c5e" }
          //  GradientStop { position: 0.33; color: "yellow" }
            GradientStop { position: 1.0; color: "#2970b1" }
        }
    anchors.fill: parent
    color:parent.color
    ColumnLayout
    {
       anchors.fill: parent
    ColumnLayout
    {
     Layout.alignment: Qt.AlignCenter//   anchors.fill: parent
        width:parent.width
        spacing:0

        Rectangle
        {
            color:"transparent"
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.alignment: Qt.AlignTop
            width:450
            height:50
            Text {
                id: textiznad
                anchors.centerIn: parent
                text:"PRIJAVA NA SISTEM"
                font.pixelSize: 20
                font.bold: true
                color:"white"
            }
        }

        Rectangle{
            color: "transparent"
            height:170
            width:450
            Layout.alignment:Qt.AlignCenter
            ColumnLayout
            {
                spacing:0
              TextField{
                  Image
                  {
                      id:usericon
                      height:20
                      width:20
                      source: "../new/prefix1/user.png"
                      anchors.left: parent.left
                      anchors.leftMargin: 10
                      anchors.verticalCenter: parent.verticalCenter
                      opacity:0.4
                  }
                   placeholderText: "username"
                   leftPadding: 40
                   topPadding: 20
                    font.pointSize: 40
                   Layout.preferredHeight: 50
                   Layout.preferredWidth: 450
                    Layout.alignment: AlignTop
                }
                TextField{
                    Image
                    {
                        id:passicon
                        height:20
                        width:20
                        source: "../new/prefix1/lock.png"
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                         anchors.verticalCenter: parent.verticalCenter
                        opacity:0.4
                    }
                  placeholderText: "password"
                  leftPadding: 40
                  topPadding: 20
                  font.pointSize: 40
                  Layout.preferredHeight: 50
                  Layout.preferredWidth: 450
                    Layout.alignment: AlignVCenter
                }
                   Rectangle
                   {
                       Layout.preferredHeight: 50
                       Layout.preferredWidth: 450
                       Layout.alignment: AlignBottom
                       color: buttonce.pressed ? "#1b4676":"#1e9ad9"
                       MouseArea{
                           id:buttonce
                           anchors.fill: parent
                           hoverEnabled: true
                       }

                    Text{
                        anchors.centerIn: parent
                        text:"LOGIN"
                        color:"white"
                        font.pointSize: 10
                        font.bold: true
                    }

                }
                Rectangle//Registrujte se
                   {
                       color: "transparent"
                       Layout.preferredHeight: 20
                       Layout.preferredWidth: 450
                       Layout.alignment: AlignBottom



                        /*Rectangle//i send na registraciju
                        {
                            Layout.preferredHeight: 20
                            Layout.preferredWidth: 100
                            anchors.rightMargin:parent*/


                    Text{
                        topPadding:10
                        anchors.centerIn: parent
                        text:"Niste registrovani? Registruj se"
                        color:"white"
                        font.pointSize: 10
                        font.bold: false
                        MouseArea{
                            id:dugmereg
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked:
                            {
                                pageLoader.source="Registracija.qml"
                            }

                        }
                        }

                    //}
            }

        }
    }
    }
    }
}}
