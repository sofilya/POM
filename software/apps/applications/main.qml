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
    //visibility: Window.FullScreen

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

    AppButton {
        id: exampleapp
        text: "TEST"
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

