import QtQuick 2.0
import QtQuick.Controls 1.4

/*  树形二级列表导航组件  */
Item {
    property int parIndex:-1
    property int index:-1

    id:rootItem    //默认284
    width: 284

    ListView {
        clip:true
        anchors.fill: parent
        delegate:parentDelegate
        model: listModel
    }
    ListModel {
        id:listModel
    }

    Component {
        id:parentDelegate
        Column {
            id:column
            state:"shrink"
            states: State {
                name: "expand"
            }
            State {
                name: "shrink"
            }

            PropertyAnimation {
                id:animation1
                target: column
                property: "height"
                easing.type: Easing.Linear
                to:50
                duration: listModel.get(index).subModel.count * 100
                onStopped: {
                    subList.visible = false
                    column.state = "shink"
                }
            }

            PropertyAnimation {
                id:animation2
                target: column
                property: "height"
                easing.type: Easing.Linear
                to:50 +listModel.get(index).subModel.count * 40
                duration: listModel.get(index).subModel.count * 100
                onStopped: {
                    subList.visible = true
                    column.state = "expand"
                }
            }

            Rectangle {
                id:parentItem
                width: column.state == "expand"?284:280
                height: 50
                color: "white"
                gradient:column.state == "expand"?gradient:null

                Behavior on width {
                    PropertyAnimation {
                        duration: 100
                    }
                }
                Gradient {
                    id:gradient
                    GradientStop { position: 0.0; color: "#2186C0" }
                    GradientStop { position: 1.0; color: "#5f52A0" }
                }
                Image {
                    id:leftimg
                    anchors.left: parent.left
                    anchors.leftMargin: 24
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40
                    height: 40
                    source: column.state == "expand"?listModel.get(index).highlightImgPath:listModel.get(index).normalImgPath
                }
                Text {
                    id:titleText
                    anchors.left: leftimg.right
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text:listModel.get(index).title
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(column.state == "expand")
                            animation1.start()
                        else
                            animation2.start()
                    }
                }
            }

            ListView {
                id:subList
                visible:false
                width: 280
                height: listModel.get(index).subModel.count * 40
                model:listModel.get(index).subModel

                delegate: Rectangle{
                    width: 280
                    height: 40
                    color: "blue"
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 50
                        anchors.verticalCenter: parent.verticalCenter
                        text: subTitle
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            rootItem.index = subIndex
                        }
                    }
                }
            }
        }
    }

    function addNavigation(title,highlightImgPath,normalImgPath,subArray)
    {
        listModel.append({"title":title,"highlightImgPath":highlightImgPath,"normalImgPath":normalImgPath,"subModel":subArray})
    }
}
