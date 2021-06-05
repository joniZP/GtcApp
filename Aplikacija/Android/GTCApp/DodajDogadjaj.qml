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


Rectangle{

    Flickable{
    //  contentHeight: 800
        id:flick
     anchors.fill: parent
     boundsBehavior: Flickable.StopAtBounds
     contentWidth: parent.width
     contentHeight: 800
     clip: true

Rectangle
    {

        gradient: Gradient{
        GradientStop{position:0.0; color:"#2A9FF3"}
         GradientStop{position:1.0; color:"white"}
        }
    anchors.fill:parent
    color:parent.color
    id: glavni
    }
    Rectangle{
        color:"transparent"
     //height: Math.min(nazivnovelokacije.height+opisnovelokacije.height+gradnovelokacije.height+40, nazivnovelokacije.height+nazivnovelokacije.height+gradnovelokacije.height+40+40)
        height: 50+10+nebtext1.height+ 5+nebtext.height+ tipdogadjaja.height+20+10+dugmedodajnovulokaciju.height+10+rectanglelokacijeizbor.height+opisdogadjajrectangle.height
        width: parent.width/5*4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: 22

        Text{
            id: nebtext
            width:parent.width
            anchors.top: parent.top
            anchors.topMargin: 40
            text: "Tip dogadjaja"
           font.italic: true
           color: "#1C2EE5"

        }
        ComboBox {
            id: tipdogadjaja
            width:parent.width
            anchors.top: nebtext.bottom
            anchors.topMargin: 5
            model: [ "Izlet", "Bleja", "Rostiljanje", "Basket", "Futsal", "Badminton", "Setnja pasa", "Planinarenje", "Kupanje", "Voznja bicikla", "Skijanje", "Zezanje",  ]

        }

        Text{
            id: nebtext1
            width:parent.width
            anchors.top: tipdogadjaja.bottom
            anchors.topMargin: 20
            text: "Vreme dogadjaja"
           font.italic: true
           color: "#1C2EE5"

        }
        Text{
            id: nebtext2
            width:parent.width/6-10
            height: cbxdan.height
            anchors.top: nebtext1.bottom
            anchors.topMargin: 5


            text: "Dan:"
           //font.italic: true
           color: "#1C2EE5"
        }
        ComboBox {
            id: cbxdan
            width:parent.width/3
            anchors.top: nebtext1.bottom
            anchors.topMargin: 5
            anchors.left: nebtext2.right
            anchors.leftMargin: 0
            model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",  "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" ]

        }
        Text{
            id: nebtext3
            width:parent.width/6
            height: cbxdan.height
            anchors.top: nebtext1.bottom
            anchors.topMargin: 5
            anchors.left: cbxdan.right

            text: "Mesec:"
           //font.italic: true
           color: "#1C2EE5"

        }
        ComboBox {
            id: cbxmesec
            width:parent.width/3
            anchors.top: nebtext1.bottom
            anchors.topMargin: 5
            anchors.left: nebtext3.right

            model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12" ]

        }
        Text{
            id: nebtext4
            width:parent.width/6-10
            height: cbxdan.height
            anchors.top: nebtext2.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            text: "Sati:"
           //font.italic: true
           color: "#1C2EE5"

        }
        ComboBox {
            id: cbxsat
            width:parent.width/3
            anchors.top: cbxmesec.bottom
            anchors.topMargin: 5
            anchors.left: nebtext4.right

            model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",  "21", "22", "23", "24" ]

        }
        Text{
            id: nebtext5
            width:parent.width/6
            anchors.top: nebtext3.bottom
            height: cbxdan.height
            anchors.topMargin: 5
            anchors.left: cbxsat.right

            text: "Minuta:"
           //font.italic: true
           color: "#1C2EE5"

        }
        ComboBox {
            id: cbxminut
            width:parent.width/3
            anchors.top: cbxmesec.bottom
            anchors.topMargin: 5
            anchors.left: nebtext5.right

            model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",  "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",   "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",  "51", "52", "53", "54", "55", "56", "57", "58", "59", "60" ]

        }



        Rectangle{//listview lokacije
            anchors.top: nebtext5.bottom
            anchors.topMargin: 30
            id:rectanglelokacijeizbor
            height:parent.height*0.4
            width:parent.width
            color:"#6E79ED"

            ScrollView{
             width: parent.width
             height: parent.height

        ListView {
            boundsBehavior: ListView.StopAtBounds
            clip:true
            anchors.fill: parent
            width: parent.width
            height: parent.height
            model:_model
            delegate: ItemDelegate {
                width: rectanglelokacijeizbor.width
                height: rectanglelokacijeizbor.height/4
                required property string slika
                required property string tekst
                required property string boja

               RowLayout
                {
                    anchors.fill:parent
                    Image {
                        id:lokacijaimage
                        source: "qrc:/new/prefix1/star.png"
                        Layout.preferredWidth: parent.height/2
                        Layout.preferredHeight: parent.height/2
                    }
                    Text {
                        id:nazivlokacijeprofil
                        text: qsTr("Naziv")
                    }

                    Text {
                        id:opislokacije
                        text: qsTr("Opis lokacije iz baze procitan")
                    }
                    MouseArea{
                        id:mouseareaprofillokacija
                     anchors.fill:parent
                     onPressed: {
                         lokacijaimage.opacity=0.5
                     }
                     onExited: {
                         lokacijaimage.opacity=1
                     }

                     onClicked: {
                                event.dodajlokacijudogadjaju(nazivlokacijeprofil.text.toString())
                                //pageLoader.source= "registracija.qml"
                     }

                    }
                }//mouse

               }//row
             }//list
             }//scroll
        }//rect

        Button{
            id: dugmedodajnovulokaciju
            anchors.top: rectanglelokacijeizbor.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            height: 70
            width: parent.width/2
            //anchors.horizontalCenter: parent.horizontalCenter
            hoverEnabled: true

            text: qsTr("Dodaj novu\n lokaciju")
            onClicked:
            {
                 //event.setpom(1);
                 pageLoader.source = "DodajLokaciju.qml"
            }
                    background: Rectangle {
                        id:be
                        border.width: 3
                        border.color: "#6AB1F9"
                        radius: 10
                        color: "#2A9FF3"
                    }

                    onPressed:
                    {
                         be.color="#2775C4"

                    }
                    onPressedChanged: {
                         be.color="#2A9FF3"
                    }


            /*onHoveredChanged:
            {
                if(hovered==true){
                be.color="#2775C4"
                }
                else
                {
                     be.color="#2A9FF3"
                }
            }*/
        }

        Rectangle//OPIS LOKACIJE
        {

            id:opisdogadjajrectangle
            anchors.top: dugmedodajnovulokaciju.bottom
            anchors.topMargin:20
            width: parent.width
            height: tipdogadjaja.height*2
            color: "transparent"
            border.color:"#595959"


            ScrollView {
                id: flickable
                width: parent.width
                height: Math.max(40,Math.min(contentHeight, 80))
                contentWidth: width

                TextArea {
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


        Button{
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

                if(tipdogadjaja.text!=="" && opisdogadjaja.text!==""){


               event.dodajdogadjaj(tipdogadjaja.text.toString(), opisdogadjaja.text.toString(), cbxdan.toString()+"."+cbxmesec.toString()+". "+cbxsat.toString()+":"+cbxminut.toString(), "")
                 //pageLoader.source = "DodajLokaciju.qml"
            }
            }

                    background: Rectangle {
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
                    onPressedChanged: {
                         b.color="#2A9FF3"
                    }
        }





        //////DATETIME PICKER
        /*ListView {
            id: root
            anchors.top: opisdogadjajrectangle.bottom

         // public
            function set(date) { // new Date(2019, 10 - 1, 4)
                selectedDate = new Date(date)
                positionViewAtIndex((selectedDate.getFullYear()) * 12 + selectedDate.getMonth(), ListView.Center) // index from month year
            }

            signal clicked(date date);  // onClicked: print('onClicked', date.toDateString())

         // private
            property date selectedDate: new Date()

            width: 500;  height: 100 // default size
            snapMode:    ListView.SnapOneItem
            orientation: Qt.Horizontal
            clip:        true

            model: 3000 * 12 // index == months since January of the year 0

            delegate: Item {
                property int year:      Math.floor(index / 12)
                property int month:     index % 12 // 0 January
                property int firstDay:  new Date(year, month, 1).getDay() // 0 Sunday to 6 Saturday

                width: root.width;  height: root.height

                Column {
                    Item { // month year header
                        width: root.width;  height: root.height - grid.height

                        Text { // month year
                            anchors.centerIn: parent
                            text: ['January', 'February', 'March', 'April', 'May', 'June',
                                   'July', 'August', 'September', 'October', 'November', 'December'][month] + ' ' + year
                            font {pixelSize: 0.5 * grid.cellHeight}
                        }
                    }

                    Grid { // 1 month calender
                        id: grid

                        width: root.width;  height: 0.875 * root.height
                        property real cellWidth:  width  / columns;
                        property real cellHeight: height / rows // width and height of each cell in the grid.

                        columns: 7 // days
                        rows:    7

                        Repeater {
                            model: grid.columns * grid.rows // 49 cells per month

                            delegate: Rectangle { // index is 0 to 48
                                property int day:  index - 7 // 0 = top left below Sunday (-7 to 41)
                                property int date: day - firstDay + 1 // 1-31

                                width: grid.cellWidth;  height: grid.cellHeight
                                border.width: 0.3 * radius
                                border.color: new Date(year, month, date).toDateString() == selectedDate.toDateString()  &&  text.text  &&  day >= 0?
                                              'black': 'transparent' // selected
                                radius: 0.02 * root.height
                                opacity: !mouseArea.pressed? 1: 0.3  //  pressed state

                                Text {
                                    id: text

                                    anchors.centerIn: parent
                                    font.pixelSize: 0.5 * parent.height
                                    font.bold:      new Date(year, month, date).toDateString() == new Date().toDateString() // today
                                    text: {
                                        if(day < 0)                                               ['S', 'M', 'T', 'W', 'T', 'F', 'S'][index] // Su-Sa
                                        else if(new Date(year, month, date).getMonth() == month)  date // 1-31
                                        else                                                      ''
                                    }
                                }

                                MouseArea {
                                    id: mouseArea

                                    anchors.fill: parent
                                    enabled:    text.text  &&  day >= 0

                                    onClicked: {
                                        selectedDate = new Date(year, month, date)
                                        root.clicked(selectedDate)
                                    }
                                }
                            }
                        }
                    }
                }
            }

             // Component.onCompleted: set(new Date()) // today (otherwise Jan 0000)
        }*/




    }

  }

}
