import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Styles 1.0
import "components"

Page {
    id: productPage
    property StackView stackView
    property string categoryName: ""
    property string subcategoryName: ""
    property var products: []

    background: Rectangle {
        color: Styles.backgroundColor
    }

    header: CustomToolBar {
        anchors.topMargin: Window.window ? Window.window.contentItem.topInset : 0
        title: categoryName + " → " + subcategoryName
        onBack: () => stackView.pop()
    }

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        Column {
            width: parent.width
            spacing: Styles.spacingMedium
            padding: Styles.spacingMedium

            Repeater {
                model: products

                delegate: Button {
                    width: parent.width - 2 * Styles.spacingMedium
                    height: Styles.scaleFactor * 44
                    font.family: Styles.fontFamily
                    font.pixelSize: Styles.fontSizeMedium

                    background: Rectangle {
                        color: Styles.primaryColor
                        radius: Styles.borderRadius
                    }

                    contentItem: Text {
                        text: modelData.name
                        color: "white"
                        font.family: Styles.fontFamily
                        font.pixelSize: Styles.fontSizeMedium
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                    }

                    onClicked: {
                        const component = Qt.createComponent("ProductCardPage.qml")
                        if (component.status === Component.Ready) {
                            stackView.push(component.createObject(stackView, {
                                stackView: stackView,
                                productName: modelData.name,
                                productImage: modelData.image,
                                productDescription: modelData.description,
                                productSpecs: modelData.specs
                            }))
                        } else {
                            console.error("Ошибка загрузки ProductCardPage.qml:", component.errorString())
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        console.log("== ProductListPage loaded ==")
        console.log("categoryName:", categoryName)
        console.log("subcategoryName:", subcategoryName)
        console.log("products:", products)
        if (!products || products.length === undefined) {
            console.warn("ОШИБКА: products не массив или пусто!");
        }
    }
}
