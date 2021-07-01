
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import QtLocation 5.6
import QtPositioning 5.6
import QtGraphicalEffects 1.12
//import QtWebView 1.1
import MLokacija 1.0
import QtQuick.Controls.Styles 1.4
Rectangle
{

    function funkcija()
    {
        var id= upisLokacijaDogadjaj.azurirajDogadjaj(mDogadjaj.getId(),upisLokacijaDogadjaj.formatDate(cbxmesec.currentValue,cbxdan.currentValue,cbxsat.currentValue,cbxminut.currentValue), opisdogadjajaizmena.text,tipdogadjajaizmena.currentText);
        console.log(cbxsat.currentValue)
         console.log(cbxsat.currentText)
          console.log(cbxsat.currentIndex)
    }

    id:dogadjajglavnirect
    anchors.fill: parent
    color: "#d3d3d3"

    Connections
    {
       target: glavnastranica
        onIzmeniDogadjajsignal:
        {
            izmena.visible=true
            console.log("stigosignal")
        }
    }
    Flickable
    {
     anchors.fill: parent
     boundsBehavior: Flickable.StopAtBounds
     contentWidth: parent.width
     contentHeight: hederrect.height
     clip: true
Rectangle
{
     id: hederrect
    color: "#d3d3d3"
    width: parent.width
    height: 320+tekst.height
    Rectangle
    {
      width:parent.width
      anchors.top: parent.top
      anchors.topMargin: 10
      color: "transparent"
       Rectangle
       {
           anchors.top: parent.top
           id: tekst
           width: parent.width-20
           height: opistekst.visible==true?opistekst.height+10:izmena.height
           anchors.horizontalCenter: parent.horizontalCenter
           Rectangle
           {

           id:opistekst
           visible: !izmena.visible
           width: parent.width
           height:opisdogadjaj.height +100
           anchors.top:parent.top
           anchors.topMargin: 10
           anchors.horizontalCenter: parent.horizontalCenter
           Rectangle{
                     id: prviPravougaonik
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 30
                    width: parent.width*0.4
                    height: 50
                    Text{
                        anchors.topMargin: 20
                        anchors.centerIn: parent
                        text: qsTr(mDogadjaj.getTip())
                        font.pointSize: 30
                    }

}
           Rectangle{
                       id: drugiPravougaonik
                       anchors.top: prviPravougaonik.bottom
                       anchors.horizontalCenter: parent.horizontalCenter
                       width: parent.width*0.8
                       height: 20
                       Text{
                           anchors.horizontalCenter: parent.horizontalCenter
                           text: qsTr(mDogadjaj.getVreme())
                           font.pointSize: 15
                       }

           }

           Rectangle
           {
               id: opisdogadjaj
               anchors.top: drugiPravougaonik.bottom
               anchors.horizontalCenter: parent.horizontalCenter
               width: parent.width*0.8
               anchors.topMargin: 10
               height: opisdogadjajtekst.implicitHeight
               Text {
                    width: parent.width
                    id:opisdogadjajtekst
                    clip: true
                    wrapMode: Text.Wrap
                    text: qsTr(mDogadjaj.getOpis())
               }
                   }
           }

           ////izmena
           Rectangle
           {
                  id: izmena
                  visible: false
                  width: parent.width
                  height: 300
                  anchors.top: parent.top
                  anchors.horizontalCenter: parent.horizontalCenter
              ComboBox
              {
                  id: tipdogadjajaizmena
                  width: parent.width/3
                  anchors.top: parent.top
                  anchors.topMargin: 5
                  model: _katmodel
                  anchors.horizontalCenter: parent.horizontalCenter
                  textRole: "kategorija"
                //  currentIndex: _katmodel.getCurrentIndex(mDogadjaj.getTip())


              }
              Rectangle
              {
              anchors.top: tipdogadjajaizmena.bottom
              id:vremeizmena
              width: parent.width
              height: 150
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
                 // currentIndex:(mDogadjaj.getDay()-1)
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
                  //currentIndex: (mDogadjaj.getMonth()-1)
                  model: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ]

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
                 // currentIndex: mDogadjaj.getHour()
                  model: [ "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",  "21", "22", "23", "24" ]

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
                //  currentIndex: mDogadjaj.getMinute()
                  model: [ "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",   "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",  "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40",   "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",  "51", "52", "53", "54", "55", "56", "57", "58", "59", "60" ]

              }
              }

              Rectangle
              {

                      id:opisdogadjajrectangleizmena
                      anchors.top: vremeizmena.bottom
                      anchors.topMargin:10
                      width: parent.width*0.9
                      height: 60
                      color: "transparent"
                      border.color:"#595959"
                      anchors.horizontalCenter: parent.horizontalCenter

                      ScrollView
                      {
                          id: flickableopis
                          width: parent.width
                          height: Math.max(30,Math.min(contentHeight, 60))
                          contentWidth: width

                          TextArea
                          {
                              id: opisdogadjajaizmena
                              leftPadding: 6
                              rightPadding: 30
                              topPadding: 0
                              bottomPadding: 0
                              background: null
                              wrapMode: Text.WordWrap
                            //  text: qsTr(mDogadjaj.getOpis())
                          }
                      }

              }
              }
           ///izmena
}




       /////// prijava

       Rectangle
       {
           id: prijavanadogadjaj
              width: parent.width-20
              height: 50
              anchors.top: tekst.bottom
              anchors.topMargin: 5
              anchors.horizontalCenter: parent.horizontalCenter
              color: "white"
              Text {
                  id: brojprijavljenih
                  text: qsTr("Broj zainteresovanih korisnika: "+ ucitavanjeDogadjaja.getBrPrijava())
                  font.family: "Helvetica"
                  font.pointSize: 12
                  anchors.left: parent.left
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.leftMargin: 10
              }
           Button
           {
               id:prijavabutton
               visible: localData.getUlogovan()===false?false:opistekst.visible
                background: Rectangle
                {
                    id:prijavacolor
                    color: ucitavanjeDogadjaja.isPrijavljen()=== false? (prijavabutton.down ? "#549cd1" :(prijavabutton.hovered ? "#549cd1" : "#549cff")):                                                            (prijavabutton.down ? "#d4271a" :(prijavabutton.hovered ? "#d4271a" : "#ff0000"))
                    radius: 5
                }
               anchors.right: parent.right
               height: parent.height*0.8
               width:parent.width*0.4
               anchors.verticalCenter: parent.verticalCenter
               anchors.rightMargin: 10
               Text
               {
                   id: prijavisetext
                   text: ucitavanjeDogadjaja.isPrijavljen()=== false? "Zaineresovan sam": "Nisam zainteresovan"
                   font.family: "Helvetica"
                   font.pointSize: 11
                   font.bold: true
                   anchors.centerIn: parent
                   color: "white"

               }


              onClicked:
              {
                  if(prijavisetext.text=="Zaineresovan sam")
                  {
                      prijavisetext.text="Nisam zaineresovan"
                      prijavacolor.color= prijavabutton.down ? "#d4271a" :
                              (prijavabutton.hovered ? "#d4271a" : "#ff0000")

                  }
                  else
                  {
                       prijavisetext.text="Zaineresovan sam"
                       prijavacolor.color= prijavabutton.down ? "#549cd1" :
                              (prijavabutton.hovered ? "#549cd1" : "#549cff")
                  }
                   ucitavanjeDogadjaja.clickOnPrijava();
                   brojprijavljenih.text="Broj zainteresovanih korisnika: "+ (ucitavanjeDogadjaja.getBrPrijava())
              }
           }

       }

       //////prijava

       ///// lokacija
       Rectangle
       {
           id: dogadjajlokacija
           width: parent.width-20
           height: 100
           anchors.top: prijavanadogadjaj.bottom
           anchors.topMargin: 5
           anchors.horizontalCenter: parent.horizontalCenter
           color: "white"
              Rectangle
              {
              width: parent.width
              height: parent.height-10
              anchors.verticalCenter: parent.verticalCenter
              Rectangle
              {
                  id:slikarect
                  height: parent.height
                  width: parent.height
                  anchors.left: parent.left
                  Image
                  {
                      id:lokacijaprofilimage
                      source: qsTr(ucitavanjeDogadjaja.getLokacijaSlika())
                      width: parent.width
                      height: parent.height
                  }
              }
              Rectangle
              {
                  id:nazivrect
                  height: parent.height
                  width: 170
                  anchors.left: slikarect.right
                  Text
                  {
                      id:nazivlokacijeprofil
                      text: qsTr(location.getNaziv())
                      anchors.left: parent.left
                      anchors.leftMargin: 20
                      width: parent.width
                      wrapMode: Text.WordWrap
                      anchors.verticalCenter: parent.verticalCenter
                  }
              }
              Rectangle
              {
                  id:gradrect
                  height: parent.height
                  width:parent.width-parent.height-200
                  anchors.left: nazivrect.right
                  Text
                  {
                      id:opislokacijeprofil
                      text: qsTr(location.getGrad())
                      anchors.left: parent.left
                      anchors.leftMargin: 15
                      anchors.verticalCenter: parent.verticalCenter
                  }
              }
              MouseArea
              {
                  enabled: opistekst.visible
                  anchors.fill:parent
                  onClicked:
                  {
                      block.visible=true
                      getLokacijaById(mDogadjaj.getIdLokacije())
                      block.visible=false
                      natpis="Lokacija"
                      pageLoader.source= "lokacija.qml"

                  }
              }


       }
          Rectangle
          {
              width: parent.width
              height: 1
              color: "#c9c9c9"
              anchors.bottom: parent.bottom
          }
   }
       ///// lokacija


       Rectangle
       {
           id: lokacija_kreator
           width: parent.width-20
           height: 50
           anchors.top: dogadjajlokacija.bottom
           anchors.topMargin: 5
           anchors.horizontalCenter: parent.horizontalCenter
           color: "white"
           Image {
                   id: profilnaimage
                   source: ucitavanjeDogadjaja.getKorisnikSlika()
                   width: parent.height*0.8
                   height:parent.height*0.8
                   fillMode: Image.PreserveAspectCrop
                   anchors.left: parent.left
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.leftMargin: 10
                   layer.enabled: true
                   layer.effect: OpacityMask
                   {
                       maskSource: mask
                   }

                   MouseArea
                   {
                       enabled: opistekst.visible
                       anchors.fill: parent
                       onClicked:
                       {
                          block.visible = true;


                           if(mProfilInst.getKorisnickoIme()===mDogadjaj.getIdKorisnika())
                           {
                               ucitavanjeProfilaInstance.ucitajLokacijeiDogadjaje(mProfilInst.getKorisnickoIme())
                               natpis="Moj profil"
                               pageLoader.source = "mojprofil.qml"
                           }
                           else
                           {
                               getProfilByUsername(mDogadjaj.getIdKorisnika())
                               natpis="Profil"
                               pageLoader.source = "profil.qml"

                           }
                           block.visible = false;
                       }
                   }
                   }
           Text {
               id: kreator_ime
               text: qsTr(mDogadjaj.getImeKorisnika())
               font.family: "Helvetica"
               font.pointSize: 18
               anchors.left: profilnaimage.right
               anchors.verticalCenter: parent.verticalCenter
               anchors.leftMargin: 10
           }



               Rectangle {
                   id: mask
                   width: parent.height*0.8
                   height:parent.height*0.8
                   radius: parent.height*0.4
                   visible: false
               }

       }


   //  .......


       Rectangle
       {
           id: lokacija_kreat
           width: parent.width-20
           height: opistekst.visible==true?80:30
           anchors.top: lokacija_kreator.bottom
           anchors.topMargin: 5
           anchors.horizontalCenter: parent.horizontalCenter
           color: "white"
           Rectangle
           {
              id: brojLK
              anchors.top: parent.top
              width: parent.width
              height: 30

              Image
              {
                  id: brlikeimage
                  width: 25
                  height: 25
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.left: parent.left
                  anchors.leftMargin: 10
                  source: "qrc:/new/prefix1/heart.png"
              }
              Text
              {
                  id: brlike
                  anchors.left: brlikeimage.right
                  anchors.leftMargin: 5
                  anchors.verticalCenter: parent.verticalCenter
                  text: qsTr(mDogadjaj.getBrLajkaString(0))
              }
              Text
              {
                  id: brkomentaratext
                  anchors.right: parent.right
                  anchors.rightMargin: 10
                  anchors.verticalCenter: parent.verticalCenter
                  text: qsTr(mDogadjaj.getBrKomentaraString(0))
              }
              MouseArea
              {
                  enabled: opistekst.visible
                  anchors.fill: parent
                  onClicked:
                  {
                      if(!localData.getUlogovan())
                      {
                         komentarunos.visible=false
                      }
                      else
                      {
                           komentarunos.visible=true
                      }
                      block.visible=true;
                      ucitajInstance.ucitajKomentare(location.getId())
                      komentaridrawer.open()
                      block.visible = false;
                  }
              }

              Rectangle
              {
                  width: parent.width
                  height: 1
                  color: "#c9c9c9"
                  anchors.bottom: parent.bottom
              }
           }


           Rectangle
           {
               visible: izmena.visible
               width: parent.width
               anchors.top: brojLK.bottom
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.topMargin: 5
               height: 50
               color: "#d3d3d3"
           Button
           {
               id:izmenibutton
               visible: izmena.visible
               width: parent.width/2-5
               anchors.left: parent.left
               height: 50
               background: Rectangle
               {
                   color:"white"
                   radius: 2
               }
               Text
               {
                   anchors.centerIn: parent
                   text: qsTr("Sacuvaj izmene")
               }
               onClicked:
               {
                   block.visible=true
                   getDogadjajById(mDogadjaj.getId())
                   izmena.visible=false
                  // var id= upisLokacijaDogadjaj.azurirajDogadjaj(mDogadjaj.getId(),upisLokacijaDogadjaj.formatDate(cbxmesec.currentValue,cbxdan.currentValue,cbxsat.currentValue,cbxminut.currentValue), opisdogadjajaizmena.text,tipdogadjajaizmena.currentText);
                   console.log(opisdogadjajaizmena.text)
                  funkcija()
                   getDogadjajById(mDogadjaj.getId())
                   pageLoader.source="dogadjaj.qml"
                   block.visible=false
               }
           }

           Button
           {
               id:izbrisidogadjaj
               visible: izmena.visible
               width: parent.width/2-5
               anchors.right: parent.right
               height: 50
               background: Rectangle
               {
                   color:"white"
                   radius: 2
               }
               Text
               {
                   anchors.centerIn: parent
                   text: qsTr("Izbrisi dogadjaj")
               }
               onClicked:
               {
                   block.visible=true
                   getDogadjajById(mDogadjaj.getId())
                   izmena.visible=false
                   upisLokacijaDogadjaj.obrisiDogadjaj(mDogadjaj.getId())
                   pageLoader.source="pocetna.qml"
                   block.visible=false
               }
           }
           }
           Rectangle
           {
             id:likerect
           visible: opistekst.visible
           width: parent.width
           height: 50
           anchors.top: brojLK.bottom
          Rectangle
          {
              id: like
              width: parent.width/3
              height: parent.height
             // color: "red"
              anchors.left: parent.left

              Rectangle{
                  //color:"red"
                  anchors.centerIn: parent
                  width: like_slika.width+like_tekst.width+5
                  height: parent.height
              Image {
                      id: like_slika
                      source: likelogic.vratiIkonicu()
                      width: parent.height*0.5
                      height:parent.height*0.5
                      fillMode: Image.PreserveAspectCrop
                      anchors.left: parent.left
                      anchors.verticalCenter:parent.verticalCenter
                      anchors.leftMargin: 5
              }
              Text {
                  id: like_tekst
                  text: qsTr("Svidja mi se")
                  font.family: "Helvetica"
                  font.pointSize: 14
                  anchors.left: like_slika.right
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.leftMargin: 5
              }
              MouseArea
              {
                  id:likedogadjajklik
                  anchors.fill: parent
                  onClicked:
                  {
                      if(localData.getUlogovan())
                      {
                          likelogic.clickOnLike();
                          var ikonica=likelogic.vratiIkonicu();
                          like_slika.source = ikonica;
                          if(ikonica==="qrc:/new/prefix1/heart.png")
                          {
                              brlike.text=qsTr(mDogadjaj.getBrLajkaString(1))
                          }
                          else
                          {
                              brlike.text=qsTr(mDogadjaj.getBrLajkaString(-1))
                          }
                      }
                      else
                      {
                            ulogujsepopup.open()
                      }

                  }
              }
              }
          }
          Rectangle
          {

              id:komentar_dugme
              width: parent.width/3
              height: parent.height
              //color: "blue"
              anchors.left: like.right


             Rectangle{
                  //color:"red"
                  anchors.centerIn: parent
                  width: komentar_slika.width+komentar_text.width+10
                  height: parent.height
              Image {
                      id: komentar_slika
                      source: "../new/prefix1/comment1.png"
                      width: parent.height*0.5
                      height:parent.height*0.5
                      fillMode: Image.PreserveAspectCrop
                      anchors.left: parent.left
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.leftMargin: 5
              }
              Text {
                  id: komentar_text
                  text: qsTr("Komentar")
                  font.family: "Helvetica"
                  font.pointSize: 14
                  anchors.left: komentar_slika.right
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.leftMargin: 5
              }

              MouseArea
              {
                  anchors.fill: parent
                  onClicked:
                  {
                      if(!localData.getUlogovan())
                      {
                         komentarunos.visible=false
                      }
                      else
                      {
                           komentarunos.visible=true
                      }

                      block.visible=true;
                      ucitavanjeDogadjaja.ucitajKomentare(mDogadjaj.getId())
                      komentaridrawer.open()
                      block.visible = false;
                  }
              }
              }

          }
          Rectangle
          {
              width: parent.width/3
              height: parent.height
             // color: "green"
              anchors.left: komentar_dugme.right

              Rectangle{
                 // color:"red"
                  anchors.centerIn: parent
                  width: share_slika.width+share_tekst.width+10
                  height: parent.height
              Image {
                      id: share_slika
                      source: "../new/prefix1/share.png"
                      width: parent.height*0.5
                      height:parent.height*0.5
                      fillMode: Image.PreserveAspectCrop
                      anchors.left: parent.left
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.leftMargin: 5
              }
              Text {
                  id: share_tekst
                  text: qsTr("Podeli")
                  font.family: "Helvetica"
                  font.pointSize: 14
                  anchors.left: share_slika.right
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.leftMargin: 5
              }
              MouseArea
              {
                  anchors.fill: parent
                  onClicked:
                  { 
                      if(localData.getUlogovan())
                      {
                          block.visible=true
                          prijateljiEvents.prikaziListuPrijatelja()
                          deljenje_lokacije.visible=true
                          block.visible=false
                      }
                      else
                      {
                          ulogujsepopup.open()
                      }
                  }
              }
              }
          }
}

          }
     }
}
Drawer
{
    id: komentaridrawer
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
          //anchors.fill: parent
          anchors.top: parent.top
          height: parent.height
          //anchors.topMargin: 10
          width:  parent.width

          Rectangle{
              id:linija
              anchors.top: parent.top
            height: 5
            width: parent.width
            color:"#2596be"
          }

ListView
       {
           boundsBehavior: ListView.StopAtBounds
           //anchors.fill: parent
           anchors.top: linija.bottom
           width: parent.width
           height: parent.height-15
           anchors.topMargin: 10
           clip: true
           model: _kommodel
           spacing: 10
           delegate:ItemDelegate
           {
               required property string slika
               required property string tekst
               required property string ime
               required property string id
               required property string kreatorid
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
                           layer.effect: OpacityMask {
                               maskSource: mask
                           }

                       Timer
                       {
                          id:delaykomentar
                          repeat: false
                          interval: 200
                          onTriggered:
                          {

                              if(mProfilInst.getKorisnickoIme()===kreatorid)
                              {
                                  ucitavanjeProfilaInstance.ucitajLokacijeiDogadjaje(mProfilInst.getKorisnickoIme())
                                  natpis="Moj profil"
                                  pageLoader.source = "mojprofil.qml"
                              }
                              else
                              {
                                  getProfilByUsername(kreatorid)
                                  natpis="Profil"
                                  pageLoader.source = "profil.qml"

                              }
                              block.visible = false;

                          }
                      }
                           MouseArea
                           {
                               anchors.fill: parent
                               onClicked:
                               {
                                   komentaridrawer.close()
                                   block.visible = true;
                                   delaykomentar.start()
                               }
                           }
                    }
                    Rectangle {

                        Menu
                        {
                            width: 100
                            id: menu
                            x:prijavi.x-menu.width+prijavi.width
                            y:prijavi.y+prijavi.height
                            MenuItem
                            {
                                id:item1
                                anchors.centerIn: parent
                                text: qsTr("Prijavi")

                                onClicked:
                                {

                                    if(localData.getUlogovan())
                                    {
                                        lokacijaprijavapopup.open();
                                        report.setParameters(id,3);
                                    }
                                    else
                                    {
                                       ulogujsepopup.open()
                                    }
                                }
                            }

                        }
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
                          anchors.right: parent.right
                          anchors.rightMargin: 10
                          anchors.top: parent.top
                          anchors.topMargin: -5
                          id: prijavi
                          font.pixelSize: 25
                          text: qsTr("...")

                          MouseArea
                          {
                              anchors.fill: parent
                              onClicked:
                              {
                                  menu.open()
                              }
                          }
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
               blockcomment.visible =true;
               //ucitajInstance.dodajKomentar(location.getId(),komentartext1.text);
               ucitavanjeDogadjaja.dodajKomentar(mDogadjaj.getId(),komentartext1.text);
               komentartext1.remove(0,komentartext1.length)
               brkomentaratext.text=qsTr(mDogadjaj.getBrKomentaraString(1))
               blockcomment.visible = false;
           }
       background:Image {
           anchors.fill: parent
           id: send
           source: "/new/prefix1/pngkit_send-icon-png_1882365.png"


       }
       }

   }

   }

    Rectangle
    {
        id:blockcomment
        anchors.fill: parent
        visible: false
        color: "transparent"
        Rectangle{
        id: blockcolor
        anchors.fill: blockcomment
        color: "white"
        opacity: 0.4
        }

        AnimatedImage
        {
            source: "/new/prefix1/spinnerpage.gif"
            width: 150
            height: 150
            anchors.centerIn: parent
        }
        MouseArea {

        anchors.fill: parent

        onClicked: mouse.accepted = true

        }

    }



}
}





    ///////deljenje lokacije
    Rectangle
    {
        id:deljenje_lokacije
        visible: false
        anchors.fill:parent
        MouseArea
        {
            anchors.fill: parent
        }

        color: "transparent"
        Rectangle
        {
            id:rectanglelistaprijatelja
            width: parent.width*0.8
            height: parent.height*0.8
            anchors.centerIn: parent
            ScrollView{
                id:scrollprijatelji
             width: parent.width
             height: parent.height-dugmevratise.height-20

        ListView {
            boundsBehavior: ListView.StopAtBounds
            clip:true
            anchors.fill: parent
            model:_prijateljimodel
            delegate: ItemDelegate {
                height:70
                width:scrollprijatelji.width
               required property string korisnickoime
               required property string slika
               required property string ime
               required property string index

               Rectangle
               {
                   anchors.fill: parent
                   Rectangle
                   {
                   id:glavnirect
                   width: parent.width
                   height: parent.height-10
                   anchors.verticalCenter: parent.verticalCenter
                   color: "transparent"

                   Rectangle
                   {


//border.color:"#595959"
                       color: "transparent"
                       id:slikaprofil
                       height: parent.height
                       width: parent.height
                       anchors.left: parent.left
                       Image
                       {
                          id:zahtevimage
                          visible: true
                          source: slika
                           width: parent.width
                           height: parent.height
                           fillMode: Image.PreserveAspectCrop
                           layer.enabled: true
                           layer.effect: OpacityMask
                           {
                               maskSource: mask
                           }

                       }

                   }

                   Rectangle
                   {
                       id:nazivprofil
                       height: parent.height
                       width: parent.width-parent.height
                       anchors.left: slikaprofil.right
                       color: "transparent"
                       Text
                       {
                           text: qsTr(ime)
                           anchors.left: parent.left
                           anchors.leftMargin: 20
                           anchors.top: parent.top
                           anchors.topMargin: 2
                           width: parent.width
                           wrapMode: Text.WordWrap
                       }

                       Image {

                           source: "/new/prefix1/send.png"
                           id:posalji
                           visible: true
                           width: parent.height*0.4
                           height:parent.height*0.4
                           anchors.right: parent.right
                           anchors.rightMargin: 10
                           anchors.verticalCenter: parent.verticalCenter
                           MouseArea
                           {
                               anchors.fill: parent
                               onClicked:
                               {
                                   block.visible = true;
                                   notification.podeliDogadjaj(mDogadjaj.getId(),korisnickoime)
                                   posalji.visible=false
                                   console.log(index)
                                   block.visible = false;
                               }
                           }
                       }

                   }

            }
               Rectangle
               {
                   width: parent.width
                   height: 1
                   color: "#c9c9c9"
                   anchors.bottom: parent.bottom
               }

        }
        }
        }
        }
            Button{
                id: dugmevratise
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                height: parent.height/10
                width: parent.width/4
                //anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Nazad")
                onClicked:
                {
                    deljenje_lokacije.visible=false
                }
            }
        }
    }
    //////deljenjne lokacije
    }
