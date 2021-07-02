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
    property string natpis: "Početna"
    property MLokacija location
    property MDogadjaj  mDogadjaj
    property  MProfil mProfil
    property  MProfil mProfilInst
    property  bool pretragaLD: true
    property  bool applicationInit: false
    property  bool availableInternet: true
    function getProfilByUsername(username)
    {
        var pom = ucitavanjeProfilaInstance.getProfil(username);
        mProfil = pom
        prijateljiEvents.setStanjeByUsername(username);


    }


    function initApplication()
    {
        if(availableInternet)
        {
            pretrazi.ucitavanjeLokacijaPocetna();
            if(availableInternet)
            {
                ucitajInstance.ucitajKategorije();
                if(availableInternet)
                {
                    ucitajInstance.ucitajGradove();
                    if(availableInternet)
                    {
                        localData.initMProfil();
                        let pom=localData.getMProfil()
                        mProfilInst=pom
                        applicationInit = true;
                    }
                }

            }

        }
        destroyinitblock.start();

    }

  //  Component.onCompleted:
   // {
       // let pom=localData.getMProfil()
      //  mProfilInst=pom

   // }

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
            drawer.open()
        }
        else
        {

            block.visible = true;      
            const trenutnisors = pageLoader.source
            const trenutninatpis = natpis;
            const trenutniid = back.getLastId();
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

                if(connectionlostmessage.visible == true)
                {
                    back.napred(trenutnisors,trenutninatpis, trenutniid)
                    block.visible=false
                    return;
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
/*
    function checkprijavljen(ld)
    {
        console.log("uslo")
        if(localData.getUlogovan())
        {
            if(ld==="lokacija.qml")
            {
                podelilokacijaklik.enabled=true
                likelokacijaklik.enabled=true
            }
            else if(ld==="dogadjaj.qml")
            {
                prijavanadogadjajbutton.visible=true
                likedogadjajklik.enabled=true
            }
           // komentarunos.visible=true
        }
        else
        {


       // ulogujsepopup


            console.log("nije ulogovan "+ld)
            if(ld=="qrc:/lokacija.qml")
            {
                console.log("nije ulogovan lokacija")
               // podelilokacijaklik.enabled=false
                //likelokacijaklik.enabled=false
                aliasproba.komentarunos.visible=false
            }
            else if(ld=="qrc:/dogadjaj.qml")
            {
                 console.log("nije ulogovan dogadjaj")
                 prijavanadogadjajbutton.visible=false
                 likedogadjajklik.enabled=false
            }
            //komentarunos.visible=false

        }
    }
*/
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
        logoutdugme.visible=ulogovan
        dodajlokacijubutton.visible=ulogovan
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


    id:glavnastranica
    signal izmeniDogadjajsignal
    visible: true
    width: 300
    height: 500
    title: qsTr("Hello World")
    objectName: "radis li be"
    //Material.theme: Material.LightBlue
    //Material.accent: Material.DeepOrange
    property Sbutt pom:pocetnadugme
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
                    text:"Početna";
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
                    background: Rectangle
                    {
                        implicitWidth: parent.width
                        implicitHeight: parent.height
                       color: "white"
                    }

                    onClicked:
                    {
                        if(localData.getUlogovan())
                        {
                            pageLoader.source="qrc:/DodajDogadjaj.qml"
                        }
                        else
                        {
                           ulogujsepopup.open()
                        }
                    }
                }

                MenuItem
                {
                    id:lokacijamenuitem1
                   // anchors.centerIn: parent
                    text: qsTr("Prijavi")
                    background: Rectangle
                    {
                        implicitWidth: parent.width
                        implicitHeight: parent.height
                       color: "white"
                    }
                    onClicked:
                    {

                            if(localData.getUlogovan())
                            {
                                report.setParameters(location.getId(),0);
                                lokacijaprijavapopup.open();
                            }
                            else
                            {
                                  ulogujsepopup.open()
                            }

                    }
                }

            }

            Menu
            {
                width: 200
               // height: item1.height
                id: dogadjajmenu
                height: dogadjajitem1.height+8
                x:parent.width-lokacijamenu.width
                y:0

                MenuItem
                {
                    background: Rectangle
                    {
                        implicitWidth: parent.width
                        implicitHeight: parent.height
                       color: "white"
                    }

                    id:dogadjajitem1
                   // anchors.centerIn: parent
                    text: qsTr("Prijavi")

                    onClicked:
                    {
                        if(localData.getUlogovan())
                        {
                            report.setParameters(mDogadjaj.getId(),1);
                            lokacijaprijavapopup.open();
                        }
                        else
                        {
                            ulogujsepopup.open()
                        }
                    }
                }
                MenuItem
                {
                    id:izmenidogadjaj
                   // anchors.centerIn: parent
                    text: qsTr("Izmeni")
                    background: Rectangle
                    {
                        implicitWidth: parent.width
                        implicitHeight: parent.height
                       color: "white"
                    }

                    onClicked:
                    {
                        if(localData.getUlogovan())
                        {
                            if(mProfilInst.getKorisnickoIme()!==mDogadjaj.getIdKorisnika())
                            {
                                console.log("nije taj korisnik")
                                //izbaci popup nije tvoj dogadjaj
                            }
                            else
                            {
                                izmeniDogadjajsignal()
                            }
                       }
                        else
                        {
                             ulogujsepopup.open()
                        }

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
                    if(availableInternet === false && initblock.visible === false)
                    {
                       let lastsource = back.getLastSource();
                        console.log(lastsource);
                        if(source !== lastsource)
                        {
                            console.log("usao");
                            pageLoader.source = lastsource//mozda treba natpis
                            block.visible = false;
                         }

                        return;
                    }
                    drawer.close()
                    natpisid.text=natpis
                    if(source!="qrc:/pretraga.qml")
                    {
                        pretragalupa.visible=true

                    }
                    else
                    {
                       pretragalupa.visible=false
                    }
                    if (source=="qrc:/dogadjaj.qml")
                    {
                       if(mProfilInst.getKorisnickoIme()!==mDogadjaj.getIdKorisnika())
                       {
                           dogadjajmenu.height=dogadjajmenu.height/2
                           izmenidogadjaj.visible=false
                       }
                       else
                       {
                            izmenidogadjaj.visible=true
                            dogadjajmenu.height=dogadjajmenu.height*2
                       }
                    }

                    if(source == "qrc:/lokacija.qml" || source == "qrc:/dogadjaj.qml")
                    {
                        pretragalupaimg.source="/new/prefix1/3dot.png";
                       // nekiSignal()
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
                        menuicon.width=25
                        menuicon.height=20
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
            dragMargin: 15
            modal: false
            onOpened:
            {
                refreshProfilData()
            }

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
                            spacing: 0
                            AnimatedImage
                            {
                                id:spinernalog
                                source: "/new/prefix1/spinnerpicture.gif"
                                Layout.topMargin: 20
                                Layout.leftMargin: 10
                                //anchors.verticalCenter: parent.verticalCenter
                                Layout.maximumWidth: 60
                                Layout.maximumHeight: 60
                                width: 50
                                height: 50
                                 layer.enabled: true
                               // visible: slikalokacija.progress!=1
                                layer.effect: OpacityMask {
                                    maskSource: mask
                                }
                            }
                    Image
                    {
                           id: nalogImg
                           source: mProfilInst.getSlikaURL()
                           Layout.topMargin: 20
                           Layout.leftMargin: -60
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

                           onStatusChanged:
                           {
                               if(nalogImg.status==Image.Ready)
                               {
                                   //spinernalog.visible=false
                               }
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
                            pocetnadugme.color_="#d9d7d2"
                            pom=pocetnadugme
                            natpis="Početna"
                            pageLoader.source = "pocetna.qml"
                            drawer.close()
                            }
                       }
                        id: pocetnadugme
                        widt: parent.width
                        heigh: 40
                        sourc: "../new/prefix1/iconhome.png"
                        tex: "Početna"
                    }
                    Sbutt
                    {
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                //console.log( men.fun1(dugme))
                                pretragaLD=true
                                natpis="Pretraga lokacija"
                                pageLoader.source = "pretraga.qml"
                                if(pom!=null)
                                {
                                     pom.color_="#ffffff"
                                }
                                dugmepretragalokacija.color_="#d9d7d2"
                                pom=dugmepretragalokacija
                                drawer.close()
                            }
                        }
                        id: dugmepretragalokacija
                        widt: parent.width
                        heigh: 40
                        sourc: "../new/prefix1/iconlocation.png"
                        tex: "Pretraži lokacije"
                    }

                    Sbutt
                    {
                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked:
                            {
                                //console.log( men.fun1(dugme))
                                pretragaLD=false
                                natpis="Pretraga dogadjaja"
                                pageLoader.source = "pretraga.qml"


                                if(pom!=null)
                                {
                                   pom.color_="#ffffff"
                                }
                                dugmepretragadogadjaja.color_="#d9d7d2"
                                pom=dugmepretragadogadjaja
                                drawer.close()
                            }
                        }
                        id: dugmepretragadogadjaja
                        widt: parent.width
                        heigh: 40
                        sourc: "qrc:/new/prefix1/event.png"
                        tex: "Pretraži dogadjaje"
                    }

                    Sbutt
                    {
                        id:dodajlokacijubutton
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
                            dodajlokacijubutton.color_="#d9d7d2"
                            pom=dodajlokacijubutton
                            natpis="Dodaj lokaciju"
                            pageLoader.source = "DodajLokaciju.qml"

                            drawer.close()
                            }
                       }

                        widt: parent.width
                        heigh: 40
                        sourc: "../new/prefix1/iconadd.png"
                        tex: "Dodaj lokaciju"
                    }


                   Sbutt
                   {
                       id: logoutdugme
                       visible: localData.getUlogovan()
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
                           logoutdugme.color_="#d9d7d2"
                           pom=logoutdugme
                          // natpis="Pocetna"
                           block.visible=true
                           korisnikEvents.odjava()
                           drawer.close()
                               refreshProfilData()
                           //pageLoader.source = "pocetna.qml"
                           block.visible=false
                           }
                      }
                       widt: parent.width
                       heigh: 40
                       sourc: "qrc:/new/prefix1/logouticon.png"
                       tex: "Odjavi se"
                   }
               }
           }
       }

            Text {
                id: loginID
                text: qsTr("Prijavi se  >")
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
                source: "qrc:/new/prefix1/comment.png"
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
        {
             // @disable-check M16
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
       // z:999
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



    //////
    Rectangle{
        id:connectionlostmessage
        anchors.top: parent.top;
        width: parent.width;
        height: 60;
        color: "#333333"
        opacity: 0.8
        visible: true

            Text{
                id: connectionlostmessagetext
                anchors.centerIn: parent
                text:qsTr("Connection failed")
                color:"white"

            }

            Connections {
                  target: mysqlservice
                  function onMyConnectionLost()
                  {
                     connectionlostmessage.visible=true;
                     availableInternet=false

                  }

                  function onMyConnectionEstablished()
                  {
                    connectionlostmessage.visible=false;
                    availableInternet=true
                  }
             }


        }
        Rectangle
        {
            id:initblock
            anchors.fill: parent
            visible: true
            color: "#ededed"
            Timer{
                id:destroyinitblock
            repeat: false
            interval: 3000
            onTriggered: {
                if(availableInternet == true && applicationInit === true)
                {
                    initblock.visible=false;
                }
                else
                {
                    initkcolor.visible=true
                }
            }
            }

            Component.onCompleted:
            {
                initApplication();
            }
            Image
            {
                id: initbackimg
                source: "qrc:/new/prefix1/iconlocation.png"
                width: 150
                height: 150
            //  anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -80
            }

            Text
            {
                id:initblocktext
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
               // anchors.topMargin: 1
                text: qsTr("Made by Squad®");
                color: "#549cff"
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: mouse.accepted = true
            }


            Rectangle
            {
            id: initkcolor
            anchors.fill: initblock
            color: "#575757"
            opacity: 0.7
            visible: false

            Text
            {
               id:reconnecttext
               horizontalAlignment: Text.AlignHCenter
               anchors.centerIn: initkcolor
               anchors.verticalCenterOffset: -30
               text:qsTr("Connection failed\n check your connection and try again.")
               color:"white"
            }

            Image{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: reconnecttext.bottom
                anchors.topMargin: 30
                width: 150
                height: 150
                source: "/new/prefix1/reconnect.png"

                MouseArea{
                anchors.fill: parent

                onClicked:
                {
                    initkcolor.visible=false
                    initApplication()
                }

                }

            }

            }

            }

        Popup {
            id: ulogujsepopup
            width: parent.width/5*4
            height: 120
            modal: true
            focus: true
            x:(parent.width-ulogujsepopup.width)/2
            y:(parent.height-ulogujsepopup.height)/2
           Rectangle
           {
              anchors.fill: parent
              anchors.centerIn: parent
            Text
            {

                id: ulogujsepopuptext
                text:"Ova opcija omogucena je samo prijavljenim korisnicima."
                horizontalAlignment: Text.AlignHCenter
                width:parent.width*0.9
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                font.pixelSize: 15
                anchors.top: parent.top
            }


            Rectangle
            {
                height: prijavisedugme.implicitHeight
                anchors.bottom: parent.bottom
                //anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                width: prijavisedugme.implicitWidth+odustanidugme.implicitWidth+20
                 Button
                 {
                     id:prijavisedugme
                     text: qsTr("Prijavi se")
                     onClicked:
                     {
                         ulogujsepopup.close()
                         pageLoader.source="qrc:/prijava.qml"

                     }
                     anchors.left: parent.left
                 }
                Button
                {
                    id:odustanidugme
                    text: qsTr("Odustani")
                    onClicked:
                    {
                        ulogujsepopup.close()
                    }
                    anchors.right: parent.right
                }
            }
          }

                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
                // anchors.centerIn: parent
                }



        Rectangle{
            id:uploadovanjeslikaglavni
            anchors.fill: parent
            opacity: 0.8
            visible: false
            MouseArea
            {
                anchors.fill: parent
                onClicked: mouse.accepted = true
            }

        Rectangle
        {
            id:uploadovanjeslika
            visible: true
            width: parent.width
            height: 300
            color: "transparent"
            anchors.verticalCenter: parent.verticalCenter
            Rectangle
            {
                visible: true
                id:slika1rect
                width: 200
                height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                color: "transparent"
                Text
                {
                    id:prvaslika
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Uploadovanje prve slike")
                }
                AnimatedImage
                {
                    id:uploading1
                    anchors.left: prvaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/loadingimage.gif"
                }
                Image
                {
                    id:done1
                    visible: !uploading1.visible
                    anchors.left: prvaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/doneuploading.png"
                }

            }
            Rectangle
            {
                visible: false
                id:slika2rect
                anchors.top: slika1rect.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                width: 200
                height: 50
                color: "transparent"
                Text
                {
                    id:drugaslika
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Uploadovanje druge slike")
                }
                AnimatedImage
                {
                    id:uploading2
                    anchors.left: drugaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/loadingimage.gif"
                }
                Image
                {
                    id:done2
                    visible: !uploading2.visible
                    anchors.left: drugaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/doneuploading.png"
                }
            }
            Rectangle
            {
                visible: false
                id:slika3rect
                anchors.top: slika2rect.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                width: 200
                height: 50
                color: "transparent"
                Text
                {
                    id:trecaslika
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Uploadovanje trece slike")
                }
                AnimatedImage
                {
                    id:uploading3
                    anchors.left: trecaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/loadingimage.gif"
                }
                Image
                {
                    id:done3
                    visible: !uploading3.visible
                    anchors.left: trecaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/doneuploading.png"
                }
            }
            Rectangle
            {
                visible: false
                id:slika4rect
                anchors.top: slika3rect.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                width: 200
                height: 50
                color: "transparent"
                Text
                {
                    id:cetvrtaslika
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Uploadovanje cetvrte slike")
                }
                AnimatedImage
                {
                    id:uploading4
                    anchors.left: cetvrtaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/loadingimage.gif"
                }
                Image
                {
                    id:done4
                    visible: !uploading4.visible
                    anchors.left: cetvrtaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/doneuploading.png"
                }
            }
            Rectangle
            {
                visible: false
                id:slika5rect
                anchors.top: slika4rect.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                width: 200
                height: 50
                color: "transparent"
                Text
                {
                    id:petaslika
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Uploadovanje pete slike")
                }
                AnimatedImage
                {
                    id:uploading5
                    anchors.left: petaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/loadingimage.gif"
                }
                Image
                {
                    id:done5
                    visible: !uploading5.visible
                    anchors.left: petaslika.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: "qrc:/new/prefix1/doneuploading.png"
                }
            }
        }
        }
        /*
        Popup
        {
            id: popup
            width: parent.width/5*4
            height: 150
            modal: true
            focus: true
            x:(parent.width-popup.width)/2
            y:(parent.height-popup.height)/2


            ColumnLayout
            {
              // @disable-check M16
                width:parent.width
                spacing: 50
            Text {
                id: popuptext
                text:"Ne mozete izmeniti dogadjaj koji niste vi kreirali"
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 10
            }

            Button
            {
                text: qsTr("U redu")
                onClicked:
                {
                    popup.close()
                    pop
                }
                Layout.alignment: Qt.AlignHCenter
            }
            }
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
            // anchors.centerIn: parent
            }*/
}
