import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Theme {
        id:theme
    }

    Rectangle {
        anchors.fill: parent
        color: theme.style.bgColor
        Text {
            text: qsTr("测试皮肤")
            color: theme.style.textColor
        }
    }

    Row {
        anchors.centerIn: parent
        Button {
            text: qsTr("换自带白皮肤")
            onClicked:{
                theme.setTheme(0,"white")
            }
        }
        Button {
            text: qsTr("换自带绿皮肤")
            onClicked:{
                theme.setTheme(0,"green")
            }
        }
        Button {
            text: qsTr("换下载皮肤")
            onClicked:{
                theme.setTheme(1,"theme_dark.qml")
            }
        }
    }

}
