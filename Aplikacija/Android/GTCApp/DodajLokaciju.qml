import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import QtQuick.Dialogs 1.0
import QtPositioning 5.6
import QtLocation 5.6


Rectangle
{
    property int slike: 0
    Flickable
    {
        //  contentHeight: 800
        id:flick
        anchors.fill: parent
        boundsBehavior: Flickable.StopAtBounds
        contentWidth: parent.width
        contentHeight:700
        clip: true
        Rectangle
        {
            gradient: Gradient
            {
                GradientStop{position:0.0; color:"#2A9FF3"}
                GradientStop{position:1.0; color:"white"}
            }
            anchors.fill:parent
            id: glavni
            Rectangle
            {
                color:"transparent"
                height:parent.height
                width: parent.width/5*4
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                TextField
                {
                    id: nazivnovelokacije
                    placeholderText: qsTr("Naziv nove lokacije")
                    anchors.top: parent.top
                    anchors.topMargin: 40
                    width:parent.width
                }
                ComboBox
                {
                    id: gradnovelokacije
                    anchors.top: nazivnovelokacije.bottom
                    anchors.topMargin: 10
                    width:parent.width
                    model: _mestomodel
                    textRole: "mesto"
                }
                ComboBox
                {
                    id: kategorijanovelokacije
                    anchors.top: gradnovelokacije.bottom
                    anchors.topMargin: 10
                    width:parent.width
                    model: _katmodel
                    textRole: "kategorija"
                }
                Rectangle//OPIS LOKACIJE
                {
                    id:opisrectangle
                    anchors.top: kategorijanovelokacije.bottom
                    anchors.topMargin: 10
                    width: parent.width
                    height: gradnovelokacije.height*4/2
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
                            id: opisnovelokacije
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
                Rectangle
                {
                    id:slikarectangle
                    anchors.top: opisrectangle.bottom
                    anchors.topMargin: 10
                    width: parent.width
                    height:parent.width/5
                    color: "transparent"
                    border.color:"#595959"
                    Image
                    {
                        id: slika1
                        anchors.left:slikarectangle.left
                        width: parent.height
                        height: parent.height
                        source:"../new/prefix1/addimage2.png"
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                if(slike==0)
                                {
                                    fileDialog.open()
                                }
                            }
                        }
                    }
                    Image
                    {
                        id: slika2
                        anchors.left:slika1.right
                        width: parent.height
                        height: parent.height
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                if(slike==1)
                                {
                                    fileDialog.open()
                                }
                            }
                        }
                    }
                    Image
                    {
                        id: slika3
                        anchors.left:slika2.right
                        width: parent.height
                        height: parent.height
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                if(slike==2)
                                {
                                    fileDialog.open()
                                }
                            }
                        }
                    }
                    Image
                    {
                        id: slika4
                        anchors.left:slika3.right
                        width: parent.height
                        height: parent.height
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                if(slike==3)
                                {
                                    fileDialog.open()
                                }
                            }
                        }
                    }
                    Image
                    {
                        id: slika5
                        anchors.left:slika4.right
                        width: parent.height
                        height: parent.height
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                if(slike==4)
                                {
                                    fileDialog.open()
                                }
                            }
                        }
                    }
                }
                FileDialog
                {
                    id: fileDialog
                    title: "Please choose a file"
                    folder: shortcuts.home
                    onAccepted:
                    {
                        console.log("You chose: " + fileDialog.fileUrls)
                        if(slike==0)
                        {
                            slika1.source=fileDialog.fileUrl
                            slika2.source="../new/prefix1/addimage2.png"
                            slike++
                        }
                        else if(slike==1)
                        {
                            slika2.source=fileDialog.fileUrl
                            slika3.source="../new/prefix1/addimage2.png"
                            slike++
                        }
                        else if(slike==2)
                        {
                            slika3.source=fileDialog.fileUrl
                            slika4.source="../new/prefix1/addimage2.png"
                            slike++
                        }
                        else if(slike==3)
                        {
                            slika4.source=fileDialog.fileUrl
                            slika5.source="../new/prefix1/addimage2.png"
                            slike++
                        }
                        else if(slike==4)
                        {
                            slika5.source=fileDialog.fileUrl
                            slike++
                        }
                        upisLokacijaDogadjaj.dodajSliku(fileDialog.fileUrl);
                    }
                    onRejected:
                    {
                        console.log("Canceled")
                    }

                }
                Rectangle
                {
                    id:maparectangle
                    anchors.top: slikarectangle .bottom
                    anchors.topMargin: 10
                    width: parent.width
                    height:200
                    border.color:"#595959"
                    Plugin
                    {
                        id: mapPlugin
                        name: "osm"
                    }
                    Map
                    {
                        id:mapa
                        anchors.fill: parent
                        plugin: mapPlugin
                        center: QtPositioning.coordinate(location.getX(),location.getY())
                        zoomLevel: 14
                        MapQuickItem
                        {
                            id: marker
                            anchorPoint.x: image.width/4
                            anchorPoint.y: image.height
                            coordinate: QtPositioning.coordinate(location.getX(),location.getY());
                            sourceItem: Image
                            {
                                id: image
                                source: "qrc:/new/prefix1/pin.png"
                                width: 20
                                height: 20
                            }

                        }
                        Component.onCompleted:
                        {
                            var coord = src.position.coordinate;
                            console.log("Coordinate:", coord.longitude, coord.latitude)
                            marker.coordinate= QtPositioning.coordinate(coord.latitude,coord.longitude);
                            mapa.center= QtPositioning.coordinate(coord.latitude,coord.longitude)
                            if(coord.latitude && coord.longitude)
                            {
                                upisLokacijaDogadjaj.setCoo(coord.latitude,coord.longitude)
                            }

                            upisLokacijaDogadjaj.setCoo(0,0)
                        }
                    }
                }
                PositionSource
                {
                    id: src
                    updateInterval: 1000
                    active: true
                    /* onPositionChanged:
                    {
                    var coord = src.position.coordinate;
                    console.log("Coordinate:", coord.longitude, coord.latitude)
                    marker.coordinate= QtPositioning.coordinate(coord.latitude,coord.longitude);
                    mapa.center= QtPositioning.coordinate(coord.latitude,coord.longitude)
                    upisservis.setCoo(coord.latitude,coord.longitude)
                    }*/
                }
                Button
                {
                    id: dugmedodajlokaciju
                    anchors.top: maparectangle.bottom
                    anchors.topMargin: 17
                    height: parent.height/8
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Dodaj lokaciju")
                    hoverEnabled: true
                    background: Rectangle
                    {
                        id:bekgraund
                        border.width: 3
                        border.color: "#6AB1F9"
                        radius: 9
                        color: "#2A9FF3"
                    }
                    onPressed:
                    {
                        bekgraund.color="#2775C4"
                    }
                    onPressedChanged:
                    {
                        bekgraund.color="#2A9FF3"
                    }
                    onClicked:
                    {
                        if(nazivnovelokacije.text=="")
                        {
                            nazivnovelokacije.placeholderText="Unesite naziv"
                            nazivnovelokacije.placeholderTextColor="red"
                        }

                        if(opisnovelokacije.text=="")
                        {
                            opisnovelokacije.placeholderText="Opis";
                            opisnovelokacije.placeholderTextColor="red"
                        }
                        if(nazivnovelokacije.text!="" && gradnovelokacije.currentText!=""&&kategorijanovelokacije.currentText!="" && opisnovelokacije.text!="")
                        {
                            block.visible = true;
                            const lokid = upisLokacijaDogadjaj.upisiLokaciju(nazivnovelokacije.text,kategorijanovelokacije.currentText,gradnovelokacije.currentText,opisnovelokacije.text);
                            upisLokacijaDogadjaj.removeAllPictrures();
                            if(lokid !== -1)
                            {
                                getLokacijaById(lokid);
                                natpis="Lokacija"
                                pageLoader.source= "lokacija.qml"
                            }
                            block.visible = false;
                        }
                    }
                }
            }
        }
    }
}
