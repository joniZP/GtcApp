import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
//import QtQuick.Controls.Material 2.3
import QtGraphicalEffects 1.0
import Events 1.0
import Klasa 1.0
import UcitavanjeLokacije 1.0
import MLokacija 1.0
import PretragaLokacija 1.0
import LOCALDATA 1.0
import KorisnikEvents 1.0
import MProfil 1.0
import UcitavanjeProfila 1.0

ApplicationWindow
{
    property MLokacija location
    property Klasa klas
    property string natpis: ""
    property MProfil mProfil
    property MProfil mProfilInst;

    LOCALDATA{
    id:localData

    Component.onCompleted: {
    mProfilInst = localData.getMProfil();
    }
    }


    KorisnikEvents{
    id:korisnikEvents
    }


    PretragaLokacija
    {
        id:pretrazi
    }
    Component.onCompleted:
    {

       let klas1= event.fun1()
       klas=klas1
    }


    UcitavanjeLokacije
    {
       id:ucitajInstance;
    }

    UcitavanjeProfila{
        id:ucitavanjeProfilaInstance
    }






    function getProfilByUsername(username)
    {
        let userpom = ucitavanjeProfilaInstance.getProfil(username);
        mProfil = userpom;
    }

    function getDogadjajById(id)
    {

    }

    function getLokacijaById(id)
    {
        let lokacijapom= ucitajInstance.getLokacija(id)
        location = lokacijapom;
    }

    function refreshProfilData()
    {
        nalogIme.text = qsTr(mProfilInst.getIme()+" "+mProfilInst.getPrezime());
        nalogImg.source = mProfilInst.getSlikaURL();
        nalogEmail.text = qsTr(mProfilInst.getEmail());
        const obavestenja = localData.getBrObavestenja();
        if(obavestenja === 0)
            nalogSlikaPoruka.visible = false;
        else
        {
             nalogBrojPoruka.text = obavestenja;
            nalogSlikaPoruka.visible = true;
        }
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
   Events
   {
       id: event

   }
   Klasa
   {
     id:klass
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
                  // @disable-check M16
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
                            refreshProfilData();
                            drawer.open()
                        }
                    }
                }
                Text {
                    id: iii
                    text:klas.getp1();
                    color: "#ffffff"
                    font.family: "Helvetica"
                    font.pointSize: 18
                    anchors.left: iddd.right
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
                        id: namje
                        source: "/new/prefix1/search-3-24.png"
                        anchors.fill: parent
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            pretrazi.reset()
                            pageLoader.source="pretraga.qml"
                            natpis="Pretraga"
                        }
                    }


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
                source: "ListaLokacija.qml"
                onSourceChanged:
                {
                    iii.text=natpis
                    if(source!="qrc:/pretraga.qml")
                    {
                        pretragalupa.visible=true

                    }
                    else
                    {
                       pretragalupa.visible=false
                    }
                }

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
                            natpis="Pocetna"
                        pageLoader.source = "lokacija.qml" 
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
                            pageLoader.source = "profil.qml"
                            natpis="Prvi"
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
                        natpis="Dodaj lokaciju"
                        pageLoader.source = "DodajLokaciju.qml"

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
                            natpis="Dodaj dogadjaj"
                            pageLoader.source = "DodajDogadjaj.qml"
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
                            natpis="Pretraga"
                            pageLoader.source = "pretraga.qml"
                            drawer.close()
                        }
                    }
                    id: dugme3
                    widt: parent.width
                    heigh: 40
                    sourc: "/new/prefix1/list.png"
                    tex: "Podesavanja"
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
                       natpis="Lista lokacija"
                       pageLoader.source = "proba.qml"
                       drawer.close()
                       }
                  }
                   id: listalokacija
                   widt: parent.width
                   heigh: 40
                   sourc: "/new/prefix1/list.png"
                   tex: "ListaLokacija"
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
                   sourc: "/new/prefix1/list.png"
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
                        }
                    }

                    MouseArea{
                        anchors.fill:parent

                        onClicked: {

                            pageLoader.source = "obavestenja.qml"
                            drawer.close()
                        }
                    }
                }
                Image {
                    id: zahteviID
                    source: "qrc:/new/prefix1/comment__2_-removebg-preview.png"
                    width:20
                    height:20
                    visible: localData.getUlogovan()

                    anchors.right: porukeID.left
                    anchors.top: porukeID.top
                    anchors.topMargin: 10
                    anchors.rightMargin: 10

                    MouseArea{
                        anchors.fill:parent

                        onClicked: {

                            pageLoader.source = "zahtevi.qml"
                            drawer.close()
                        }
                    }
                }



        }
}

    Rectangle
    {
        id:block
        anchors.fill: parent
        visible: false
        color: "black"
        opacity: 0.2

        AnimatedImage
        {
            source: "/new/prefix1/Spinner-1s-200px (1).gif"
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
