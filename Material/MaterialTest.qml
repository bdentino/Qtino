import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    color: '#EEEEEE'
    width: 960
    height: 768

    Item {
        id: toolbar
        anchors {
            top: parent.top
            left: parent.left
        }
        visible: false
        width: parent.width
        height: toolbarContent.height + toolbarShadow.radius * 2

        Rectangle {
            id: toolbarContent
            width: parent.width
            height: 256
            color: '#189090'
        }
    }

    DropShadow {
        id: toolbarShadow
        source: toolbar
        anchors.fill: source
        width: source.width
        height: source.height
        cached: true
        radius: 8.0
        samples: 16
        color: "#80000000"
        smooth: true
    }
    /*
Item {
id: container
width: containerContent.width + containerShadow.radius * 2
height: containerContent.height + containerShadow.radius * 2
visible: false
Rectangle {
id: containerContent
width: 640
height: 600
color: "white"
radius: 2
antialiasing: true
anchors.centerIn: parent
}
}

DropShadow {
id: containerShadow
anchors {
top: parent.top
topMargin: 64
horizontalCenter: parent.horizontalCenter
}
width: source.width
height: source.height
cached: true
radius: 8.0
samples: 16
color: "#80000000"
smooth: true
source: container
}
*/

    Item {
        id: button
        width: buttonContent.width + buttonShadow.radius * 2
        height: buttonContent.height + buttonShadow.radius * 2
        visible: false

        anchors {
            left: parent.left
            top: parent.top
            topMargin: toolbarContent.height - buttonContent.height/2 - buttonShadow.radius
            leftMargin: 45
        }
        Rectangle {
            id: buttonContent
            width: 59
            height: 59
            color: '#EEFF41'
            radius: width/2
            anchors.centerIn: parent
            anchors.margins: 3
        }
    }

    DropShadow {
        id: buttonShadow
        anchors.fill: source
        cached: true
        radius: 8.0
        samples: 16
        color: "#80000000"
        smooth: false
        source: button

        MouseArea {
            anchors.fill: parent
            onClicked: buttonToggle = !buttonToggle
        }

        states: [
            State {
                name: "dialog"
                when: buttonToggle
                PropertyChanges { target: buttonContent; width: 640; height: 600; radius: 2; color: "white"; }
                PropertyChanges { target: button; anchors.leftMargin: (root.width - buttonContent.width)/2; anchors.topMargin: 64 }
            },
            State {
                name: "button"
                when: !buttonToggle
                PropertyChanges { target: buttonContent; color: "#EEFF41"}
            }
        ]
        transitions: Transition {
            NumberAnimation { properties: "width,height,radius,anchors.leftMargin,anchors.topMargin"; easing.type: Easing.InOutQuad; duration: 300 }
            ColorAnimation { duration: 300 }
        }
    }
    property bool buttonToggle: false
}
