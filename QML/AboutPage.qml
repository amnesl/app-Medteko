import QtQuick 2.15
import QtQuick.Controls 2.15
import Styles 1.0
import "components"

Page {
    property StackView stackView
    title: "О Компании"
    background: Rectangle { color: Styles.backgroundColor }

    header: CustomToolBar {
        anchors.topMargin: Window.window ? Window.window.contentItem.topInset : 0
        title: "О Компании"
        onBack: () => stackView.pop()
    }

    Rectangle {
        anchors.centerIn: parent
        width: parent.width - 2 * Styles.spacingMedium
        height: 140
        radius: Styles.borderRadius
        color: Styles.cardBackground
        border.color: Styles.disabledColor

        Text {
            anchors.fill: parent
            anchors.margins: Styles.spacingMedium
            text: "О Компании страница. Здесь будет информация о производителе, миссии, истории и ценностях компании."
            font.family: Styles.fontFamily
            font.pixelSize: Styles.fontSizeMedium
            color: Styles.textColor
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
