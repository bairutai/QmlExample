import QtQuick 2.0
import FileIO 1.0
Item {
    id:main_theme
    property QtObject style: SkinConfig {}

    SkinConfig {
        id:style_white
        property color bgColor: 'white'
        property int textSize: 20
        property color textColor: "black"
    }

    SkinConfig {
        id:style_green
        property color bgColor: 'green'
        property int textSize: 20
        property color textColor: "blue"
    }

    FileIO {
        id:themeFile
    }

    //type:0为自带皮肤
    //type:1为下载皮肤
    function setTheme(type,changeStyle)
    {
        if(type === 0)
        {
            if(changeStyle === "white")
            {
                style =  style_white
            }
            else if(changeStyle === "green")
            {
                style = style_green
            }
        }
        else if (type === 1)
        {
            themeFile.setSource(themeFile.currentApplicatinPath + "/" + changeStyle)
            var fileContent = themeFile.read()
            var loadStyle = Qt.createQmlObject(fileContent,main_theme,"dynamicSnippet1")

            if(loadStyle === null){
                console.log("Component.Error: ",loadStyle === null)
            }
            else
                style =loadStyle
        }

    }
}
