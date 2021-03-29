import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import QtGraphicalEffects 1.0
import Events 1.0
ApplicationWindow
{
    visible: true
    width: 300
    height: 500
    title: qsTr("Hello World")
    objectName: "radis li be"
    //Material.theme: Material.LightBlue
    //Material.accent: Material.DeepOrange
    property Sbutt pom:pocetna
   Events
   {
       id: event
   }
   ColumnLayout
    {
        // @disable-check M16
        width: parent.width
        // @disable-check M16
        height: parent.height
        spacing: 0
        Rectangle
        {
            Layout.alignment: Qt.AlignTop
            id: o
            // @disable-check M16
            objectName: "objname"
            width: parent.width
            height: 50
            Layout.minimumWidth: parent.width
            Layout.maximumWidth: parent.width
            color: "#549cff"
            RowLayout
            {
                // @disable-check M16
                height: parent.height
                width: parent.width
                Rectangle
                {
                    id:iddd
                    Image
                    {
                        id: nam
                        source: "/new/prefix1/dropdown-menu-icon-20.jpg"
                        anchors.fill: parent
                    }
                    width: 40
                    height: 40
                    color: "#549cff"
                    Layout.leftMargin:10
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            drawer.open()
                        }
                    }
                }
                Text {
                    id: iii
                    text: pom.tex
                    color: "#ffffff"
                    font.family: "Helvetica"
                    font.pointSize: 18
                    anchors.left: iddd.right
                    anchors.leftMargin: 20

                }
                Rectangle
                {
                    Layout.alignment: Qt.AlignRight
                    Layout.rightMargin: 10
                    Image
                    {
                        id: namje
                        source: "/new/prefix1/search-3-24.png"
                        anchors.fill: parent
                    }
                    width: 25
                    height: 25
                    color: "#549cff"
                   // Layout.leftMargin:100

            }
            }
        }


        Rectangle
        {
            Loader
            {
                id: pageLoader
                anchors.centerIn: parent
                anchors.fill: parent
                source: "pocetna.qml"

            }
            color: "red"
            id: prikaz1
            Layout.fillWidth: true
            Layout.fillHeight: true

        }
    }
    Drawer
    {
        id: drawer
        width: 0.66 * parent.width
        height: parent.height
        Rectangle
        {
            id:qqq
            anchors.fill: parent
            color: "#878682"
        ColumnLayout
        {
            spacing: 1
            anchors.fill: parent

            Rectangle
            {
                Layout.minimumWidth: parent.width
                Layout.minimumHeight: 150
                color:"#66a3ff"
                ColumnLayout
                {
                    width:parent.width
                    spacing: 0
                    RowLayout
                    {
                        id: roo
                        width:parent.width
                Image
                {
                       id: img
                       source: "/new/prefix1/person-icon.png"
                       Layout.topMargin: 20
                       Layout.leftMargin: 10
                       //anchors.verticalCenter: parent.verticalCenter
                       Layout.maximumWidth: 60
                       Layout.maximumHeight: 60
                       width: 50
                       height: 50
                       fillMode: Image.PreserveAspectCrop
                       layer.enabled: true
                       layer.effect: OpacityMask {
                           maskSource: mask
                       }
                }

                Rectangle {
                       Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#00000000"
                       id:aaaa
                       Rectangle
                       {
                           width: childrenRect.width
                           height: childrenRect.height
                           anchors.top: parent.top

                            color: "#00000000"
                           MouseArea
                           {
                               anchors.fill: parent
                               onClicked:
                               {
                                  event.fun(parent)
                               }

                           }

                           anchors.right: parent.right
                           anchors.rightMargin: 20
                       Text {
                           id: iiidi
                           text: qsTr("Login")
                            anchors.left: parent.left
                           color: "#ffffff"
                            anchors.verticalCenter: parent.verticalCenter


                       }
                       Text {
                           id: iiijl
                           text: qsTr("  >")
                           anchors.left: iiidi.right
                          // anchors.rightMargin: 20
                           color: "#ffffff"
                           anchors.verticalCenter: iiidi.verticalCenter
                           //font.family: "Helvetica"
                           font.pointSize: 30



                       }
                       }
                   }


                 }
                Text {

                    id: id_ime
                    text: qsTr("Sasa Stojiljkovic")
                    color: "#ffffff"
                     font.pointSize: 20
                     Layout.leftMargin: 10
                      Layout.topMargin: 10


                }
                Text {
                        text: "sgssasa@gmail.com"
                        font.family: "Helvetica"
                        font.pointSize: 14
                        color: "#d6d3cb"
                         Layout.leftMargin: 10
                         Layout.topMargin:0

                }
                   }

                   Rectangle {
                       id: mask
                       width: 50
                       height: 50
                       radius: 30
                       visible: false
                   }
            }

        Rectangle
        {
            color: "#ffffff"
            Layout.fillHeight: true
            Layout.minimumWidth: parent.width
            Column
            {
                width: parent.width
                Sbutt
                {
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            // console.log( men.fun1(dugme1))
                            if(pom!=null)
                            {
                                pom.color_="#ffffff"
                            }
                        pocetna.color_="#d9d7d2"
                        pom=pocetna
                        pageLoader.source = "pocetna.qml"
                        drawer.close()
                        }
                   }
                    id: pocetna
                    widt: parent.width
                    heigh: 40
                    sourc: "/new/prefix1/list.png"
                    tex: "Pocetna"
                }
                Sbutt
                {
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            //console.log( men.fun1(dugme))
                            pageLoader.source = "prvi.qml"
                            if(pom!=null)
                            {
                                 pom.color_="#ffffff"
                            }
                            dugme.color_="#d9d7d2"
                            pom=dugme
                            drawer.close()
                        }
                    }
                    id: dugme
                    widt: parent.width
                    heigh: 40
                    sourc: "/new/prefix1/list.png"
                    tex: "Pretrazi lokacije"
                }
                Sbutt
                {
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            // console.log( men.fun1(dugme1))
                            if(pom!=null)
                            {
                                pom.color_="#ffffff"
                            }
                        dugme1.color_="#d9d7d2"
                        pom=dugme1
                        pageLoader.source = "drugi.qml"
                        drawer.close()
                        }
                   }
                    id: dugme1
                    widt: parent.width
                    heigh: 40
                    sourc: "/new/prefix1/list.png"
                    tex: "Dodaj lokaciju"
                }
                Sbutt
                {
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            // console.log( men.fun1(dugme2))
                            if(pom!=null)
                            {
                                pom.color_="#ffffff"
                            }
                            dugme2.color_="#d9d7d2"
                            pom=dugme2
                            pageLoader.source = "treci.qml"
                            drawer.close()
                        }
                    }
                    id: dugme2
                    widt: parent.width
                    heigh: 40
                    sourc: "/new/prefix1/list.png"
                    tex: "Dodaj dogadjaj"

               }
               Sbutt
               {
                   MouseArea
                   {
                        anchors.fill: parent
                        onClicked:
                        {
                            //console.log( men.fun1(dugme3))
                            if(pom!=null)
                            {
                                pom.color_="#ffffff"
                            }
                            dugme3.color_="#d9d7d2"
                            pom=dugme3
                            pageLoader.source = "cetvrti.qml"
                            drawer.close()
                        }
                    }
                    id: dugme3
                    widt: parent.width
                    heigh: 40
                    sourc: "/new/prefix1/list.png"
                    tex: "Podesavanja"
               }
           }
       }
   }
        }
}
}
