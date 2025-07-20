import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Styles 1.0
import "components"


Page {
    id: subcategoryPage
    property StackView stackView
    property string categoryName: ""
    property var subcategories: []

    background: Rectangle {
        color: Styles.backgroundColor
    }

    header: CustomToolBar {
        anchors.topMargin: Window.window ? Window.window.contentItem.topInset : 0
        title: categoryName
        onBack: () => stackView.pop()
    }

    // Список подкатегорий
    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        Column {
            width: parent.width
            spacing: Styles.spacingMedium
            padding: Styles.spacingMedium

            Repeater {
                model: subcategories

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
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.fill: parent
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                    }

                    onClicked: {
                        const component = Qt.createComponent("ProductListPage.qml")
                        if (component.status === Component.Ready) {
                            stackView.push(component.createObject(stackView, {
                                stackView: stackView,
                                categoryName: categoryName,
                                subcategoryName: modelData.name,
                                products: modelData.products
                            }))
                        } else {
                            console.error("Ошибка загрузки ProductListPage.qml:", component.errorString())
                        }
                    }
                }
            }
        }
    }
}
