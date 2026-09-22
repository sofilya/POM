// AppButton.qml
import QtQuick 2.7
import QtQuick.Controls 2.1

Rectangle {
        id: root
        width: 250
        height: 250
        color: "blue"
        x: (parent.width - width) / 2
        //y: (parent.height - height) / 2
        anchors.verticalCenter: parent.verticalCenter
        property alias text: appName.text
        Image {
            width: parent.width
            height: parent.height
            //fillMode: Image.PreserveAspectFit
            source: "qt.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("example app clicked!")
                moveAndShrink.start()
            }
        }

    //        MouseArea { //watahelly
    //    anchors.fill: parent
    //    onClicked: buttonRoot.clicked() // 2. Forward the click out
    //}

        Label {
        
                id: appName // <-- Na toto ID musel alias nahoře ukazovat
                color: "white" // Přidáno, aby byl text na tmavém pozadí vidět
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.bottom
                anchors.topMargin: 15
                font.pixelSize: 36
            
        }

        ParallelAnimation {
            id: moveAndShrink
        
            // 1. Move to the right
            NumberAnimation {
                target: root
                property: "x"
                to: 900
                duration: 1000
                easing.type: Easing.InOutQuad
            }
    
            // 2. Shrink it slightly as it goes
            NumberAnimation {
                target: root
                property: "scale"
                to: 0.6
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }
    }
