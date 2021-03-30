import QtQuick 2.0

Item {
    Rectangle{
    color:"#FFFFFF"
    anchors.fill: parent
    Rectangle
    {
     anchors.centerIn: parent
    Rectangle
    {
        Text{
            color:"blue"
            font.pointSize: 15
            font.bold: true
            text: "LOGIN FORMA"
        }
        id:neki
        anchors.centerIn: parent
        color:"lightblue"
        height:400
        width:700
        Rectangle
        {
            id:username
            height: 50
            width: parent.width-100
            anchors.fill: parent
            anchors.top:parent.top
            anchors.topMargin: 100
            anchors.verticalCenter: parent.verticalCenter
            Text{
                text: proba
            }
        }

    }
    }
    }
}
