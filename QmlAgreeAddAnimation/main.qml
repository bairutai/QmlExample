import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Item {
        anchors.fill:parent
        Button {
            id:agreeButton
            anchors.centerIn: parent
            text: "点赞"
            onClicked: {
                agreeAnimation.start()
            }
        }

        Text {
            id:agreeText
            anchors.bottom: agreeButton.top
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "+1"
            color: "red"
            opacity: 0
        }
    }


    SequentialAnimation {
        id:agreeAnimation
        NumberAnimation { target: agreeText; property: "opacity"; to: 1; duration: 300 }
        NumberAnimation { target: agreeText; property: "scale"; to: 1.2; duration: 300 }
        NumberAnimation { target: agreeText; property: "y"; to: -20; duration: 300 }
        onStopped: {
            agreeText.opacity = 0
            agreeText.scale = 1
            agreeText.y = 0
        }
    }
}
