import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
//import QtGraphicalEffects 1.0
//import Events 1.0
Rectangle{
    ScrollView{
     width: 400
     height: 500
ListView {
   anchors.fill: parent

   model:_model
//model:20
    delegate: ItemDelegate {
        width: parent.width
        height: 50
        required property string slika
        required property string tekst
       required property string boja

       RowLayout
        {
            Image {
                source: slika
                Layout.maximumWidth: 50
                Layout.maximumHeight: 50
            }
            CheckBox
            {

            }

            Text {

                text: qsTr(tekst)
            }
        }

       // text: "sasa"
       }


}
}

    Rectangle{
        x:100
        width: 100
        height: 100
        color: "red"
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                event.fun2()

            }
        }
    }
    Rectangle{
        x:100
        y:120
        width: 100
        height: 100
        color: "blue"
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                event.fun3()

            }
        }
    }
}//![0]
