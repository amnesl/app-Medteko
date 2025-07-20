import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Styles 1.0
import "components"

Page {
    id: productCardPage
    property StackView stackView
    property string productName: ""
    property string productImage: ""
    property string productDescription: ""
    property var productSpecs: []

    background: Rectangle {
        color: Styles.backgroundColor
    }

    header: CustomToolBar {
        anchors.topMargin: Window.window ? Window.window.contentItem.topInset : 0
        title: productName.toUpperCase()
        onBack: () => stackView.pop()
    }

    ScrollView {
        anchors.fill: parent

        Column {
            width: parent.width
            spacing: Styles.spacingLarge
            padding: Styles.spacingMedium

            Rectangle {
                width: parent.width - 2 * Styles.spacingMedium
                height: Math.round(220 * Styles.scaleFactor)
                radius: Styles.borderRadius
                color: Styles.cardBackground
                border.color: Styles.disabledColor
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    anchors.fill: parent
                    anchors.margins: Math.round(10 * Styles.scaleFactor)
                    source: productImage
                    fillMode: Image.PreserveAspectFit
                }
            }

            Column {
                spacing: Styles.spacingSmall

                Text {
                    text: "Описание"
                    font.bold: true
                    font.pixelSize: Styles.fontSizeMedium + Math.round(2 * Styles.scaleFactor)
                    color: Styles.textColor
                }

                Text {
                    text: productDescription
                    wrapMode: Text.WordWrap
                    width: productCardPage.width - 2 * Styles.spacingMedium
                    color: Styles.textColor
                    font.pixelSize: Styles.fontSizeMedium
                }

                Text {
                    text: "Характеристики"
                    font.bold: true
                    font.pixelSize: Styles.fontSizeMedium + Math.round(2 * Styles.scaleFactor)
                    color: Styles.textColor
                    padding: Styles.spacingSmall
                }

                Column {
                    spacing: Styles.spacingSmall

                    Repeater {
                        model: productSpecs
                        delegate: Text {
                            text: "- " + modelData
                            wrapMode: Text.WordWrap
                            color: Styles.textColor
                            font.pixelSize: Styles.fontSizeSmall + Math.round(1 * Styles.scaleFactor)
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        console.log("== ProductCardPage loaded ==")
        console.log("productName:", productName)
        console.log("productImage:", productImage)
        console.log("productDescription:", productDescription)
        console.log("productSpecs:", productSpecs)
    }
}
