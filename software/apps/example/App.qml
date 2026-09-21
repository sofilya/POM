// App.qml
import QtQuick 2.7

Rectangle {
        id: exampleapp
        width: 250
        height: 250
        color: "blue"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

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
            }
        }

        Label {
            id: appName
            text: "Example app"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 15
            font.pixelSize: 36
        }
    }
