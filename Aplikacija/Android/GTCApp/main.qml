import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
ApplicationWindow
{
    visible: true
    width: 300
    height: 500
    title: qsTr("Hello World")
    objectName: "radis li be"
    //Material.theme: Material.LightBlue
    //Material.accent: Material.DeepOrange
    property Sbutt pom
    
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
            height: 40
            Layout.minimumWidth: parent.width
            Layout.maximumWidth: parent.width
            color: "#66a3ff"
            RowLayout
            {
                // @disable-check M16
                height: parent.height
                Rectangle
                {
                    Image
                    {
                        id: name
                        source: "/new/prefix1/list.png"
                        anchors.fill: parent
                    }
                    width: 30
                    height: 30
                    color: "#66a3ff"
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
            }
        }


        Rectangle
        {
            Loader
            {
                id: pageLoader
                anchors.centerIn: parent
                anchors.fill: parent
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
            color: "#ffffff"
            height: parent.height
            width: parent.width
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
                            //console.log( men.fun1(dugme))
                            pageLoader.source = "prvi.qml"
                            if(pom!=null)
                            {
                                 pom.color_="#ffffff"
                            }
                            dugme.color_="#123456"
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
                        dugme1.color_="#123456"
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
                            dugme2.color_="#123456"
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
                            dugme3.color_="#123456"
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
