import QtQuick 2.6
import QtQuick.Window 2.2
import "./"
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.5
    }

    ListNavigation {
        height: parent.height

        Component.onCompleted: {
            addNavigation(qsTr("列表1"),"qrc:/Picture/test1.png","qrc:/Picture/test1.png",
                          [{"subTitle":qsTr("列表1-子列表1"),"subIndex":1},{"subTitle":qsTr("列表1-子列表2"),"subIndex":12}])
            addNavigation(qsTr("列表2"),"qrc:/Picture/test2.png","qrc:/Picture/test2.png",
                          [{"subTitle":qsTr("列表2-子列表1"),"subIndex":21},{"subTitle":qsTr("列表2-子列表2"),"subIndex":22},
                           {"subTitle":qsTr("列表2-子列表3"),"subIndex":23},{"subTitle":qsTr("列表2-子列表4"),"subIndex":24}])
            addNavigation(qsTr("列表1"),"qrc:/Picture/test3.png","qrc:/Picture/test3.png",
                          [{"subTitle":qsTr("列表3-子列表1"),"subIndex":31},{"subTitle":qsTr("列表3-子列表2"),"subIndex":32}])
            addNavigation(qsTr("列表1"),"qrc:/Picture/test4.png","qrc:/Picture/test4.png",
                          [{"subTitle":qsTr("列表4-子列表1"),"subIndex":41},{"subTitle":qsTr("列表4-子列表2"),"subIndex":42}])
            addNavigation(qsTr("列表1"),"qrc:/Picture/test1.png","qrc:/Picture/test1.png",
                          [{"subTitle":qsTr("列表5-子列表1"),"subIndex":51},{"subTitle":qsTr("列表5-子列表2"),"subIndex":52}])
        }

        onIndexChanged: {
            switch(index)
            {
            case 1:
                console.log("列表1-子列表1")
                break;
            case 12:
                console.log("列表1-子列表2")
                break;
            default:
                break;
            }


        }
    }
}
