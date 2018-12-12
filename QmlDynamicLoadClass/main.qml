import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property var dynamicLoad

    Button {
        text: "测试"
        onClicked: {
            var component = Qt.createComponent("qrc:/DynamicLoad.qml")
            if (component.status == Component.Ready) {
                dynamicLoad = null
                dynamicLoad = component.createObject(parent)
                if(dynamicLoad)
                {
                    dynamicLoad.test()
                }
            }
        }
    }
}
