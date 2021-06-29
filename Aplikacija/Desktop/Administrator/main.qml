import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Events 1.0
import MLokacija 1.0

Window
{
    width: 1920
    height: 1080
    visible: true
    title: qsTr("GTCAdministrator")


    //-==[PROPERTIES]==-
    property MLokacija location
    Events
    {
        id: event
    }
    //-==[FUNCTIONS]==-
        function getLokacijaById(id)
        {
            let lokacijapom= ucitajInstance.getLokacija(id)
            location = lokacijapom;
        }
        function setprofile()
        {
             textlogin.text="LOGOUT";
            imeprezime.text= _profil.getIme() +" "+ _profil.getPrezime();
             rectprijavise.visible=false
        }

        function delay()
        {
            let i = 999999;
            for(i;i>0;i--);
        }

  ColumnLayout // -==[BAR & SIDE MENU]==-
  {
      spacing:0
      width: parent.width
      height: parent.height
    Rectangle // -==[TOP BAR]==-
    {
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
            Text
            {
                id: imeprezime
                text: qsTr("")
                anchors.centerIn: parent
                font.pointSize: 16
                color: "white"
                font.bold: true
            }
        }

        Rectangle
        {
            id: rectprijavise
            height: parent.height
            width: parent.width-120
            anchors.left: parent.left
            visible:false
            anchors.verticalCenter: parent.verticalCenter
            color:"transparent"
            Text
            {
                id: morasseprijaviti
                text: qsTr("Morate se prijaviti!")
                anchors.centerIn: parent
                font.pointSize: 16
                color: "red"
                font.bold: true
            }
        }
        Rectangle //-==[LOGIN DUGME]==-
        {
            width:120
            id: logid
          anchors.right: parent.right
            height: 50
            anchors.top: parent.top
            color: mouseArea.pressed ? "#003d57" : "white"
            radius:10
            scale:  mouseArea.containsMouse ? 0.6 :0.7
               smooth: mouseArea.containsMouse
               MouseArea
               {
                   id: mouseArea
                   anchors.fill: parent
                   anchors.margins: -10
                   hoverEnabled: true
                   onClicked:
                   {
                        block.visible=true
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
                       block.visible=false;
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
        }
       RowLayout //-==[LEFT MENU]==-
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

              Timer{
                  id:timer1
                repeat: false
                interval: 2000
                onTriggered: {
                ucitajInstance.ucitaj()
                     block.visible=false;
                }
              }

               MItem
               {
                   id:rect1
                   opacity: 1
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {

                           if(textlogin.text==="LOGOUT")
                           {

                               block.visible=true;

                               //rectprijavise.visible=false
                                timer1.start()

                              //ucitajInstance.ucitaj()
                              pageLoader.source="prijavljeneLokacijeForm.qml"

                           //  block.activeFocus = false


                           }
                           else
                           {
                                   rectprijavise.visible=true
                           }
                       }
                   }
                   x:0
                   y:0
                   w:parent.width
                   h:parent.height/8
                   txt:"PRIJAVLJENE LOKACIJE"
                   src: "../ikonice/location.png"
                   clr:parent.color
               }
               MItem
               {
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {

                           if(textlogin.text==="LOGOUT")
                           {

                               block.visible=true;

                           ucitajdogadjajInstance.ucitaj();

                               pageLoader.source="prijavljeniDogadjajiForm.qml"
                               rectprijavise.visible=false
                               block.visible=false;
                           }
                           else
                           {
                                rectprijavise.visible=true
                           }


                       }
                   }
                   x:0
                   y:parent.height/8
                   w:parent.width
                   h:parent.height/8
                   txt:"PRIJAVLJENI DOGADJAJI"
                   src: "../ikonice/event.png"
                   clr:parent.color
               }
               MItem
               {
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {

                           if(textlogin.text==="LOGOUT")
                           {
                               block.visible=true;

                           ucitajkomentarInstance.ucitaj();
                           pageLoader.source="prijavljeniKomentariForm.qml";
                               rectprijavise.visible=false
                               block.visible=false;
                           }
                           else
                           {
                                rectprijavise.visible=true
                           }

                       }
                   }
                   x:0
                   y:parent.height/8*2
                   w:parent.width
                   h:parent.height/8
                   txt:"PRIJAVLJENI KOMENTARI"
                   src: "../ikonice/comment.png"
                   clr:parent.color
               }
               MItem
               {
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {

                           if(textlogin.text==="LOGOUT")
                           {
                               block.visible=true;
                           ucitajInstance.ucitajOdobravanje();
                           pageLoader.source="odobriLokacijuForm.qml";
                                rectprijavise.visible=false
                               block.visible=false;
                           }
                           else
                           {
                               rectprijavise.visible=true
                           }

                       }
                   }
                   x:0
                   y:parent.height/8*3
                   w:parent.width
                   h:parent.height/8
                   txt:"LOKACIJE ZA ODOBRAVANJE"
                   src: "../ikonice/location.png"
                   clr:parent.color
               }

               MItem
               {
                   MouseArea
                   {
                       anchors.fill: parent
                       onClicked:
                       {

                           if(textlogin.text==="LOGOUT")
                           {
                               block.visible=true;
                           ucitajInstance.ucitajOdobravanje();
                           pageLoader.source="obrisiNalogForm.qml";
                                rectprijavise.visible=false
                               block.visible=false;
                           }
                           else
                           {
                               rectprijavise.visible=true
                           }

                       }
                   }
                   x:0
                   y:parent.height/8*4
                   w:parent.width
                   h:parent.height/8
                   txt:"BRISANJE PROFILA"
                   src: "../ikonice/location.png"
                   clr:parent.color
               }


               Image
               {
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
                id: prikaz1
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
           }
           }
       }

  Rectangle{
  id:block2

  visible: false

  height: parent.height
  width: parent.width

  color:"black"

  MouseArea
  {
    onClicked:{ mouse.accepted=true}
  }


  }

  Rectangle
  {
      id:block

      anchors.fill: parent
      visible: false

      color: "transparent"
      Rectangle
      {
      id: blockcolor
      anchors.fill: block
      color: "white"
      opacity: 0.4

      }
      AnimatedImage
      {
          source: "../ikonice/spinnerpage.gif"
          width: 150
          height: 150
          anchors.centerIn: parent
      }
      MouseArea
      {
      anchors.fill:parent
      propagateComposedEvents: false
      hoverEnabled: false
      onClicked:
      {
          console.log("SALESLALSALLASALALA")
      }

      }

  }
  }
