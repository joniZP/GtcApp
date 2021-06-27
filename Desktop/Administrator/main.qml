
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Events 1.0
import MLokacija 1.0

Window{
    width: 1920
    height: 1080
    visible: true
    title: qsTr("GTCAdministrator")
    property MLokacija location
    Events
    {
        id: event
    }

        function getLokacijaById(id)
        {
            let lokacijapom= ucitajInstance.getLokacija(id)
            location = lokacijapom;
        }
        function setprofile()
        {
             textlogin.text="LOGOUT";
            imeprezime.text= _profil.getIme() +" "+ _profil.getPrezime();

        }



  ColumnLayout // ----------------------------LAYOUT ZA BAR I LEVI SIDE-MENU----------------------------------------
  {
      spacing:0
      width: parent.width
      height: parent.height
    Rectangle // TOP BAR
    {

       //anchors.top : parent.top
        //Layout.alignment: top
       Layout.minimumWidth: parent.width
       Layout.minimumHeight: 50
        color:"#1b4676"
        radius:0
        Rectangle
        {
            height: parent.height
            width: 300
            anchors.right: logid.left
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            color:"transparent"
            Text {
                id: imeprezime
                text: qsTr("")
                anchors.centerIn: parent
                font.pointSize: 16
                color: "white"
                font.bold: true



            }

        }
        Rectangle //--------------------LOGIN DUGME----------------------------------
        {
            width:120
            id: logid
      //    anchors.rightMargin: 0
          anchors.right: parent.right
          //nchors.verticalCenter: parent.verticalCenter
         // anchors.baseline: parent.verticalCenter
            //width: childrenRect.width
            height: 50
            anchors.top: parent.top
            color: mouseArea.pressed ? "#003d57" : "white"
            radius:10
            scale:  mouseArea.containsMouse ? 0.6 :0.7
               smooth: mouseArea.containsMouse
               MouseArea {
                   id: mouseArea
                   anchors.fill: parent // BEZ NJEGA JE 0X0 mouseArea
                   anchors.margins: -10
                   hoverEnabled: true
                   onClicked:
                   {
                       if(textlogin.text==="LOGIN")
                       {
                       pageLoader.source="loginForm.qml"
                       }
                       else
                       {
                           imeprezime.text="";
                           textlogin.text="LOGIN";
                           pageLoader.source="loginForm.qml";
                       }
                   }
               }
        Text{
            id:textlogin
            anchors.top:parent.top
            font.bold: true
           font.family: "Helvetica"

            anchors.centerIn: parent
            text:"LOGIN"
            color: mouseArea.pressed ? "white":"#003d57"
            font.pointSize: 15
        }
        }
        /*Rectangle //--------------------REGISTRACIJA DUGME----------------------------------
        {
            width:120
            id: regid
           anchors.rightMargin: 100
          anchors.right: parent.right
          anchors.verticalCenter: parent.verticalCenter
          anchors.baseline: parent.verticalCenter
            //width: childrenRect.width
            height: childrenRect.height
            anchors.top: parent.top
            color: mArea.pressed ? "#003d57" : "white"
            radius:10
            scale:  mArea.containsMouse ? 0.6 :0.7
               smooth: mArea.containsMouse
               MouseArea {
                   id: mArea
                   anchors.fill: parent // BEZ NJEGA JE 0X0 mouseArea
                   anchors.margins: -10
                   hoverEnabled: true
                   onClicked:pageLoader.source="Registracija.qml"
               }
        Text{
            anchors.top:parent.top
            font.bold: true
           font.family: "Helvetica"


            anchors.centerIn: parent
            text:"Registracija"
            color: mouseArea.pressed ? "white":"#003d57"
            font.pointSize: 15
        }
        }*/

        }

       RowLayout //----------------- DELIMO PREOSTALI DEO ISPOD BARA NA MENU I DEO ZA PRIKAZ--------------------------
       {
           Layout.fillWidth: true
           Layout.fillHeight: true
           spacing:0
           Rectangle
           {

               Layout.minimumHeight: parent.height
               Layout.minimumWidth: parent.width/4
               color: "#1b4676"
              radius: 20
               MItem{
                   id:rect1
                   opacity: 1
                   MouseArea{
                       anchors.fill: parent

                       onClicked:
                       {
                           if(textlogin.text==="LOGOUT")
                           {
                           ucitajInstance.ucitaj()
                           pageLoader.source="prijavljeneLokacijeForm.qml"
                           }

                       }

                   }
                   x:0
                   y:0
                   w:parent.width
                   h:parent.height/6
                   txt:"PRIJAVLJENE LOKACIJE"
                   src: "../ikonice/location.png"
                   clr:parent.color
               }
               MItem{
                   MouseArea{
                       anchors.fill: parent
                       onClicked:
                       {
                           if(textlogin.text==="LOGOUT")
                           {
                           ucitajdogadjajInstance.ucitaj();
                           pageLoader.source="prijavljeniDogadjajiForm.qml"
                           }
                       }

                   }
                   x:0
                   y:parent.height/6
                   w:parent.width
                   h:parent.height/6
                   txt:"PRIJAVLJENI DOGADJAJI"
                   src: "../ikonice/event.png"
                   clr:parent.color
               }
               MItem{
                   MouseArea{
                       anchors.fill: parent
                       onClicked:
                       {
                           if(textlogin.text==="LOGOUT")
                           {
                           ucitajkomentarInstance.ucitaj();
                           pageLoader.source="prijavljeniKomentariForm.qml";
                           }
                       }

                   }

                   x:0
                   y:parent.height/6*2
                   w:parent.width
                   h:parent.height/6
                   txt:"PRIJAVLJENI KOMENTARI"
                   src: "../ikonice/comment.png"
                   clr:parent.color
               }
               MItem{
                   MouseArea{
                       anchors.fill: parent
                       onClicked:
                       {
                           if(textlogin.text==="LOGOUT")
                           {
                           ucitajInstance.ucitajOdobravanje();
                           pageLoader.source="odobriLokacijuForm.qml";
                           }
                       }

                   }

                   x:0
                   y:parent.height/6*3
                   w:parent.width
                   h:parent.height/6
                   txt:"LOKACIJE ZA ODOBRAVANJE"
                   src: "../ikonice/location.png"
                   clr:parent.color
               }


               Image {

                   id: logo
                   x:70
                   y:parent.height-(sourceSize.height/4)-50
                   source: "../ikonice/GTCLogo.png"
                   width: sourceSize.width/4
                   height:sourceSize.height/4
               }
           }
           Rectangle
           {
               Layout.fillWidth: true
               Layout.fillHeight: true
                color:"white"
                Loader
                {
                    id: pageLoader
                    anchors.centerIn: parent
                    anchors.fill: parent
                    source: "loginForm.qml"

                }
               // color: "red"
                id: prikaz1
             //  Layout.fillWidth: true
                //Layout.fillHeight: true
           }
           }
       }
  }
