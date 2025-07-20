import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Styles 1.0
import "components"

Page {
    id: categoryPage
    property StackView stackView
    title: "Категории"
    background: Rectangle { color: Styles.backgroundColor }

    header: CustomToolBar {
        anchors.topMargin: Window.window ? Window.window.contentItem.topInset : 0
        title: "Категории"
        onBack: () => stackView.pop()
    }

    Column {
        anchors.centerIn: parent
        spacing: Styles.spacingMedium

        Repeater {
            model: catalogLoader.categories

            delegate: Button {
                text: modelData.name
                width: 220
                height: 44
                font.family: Styles.fontFamily
                font.pointSize: Styles.fontSizeMedium

                background: Rectangle {
                    color: Styles.primaryColor
                    radius: Styles.borderRadius
                }

                contentItem: Text {
                    text: modelData.name
                    color: "white"
                    font.family: Styles.fontFamily
                    font.pointSize: Styles.fontSizeMedium
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.fill: parent
                }

                onClicked: {
                    const component = Qt.createComponent("SubcategoryPage.qml")
                    if (component.status === Component.Ready) {
                        const page = component.createObject(stackView, {
                            stackView: stackView,
                            categoryName: modelData.name,
                            subcategories: modelData.subcategories
                        })
                        stackView.push(page)
                    } else {
                        console.error("Ошибка загрузки SubcategoryPage.qml:", component.errorString())
                    }
                }
            }
        }
    }
}
