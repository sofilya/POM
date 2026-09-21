import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.0

ApplicationWindow {
    id:     rectangle
    x: 0
    y: 0

    width:  1280
    height: 720
    color: "#1a1a1a"
    visible: true

    Rectangle {
        id: statusBar
        width: parent.width
        height: (parent.height/12)
        color: "#363636"

        Label {
            id: time
            text: getCurrentTime()
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 30

            function getCurrentTime(){
                var date = new Date()
                return date.toLocaleTimeString(Qt.locale(), "hh:mm")
            }
        }
    }

    App { //whenever you use App{} you only have to specify what is new, rest is copied from App.qml
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

    Timer {
        interval: 500
        running: true
        repeat: true

        onTriggered: {
            time.text = time.getCurrentTime()
        }
    }
}

//    // Variable counter
//    property var counter: 0
//    }
//
//    Label{
//        id: label
//        text: "A Label text"
//        y:  200
//        anchors.horizontalCenter: parent.horizontalCenter
//    }
//
//    Dial{
//        id: dial
//        anchors.horizontalCenter: parent.horizontalCenter
//        wrap: false
//    }
//
//    Button{
//      id:   button1      // Unique identifier in QT
//      text: "Click me"
//      anchors.verticalCenterOffset: 29
//      anchors.horizontalCenterOffset: 0 // Button
//      //y:    400
//      anchors.horizontalCenter: parent.horizontalCenter
//      anchors.verticalCenter:   parent.verticalCenter
//
//      onClicked: {
//          console.info("Button was clicked")
//          counter += 1
//          dial.position = counter/10
//      }

