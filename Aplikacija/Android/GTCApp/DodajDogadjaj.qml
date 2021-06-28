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
    anchors.fill: parent

    Rectangle
    {
        color:"transparent"
        height:parent.height
        width: parent.width*0.85
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 22

        Rectangle
        {
            id: tiprect
            width: parent.width
            height: 80
            anchors.top: parent.top
            anchors.topMargin: 40
            Text
            {
                id: tiptekst
                anchors.top: parent.top
                text: "Tip dogadjaja"
                font.italic: true
                color: "#1C2EE5"
            }
            ComboBox
            {
                id: tipdogadjaja
                width: parent.width
                anchors.top: tiptekst.bottom
                anchors.topMargin: 5
                model: [ "Izlet", "Bleja", "Rostiljanje", "Basket", "Futsal", "Badminton", "Setnja pasa", "Planinarenje", "Kupanje", "Voznja bicikla", "Skijanje", "Zezanje",  ]

            }
        }
        Rectangle
        {
            id:vreme
            width: parent.width
            height: 150
            anchors.top: tiprect.bottom

            Text
            {
                id: vremedogadjaja
                anchors.top: parent.top
                anchors.topMargin: 20
                text: "Vreme dogadjaja"
                font.italic: true
                color: "#1C2EE5"

            }
            Text
            {
                id: dan
                anchors.top: vremedogadjaja.bottom
                anchors.topMargin: 10
                text: "Dan:  "
                color: "#1C2EE5"
             }
            ComboBox
            {
                id: cbxdan
                width:parent.width/3
                anchors.top: vremedogadjaja.bottom
                anchors.topMargin: 10
                anchors.left: dan.right
                anchors.leftMargin: 0
                model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",  "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" ]

            }
            Text
            {
                id: mesec
                height: cbxdan.height
                anchors.top: vremedogadjaja.bottom
                anchors.topMargin: 10
                anchors.left: cbxdan.right
                anchors.leftMargin: 5
                text: "Mesec:  "
                color: "#1C2EE5"

            }
            ComboBox
            {
                id: cbxmesec
                width:parent.width/3
                anchors.top: vremedogadjaja.bottom
                anchors.topMargin: 10
                anchors.left: mesec.right

                model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12" ]

            }
            Text
            {
                id: sati
                height: cbxdan.height
                anchors.top: cbxmesec.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                text: "Sati:  "
                color: "#1C2EE5"

            }
            ComboBox
            {
                id: cbxsat
                width:parent.width/3
                anchors.top: cbxmesec.bottom
                anchors.topMargin: 5
                anchors.left: sati.right

                model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",  "21", "22", "23", "24" ]

            }
            Text
            {
                id: minuti
                anchors.top: mesec.bottom
                height: cbxdan.height
                anchors.topMargin: 5
                anchors.left: cbxsat.right
                anchors.leftMargin: 5

                text: "Minuta:  "
                //font.italic: true
                color: "#1C2EE5"

            }
            ComboBox
            {
                id: cbxminut
                width:parent.width/3
                anchors.top: cbxmesec.bottom
                anchors.topMargin: 5
                anchors.left: minuti.right

                model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",  "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",   "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",  "51", "52", "53", "54", "55", "56", "57", "58", "59", "60" ]

            }
        }

        Rectangle//OPIS LOKACIJE
        {

            id:opisdogadjajrectangle
            anchors.top: vreme.bottom
            anchors.topMargin:20
            width: parent.width
            height: tipdogadjaja.height*2
            color: "transparent"
            border.color:"#595959"


            ScrollView
            {
                id: flickable
                width: parent.width
                height: Math.max(40,Math.min(contentHeight, 80))
                contentWidth: width

                TextArea
                {
                    id: opisdogadjaja
                    placeholderText: qsTr("Opis")
                    leftPadding: 6
                    rightPadding: 30
                    topPadding: 0
                    bottomPadding: 0
                    background: null
                    wrapMode: Text.WordWrap
                }
            }
        }


        Button
        {
            id: dugmedodajdogadjaj
            anchors.top: opisdogadjajrectangle.bottom
            anchors.topMargin: 10
            //anchors.right: parent.right
            height: 70
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            hoverEnabled: true

            text: qsTr("Dodaj dogadjaj")
            onClicked:
            {
                if(tipdogadjaja.text==="")
                {
                    tipdogadjaja.placeholderText="Unesite tip"
                    tipdogadjaja.placeholderTextColor="red"
                }
                if(opisdogadjaja.text=="")
                {
                    opisdogadjaja.placeholderText="Unesite opis"
                    opisdogadjaja.placeholderTextColor="red"
                }

                if(tipdogadjaja.text!=="" && opisdogadjaja.text!=="")
                {
                    block.visible = true;
                    let iddogadjaja = upisLokacijaDogadjaj.upisiDogadjaj(location.getId(),upisLokacijaDogadjaj.formatDate(cbxmesec.currentValue,cbxdan.currentValue,cbxsat.currentValue,cbxminut.currentValue),opisdogadjaja.text,tipdogadjaja.currentValue);
                    getDogadjajById(iddogadjaja);
                    //event.dodajdogadjaj(tipdogadjaja.text.toString(), opisdogadjaja.text.toString(), cbxdan.toString()+"."+cbxmesec.toString()+". "+cbxsat.toString()+":"+cbxminut.toString(), "")
                    pageLoader.source = "dogadjaj.qml"
                    block.visible = false;
                }
            }

            background: Rectangle
            {
                id:b
                border.width: 3
                border.color: "#6AB1F9"
                radius: 10
                color: "#2A9FF3"
            }


            onPressed:
            {
                b.color="#2775C4"
            }
            onPressedChanged:
            {
                b.color="#2A9FF3"
            }
        }
    }

}
