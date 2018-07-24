import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TableView {
        id:tableview
        width: 640
        height: 480
        selectionMode:SelectionMode.MultiSelection
        headerDelegate: Loader{
            sourceComponent: styleData.column == 0?mydelegate:headerDele

            Component{
                id:headerDele
                Item{
                    height: 40
                    implicitWidth: 100
                    Text{
                        text: styleData.value
                        anchors.centerIn: parent
                        font.pixelSize: 12
                    }
                }
            }

            Component {
                id:mydelegate

                Item{
                    id: headerRect;
                    height: 40
                    implicitWidth: 100

                    RadioButton{
                        property bool myPressed: styleData.pressed
                        activeFocusOnPress: true
                        text: qsTr("全选")
                        anchors.centerIn: parent
                        onMyPressedChanged: {
                            if(myPressed)
                                checked = !checked
                        }
                        onCheckedChanged: {
                            if(checked)
                                tableview.selection.selectAll()
                            else
                                tableview.selection.clear()
                        }
                    }
                }
            }
        }

        rowDelegate:Item {
            implicitWidth: 100
            height: 50
        }

        itemDelegate:Rectangle {
            implicitWidth: 100
            height: 50
            Text {
                anchors.centerIn: parent
                text: styleData.value
            }
        }


        model: ListModel {
            id:learnModel

            ListElement {
                selected:false
                StartDate:"2001-01-01"
                EndDate:"2001-01-01"
                Name:qsTr("张三")
                IDNumber:"123456789"
            }
            ListElement {
                selected:true
                StartDate:"2001-01-01"
                EndDate:"2001-01-01"
                Name:qsTr("李四")
                IDNumber:"123456789"
            }
        }
        TableViewColumn {
            role: "selected"
            title: qsTr("全选")
            width: 100
            delegate: Item {
                implicitHeight: 40
                implicitWidth: 100
                RadioButton {
                    id:selectCheckBox
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 40
                    height: 40
                    text: qsTr("")
                    checked: tableview.selection.contains(styleData.row)
                    Connections {
                        target: tableview.selection
                        onSelectionChanged:{
                            selectCheckBox.checked = tableview.selection.contains(styleData.row)
                        }
                    }
                    onCheckedChanged: {
                        if(checked)
                            tableview.selection.select(styleData.row)
                        else
                            tableview.selection.deselect(styleData.row)
                    }
                }
            }
        }
        TableViewColumn {
            role: "StartDate"
            title: qsTr("开始时间")
            width: 100
        }
        TableViewColumn {
            role: "EndDate"
            title: qsTr("结束时间")
            width: 100
        }
        TableViewColumn {
            role: "Name"
            title: qsTr("姓名")
            width: 100
        }
        TableViewColumn {
            role: "IDNumber"
            title: qsTr("身份证号")
            width: 100
        }
    }

}
