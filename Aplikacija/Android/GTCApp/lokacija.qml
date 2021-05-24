import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
Rectangle {
    id:par
anchors.fill: parent
Flickable{
//  contentHeight: 800
 anchors.fill: parent
 boundsBehavior: Flickable.StopAtBounds
 contentWidth: parent.width
 contentHeight: slider.height+hhh.height
 clip: true
SwipeView{
     id:slider
     anchors.top: parent.top
     anchors.topMargin:verticalMargin
     height: par.height/2.3
     width: parent.width
     x:(parent.width-width)/2
     property var model :ListModel{}
     clip:true
     Repeater {
         model:_model
         Image{
             id:slikalokacija
            width: slider.width
            height: slider.height
            source:slika
            fillMode: Image.Stretch

         }

     }
  }
PageIndicator {
   anchors.bottom: slider.bottom
  // anchors.topMargin: verticalMargin
   anchors.horizontalCenter: parent.horizontalCenter
   currentIndex: slider.currentIndex
   count: slider.count
}
Rectangle
{
    id:hhh
    anchors.top: slider.bottom
    color: "blue"
    width: parent.width
    height: 1000
    Button
    {
        width: 100
        height: 50
        onClicked: draw.open()
    }
}
}
Drawer
{
    id: draw
    //interactive: false
    width:parent.width
    dragMargin: 0
    height: parent.height/5*4
    edge: Qt.BottomEdge
    Rectangle
    {
        anchors.fill: parent
   Rectangle
   {
       id:koment
       width: parent.width
       height: parent.height-flickable.height
       ScrollView
       {
          anchors.fill: parent

       ListView
       {
           boundsBehavior: ListView.StopAtBounds
           anchors.fill: parent
           clip: true
           model: _kommodel
           spacing: 10
           delegate:ItemDelegate
           {
               required property string slika
               required property string tekst
               required property string ime
               width:parent.width
               height: tex.implicitHeight+tex0.implicitHeight+20
                    Image
                    {
                           id: img11
                           source: slika
                           //anchors.verticalCenter: parent.verticalCenter
                           width: 30
                           height: 30
                           fillMode: Image.PreserveAspectCrop
                           layer.enabled: true
                           //layer.effect: OpacityMask {
                           //    maskSource: mask
                           //}
                    }
                    Rectangle {
                     anchors.leftMargin: 10
                      id: roundRect
                      radius: 10
                      color: "#ede7e6"

                      width: parent.width-50
                      height: tex.implicitHeight+tex0.implicitHeight+10
                      anchors.left: img11.right
                      Text {
                          font.bold:true
                          topPadding: 5
                          leftPadding: 10
                          id: tex0
                          text: qsTr(ime)
                      }
                    Text {
                         anchors.top: tex0.bottom
                         topPadding: 5
                         anchors.leftMargin: 30
                         leftPadding: 10
                         width: parent.width-20
                         id:tex
                         clip: true
                         wrapMode: Text.Wrap
                         text: qsTr(tekst)
                    }
                    }


           }
       }
   }
   }
   Rectangle
   {
       id: komentarunos
       anchors.top: koment.bottom
       width: parent.width
       height: parent.height/10
       //color: "red"

       ScrollView {
           id: flickable
           width: parent.width
           height: Math.max(40,Math.min(contentHeight, 60))
           contentWidth: width
           contentHeight: komentartext1.implicitHeight
           background: Rectangle {
               anchors.fill: parent
               border.color: "gray"
               radius: 5

           }
           TextArea {
                 id: komentartext1
                      leftPadding: 6
                      rightPadding: 30
                      topPadding: 0
                      bottomPadding: 0
                      background: null

                      wrapMode: Text.WordWrap

           }
       }

       Button{

           width: 30
           height: 30
           anchors.right:flickable.right
           anchors.verticalCenter: flickable.verticalCenter
           onClicked:
           {
               //if(komentartext1.text)
                  // var regExp = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                   //if(!regExp.test(email.text))
               var string = event.dodajkomentar(komentartext1.text,"jjjj");
               komentartext1.remove(0,komentartext1.length)
           }
       background:Image {
           anchors.fill: parent
           id: send
           source: "/new/prefix1/pngkit_send-icon-png_1882365.png"


       }
       }

   }

   }
}

}

