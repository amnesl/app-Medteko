// qml/components/CustomToolBar.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Styles 1.0

ToolBar {
    id: root
    property alias title: titleLabel.text
    property var onBack

    RowLayout {
        anchors.fill: parent
        spacing: Styles.spacingMedium

        ToolButton {
            visible: typeof onBack === "function"
            onClicked: if (onBack) onBack()
            contentItem: Text {
                text: "←"
                color: Styles.textColor
                font.pixelSize: Styles.fontSizeLarge
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Label {
            id: titleLabel
            Layout.fillWidth: true
            font.bold: true
            font.pixelSize: Styles.fontSizeLarge
            color: Styles.textColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        ToolButton {
            onClicked: Styles.darkTheme = !Styles.darkTheme
            contentItem: Text {
                text: Styles.darkTheme ? "☀" : "🌙"
                color: Styles.textColor
                font.pixelSize: Styles.fontSizeLarge
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    background: Rectangle {
        color: Styles.cardBackground
    }
}
