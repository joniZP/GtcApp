import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
//import QtQuick.Controls.Material 2.3
import QtGraphicalEffects 1.0
import Klasa 1.0
import MLokacija 1.0
import MProfil 1.0
import MDogadjaj 1.0

ApplicationWindow
{
    property Klasa klas
    property string natpis: "Pocetna"
    property MLokacija location
    property MDogadjaj  mDogadjaj
    property  MProfil mProfil

    function getProfilByUsername(username)
    {
        var pom = ucitavanjeProfilaInstance.getProfil(username);
        mProfil = pom
        prijateljiEvents.setStanjeByUsername(username);

    }

    function getIdLDP(mysource)
    {
        if(mysource == "qrc:/lokacija.qml")
        {
           return location.getId();
        }
        else if(mysource == "qrc:/dogadjaj.qml")
        {
            return mDogadjaj.getId();
        }
        else if(mysource == "qrc:/profil.qml")
        {
            return mProfil.getKorisnickoIme();
        }
        else
        {
            return "-1";
        }
    }

    function menu(icon)
    {
        if(icon=="qrc:/new/prefix1/dropdown-menu-icon-20.jpg")
        {
            refreshProfilData();
            drawer.open()
        }
        else
        {

            block.visible = true;
            var v=back.nazad(pageLoader.source)
             if(v =="qrc:/lokacija.qml")//getIdLDP
                {
                    getLokacijaById(back.getIdLDP());
                }
             else if(v =="qrc:/dogadjaj.qml")
                {
                    getDogadjajById(back.getIdLDP());
                }
                else if(v =="qrc:/profil.qml")
                {
                    getProfilByUsername(back.getIdLDP())
                }

                if(v=="qrc:/pocetna.qml")
                {
                    pretrazi.ucitavanjeLokacijaPocetna();
                }

             console.log(back.getIdLDP())

            natpis=back.getNatpis();
            console.log(natpis)
            pageLoader.source=v
             block.visible= false;
        }
    }

    function getDogadjajById(id)
    {
        let pom = ucitavanjeDogadjaja.getDogadjaj(id)
        mDogadjaj =pom
        let pom1 = mDogadjaj.getLokacija()
        location = pom1;


    }

    function getLokacijaById(id)
    {
        let pom = ucitajInstance.getLokacija(id)
        location =pom
    }

    function refreshProfilData()
    {
        nalogIme.text = qsTr(mProfilInst.getIme()+" "+mProfilInst.getPrezime());
        nalogImg.source = mProfilInst.getSlikaURL();
        nalogEmail.text = qsTr(mProfilInst.getEmail());
       // const obavestenja = localData.getBrObavestenja();
       // if(obavestenja === 0)
           // nalogSlikaPoruka.visible = false;
       // else
       // {
            // nalogBrojPoruka.text = obavestenja;
          //  nalogSlikaPoruka.visible = true;
       // }
        const ulogovan = localData.getUlogovan();
        porukeID.visible = zahteviID.visible = ulogovan;
        loginID.visible = !ulogovan;
        mojprofilotvori.visible = ulogovan;
       // refreshSlika();

    }
    function refreshSlika(url)
    {
        mProfilInst.setSlikaURL(url);
        const nesto = localData.getMProfil();
        console.log("\n\n\n"+nesto.getSlikaURL());
    }



    visible: true
    width: 300
    height: 500
    title: qsTr("Hello World")
    objectName: "radis li be"
    //Material.theme: Material.LightBlue
    //Material.accent: Material.DeepOrange
    property Sbutt pom:pocetna
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
            id: headerline
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
                  // @disable-check M16
                width: parent.width
                Rectangle
                {
                    id:menuiconrect
                    Image
                    {
                        id: menuicon
                        source: "/new/prefix1/dropdown-menu-icon-20.jpg"
                        anchors.centerIn: parent
                        width: 40
                        height: 40
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
                            menu(menuicon.source)
                        }
                    }
                }
                Text {
                    id: natpisid
                    text:"Pocetna";
                    color: "#ffffff"
                    font.family: "Helvetica"
                    font.pointSize: 18
                    anchors.left: menuiconrect.right
                    anchors.leftMargin: 20

                }
                Rectangle
                {
                    id:pretragalupa
                    width: 25
                    height: 25
                    color: "#549cff"
                    Layout.alignment: Qt.AlignRight
                    Layout.rightMargin: 10
                    Image
                    {
                        id: pretragalupaimg
                        source: "/new/prefix1/search-3-24.png"
                        anchors.fill: parent
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                             if(pageLoader.source == "qrc:/lokacija.qml")
                             {
                                  lokacijamenu.open();
                             }
                             else if(pageLoader.source == "qrc:/dogadjaj.qml")
                             {
                                   dogadjajmenu.open();
                             }
                             else
                             {
                                 block.visible=true
                                 pretrazi.reset()
                                 natpis="Pretraga"
                                 pageLoader.source="pretraga.qml"
                                 block.visible=false
                             }

                        }
                    }


                   // Layout.leftMargin:100

            }
            }
        }


        Rectangle
        {
            Menu
            {
                width: 200
               // height: item1.height
                id: lokacijamenu
                x:parent.width-lokacijamenu.width
                y:0

                MenuItem
                {
                    id:lokacijamenuitem
                   // anchors.centerIn: parent
                    text: qsTr("Organizuj dogadjaj")

                    onClicked: {
                        pageLoader.source="qrc:/DodajDogadjaj.qml"
                    }
                }

                MenuItem
                {
                    id:lokacijamenuitem1
                   // anchors.centerIn: parent
                    text: qsTr("Prijavi")

                    onClicked:{
                        report.setParameters(location.getId(),0);
                    lokacijaprijavapopup.open();
                    }
                }

            }

            Menu
            {
                width: 200
               // height: item1.height
                id: dogadjajmenu
                x:parent.width-lokacijamenu.width
                y:0

                MenuItem
                {
                    id:dogadjajitem1
                   // anchors.centerIn: parent
                    text: qsTr("Prijavi")

                    onClicked:{
                        report.setParameters(mDogadjaj.getId(),1);
                    lokacijaprijavapopup.open();
                    }
                }

            }



            Loader
            {

                id: pageLoader
                anchors.centerIn: parent
                anchors.fill: parent
                source: "pocetna.qml"
                onSourceChanged:
                {
                    natpisid.text=natpis
                    if(source!="qrc:/pretraga.qml")
                    {
                        pretragalupa.visible=true

                    }
                    else
                    {
                       pretragalupa.visible=false
                    }  

                    if(source == "qrc:/lokacija.qml" || source == "qrc:/dogadjaj.qml")
                    {
                        pretragalupaimg.source="/new/prefix1/3dot.png";
                    }
                    else
                    {
                        pretragalupaimg.source="/new/prefix1/search-3-24.png";
                    }



                  //  if(source != "qrc:/prijava.qml" && source != "qrc:/registracija.qml" && source != "qrc:/DodajLokaciju.1ml" && source !="qrc:/DodajDogadjaj")//izuzetci za back
                 //   {

                        back.napred(pageLoader.source,natpis, getIdLDP(source))
                        const icon=back.getIcon()
                        menuicon.source=icon
                 //   }




                    if(icon!=="qrc:/new/prefix1/dropdown-menu-icon-20.jpg")
                    {
                        menuicon.width=30
                        menuicon.height=30
                    }
                    else
                    {
                        menuicon.width=40
                        menuicon.height=40
                    }

                    console.log(pageLoader.source)
                }

            }
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
                  // @disable-check M16
                anchors.fill: parent

                Rectangle
                {
                    Layout.minimumWidth: parent.width
                    Layout.minimumHeight: 150
                    color:"#66a3ff"
                    ColumnLayout
                    {
                          // @disable-check M16
                        width:parent.width
                        spacing: 0
                        RowLayout
                        {
                            id: roo
                              // @disable-check M16
                            width:parent.width
                    Image
                    {
                           id: nalogImg
                           source: mProfilInst.getSlikaURL()
                           Layout.topMargin: 20
                           Layout.leftMargin: 10
                           //anchors.verticalCenter: parent.verticalCenter
                           Layout.maximumWidth: 60
                           Layout.maximumHeight: 60
                           width: 50
                           height: 50
                           fillMode: Image.PreserveAspectCrop
                           layer.enabled: true

                           MouseArea
                           {
                               anchors.fill: parent
                               id: mojprofilotvori
                               onClicked: {
                                    drawer.close()
                                   block.visible = true;
                                   ucitavanjeProfilaInstance.ucitajLokacijeiDogadjaje(mProfilInst.getKorisnickoIme())
                                   natpis="Moj profil"
                                   pageLoader.source = "mojprofil.qml"

                                   block.visible = false;

                                   }

                           }
                           layer.effect: OpacityMask {
                               maskSource: mask
                           }
                    }

                  /*  Rectangle {
                           Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "#00000000"
                           id:aaaa
                           Rectangle
                           {
                               id:naloglogin
                               width: childrenRect.width
                               height: childrenRect.height
                               anchors.top: parent.top

                                color: "#00000000"
                               MouseArea
                               {
                                   anchors.fill: parent
                                   onClicked:
                                   {
                                      pageLoader.source = "prijava.qml"
                                      drawer.close()
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
                       }*/


                     }
                    Text {


    id: nalogIme
                        text: qsTr(mProfilInst.getIme() + mProfilInst.getPrezime())
                        color: "#ffffff"
                         font.pointSize: 20
                         Layout.leftMargin: 10
                          Layout.topMargin: 10


                    }
                    Text {
                           id: nalogEmail
                            text: qsTr(mProfilInst.getEmail())
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
                            natpis="Lokacija"
                            pageLoader.source = "pocetna.qml"
                            drawer.close()
                            }
                       }
                        id: pocetna
                        widt: parent.width
                        heigh: 40
                        sourc: "../new/prefix1/iconhome.png"
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
                                natpis="Prvi"
                                pageLoader.source = "profil.qml"

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
                        sourc: "../new/prefix1/iconlocation.png"
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
                            natpis="Dodaj lokaciju"
                            pageLoader.source = "DodajLokaciju.qml"

                            drawer.close()
                            }
                       }
                        id: dugme1
                        widt: parent.width
                        heigh: 40
                        sourc: "../new/prefix1/iconadd.png"
                        tex: "Dodaj lokaciju"
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
                           pocetna.color_="#d9d7d2"
                           pom=pocetna
                           natpis="Pocetna"
                           pageLoader.source = "pocetna.qml"
                            korisnikEvents.odjava()
                           drawer.close()
                           }
                      }
                       id: pocetnastrana
                       widt: parent.width
                       heigh: 40
                       sourc: "../new/prefix1/iconlogout.png"
                       tex: "Log out"
                   }
               }
           }
       }

            Text {
                id: loginID
                text: qsTr("Login  >")
                 anchors.right: parent.right
                 anchors.top: parent.top
                 anchors.topMargin: 10
                 anchors.rightMargin: 10
                 color: "#ffffff"
                 visible: (!localData.getUlogovan());
                 anchors.verticalCenter: parent.verticalCenter

                 MouseArea
                 {
                     anchors.fill: parent
                     onClicked:
                     {
                        natpis="Prijava"
                        pageLoader.source = "prijava.qml"
                        drawer.close()
                     }

                 }
            }


            Image {
                id: porukeID
                source: "qrc:/new/prefix1/comment__2_-removebg-preview.png"
                width:25
                height:25
                visible: localData.getUlogovan();

                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10

                anchors.rightMargin: 20


                Image {
                    id: nalogSlikaPoruka
                    source: "qrc:/new/prefix1/reddot.png"

                    width:13
                    height:13
                    visible: false;

                    anchors.right:parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: -3
                    anchors.topMargin: -3
                    Text {
                        id: nalogBrojPoruka
                        text:  localData.getBrObavestenja()
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Helvetica"
                        anchors.centerIn: parent
                        font.pointSize: 10
                        color: "white"


                        Connections {
                              target: notification
                              function onUpdateSharedNotification(br){
                                  if(br > 99)
                                      br = 99;
                                  if(br === 0)
                                  {
                                      nalogSlikaPoruka.visible = false;
                                  }
                                  else
                                  {
                                      nalogSlikaPoruka.visible = true;
                                      nalogBrojPoruka.text=br;
                                  }

                             }
                         }

                    }
                }

                MouseArea{
                    anchors.fill:parent

                    onClicked:
                    {
                        drawer.close()
                        block.visible=true
                        notification.ucitajObavestenja()
                        natpis="Obavestenja"
                        pageLoader.source = "obavestenja.qml"
                        block.visible=false
                    }
                }
            }
                    Image {
                        id: zahteviID
                        source: "qrc:/new/prefix1/friends.png"
                        width:25
                        height:25
                        visible: localData.getUlogovan()


    anchors.right: porukeID.left
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.rightMargin: 10



                        Image {
                            id: nalogSlikaPrijatelji
                            source: "qrc:/new/prefix1/reddot.png"

                            width:13
                            height:13
                            visible:false

                            anchors.right:parent.right
                            anchors.top: parent.top
                            anchors.rightMargin: -3
                            anchors.topMargin: -3
                            Text {
                                id: nalogBrojPrijatelji
                                text:  notification.getBrNovihZahteva()
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: "Helvetica"
                                anchors.centerIn: parent
                                font.pointSize: 10
                                color: "white"



                                Connections {
                                      target: notification
                                      function onUpdateFriendNotification(br){
                                          if(br > 99)
                                              br = 99;
                                          if(br === 0)
                                          {
                                              nalogSlikaPrijatelji.visible = false;
                                          }
                                          else
                                          {
                                              nalogSlikaPrijatelji.visible = true;
                                              nalogBrojPrijatelji.text=br;
                                          }

                                     }
                                 }

                            }
                        }


                        MouseArea{
                            anchors.fill:parent

                            onClicked: {
                                drawer.close()
                                block.visible=true
                                notification.ucitajZahtevi();
                                natpis="Zahtevi"
                                pageLoader.source = "zahtevi.qml"
                                block.visible=false

                            }
                        }
                    }



            }
    }



    Popup {
        id: lokacijaprijavapopup
        width: parent.width/5*4
        height: 180
        modal: true
        focus: true
        anchors.centerIn: parent
        ColumnLayout
        {   //@disable-check M16
            width:parent.width

            spacing: 10

            Rectangle//OPIS prijave
            {

                id:lokacijaprijavapopuptext
                Layout.minimumWidth: lokacijaprijavapopup.width*0.9
                Layout.alignment: Qt.AlignHCenter

                height: 90
                color: "transparent"
                border.color:"#595959"



                ScrollView {
                    id: lokacijaprijavascrollview
                    width: parent.width
                    height: 80
                    contentWidth: width

                    TextArea {
                           id: lokacijaprijavarazlog
                            placeholderText: qsTr("Unesite razlog prijave")
                               leftPadding: 6
                               rightPadding: 30
                               topPadding: 0
                               bottomPadding: 0
                               background: null
                               wrapMode: Text.WordWrap
                    }
                }
            }

        RowLayout{

             Layout.alignment: Qt.AlignHCenter
        Button
        {
            text: qsTr("Prijavi")
            onClicked:
            {
                report.prijavi(lokacijaprijavarazlog.text)
                lokacijaprijavarazlog.text = "";
                lokacijaprijavapopup.close()
            }
            Layout.alignment: Qt.AlignHCenter
        }
        Button
        {
            text: qsTr("Odustani")
            onClicked:
            {
                lokacijaprijavarazlog.text = "";
                lokacijaprijavapopup.close()
            }
            Layout.alignment: Qt.AlignHCenter
        }

        }


        }
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        // anchors.centerIn: parent
        }



    Rectangle
    {
        id:block
        anchors.fill: parent
        visible: false
        color: "transparent"
        z:999


        Rectangle{
        id: blockcolor
        anchors.fill: block
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
