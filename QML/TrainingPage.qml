import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Styles 1.0
import "components"

Page {
    property StackView stackView
    title: "Обучение"
    background: Rectangle { color: Styles.backgroundColor }

    header: CustomToolBar {
        anchors.topMargin: Window.window ? Window.window.contentItem.topInset : 0
        title: "Обучение"
        onBack: () => stackView.pop()
    }

    ListView {
        id: listView
        anchors.fill: parent
        spacing: Styles.spacingMedium
        clip: true
        model: trainingModel

        delegate: Frame {
            width: listView.width - Styles.spacingMedium * 2
            anchors.horizontalCenter: parent.horizontalCenter
            padding: Styles.spacingSmall

            background: Rectangle {
                color: Styles.cardBackground
                radius: Styles.borderRadius
            }

            Column {
                width: parent.width
                spacing: Styles.spacingSmall

                Text {
                    width: parent.width
                    text: model.title
                    font.bold: true
                    font.pixelSize: Styles.fontSizeLarge
                    color: Styles.textColor
                    font.family: Styles.fontFamily
                    wrapMode: Text.WordWrap
                }

                Text {
                    width: parent.width
                    text: model.description
                    font.pixelSize: Styles.fontSizeMedium
                    font.family: Styles.fontFamily
                    wrapMode: Text.WordWrap
                    color: Styles.textColor
                }

                Text {
                    width: parent.width
                    text: "Файл: " + model.file
                    font.pixelSize: Styles.fontSizeSmall
                    font.family: Styles.fontFamily
                    color: Styles.disabledColor
                    font.italic: true
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
