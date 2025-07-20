import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Styles 1.0
import "components"

Page {
    id: home
    property StackView stackView
    title: "Главная"
    background: Rectangle { color: Styles.backgroundColor }

    header: CustomToolBar {
        anchors.topMargin: Window.window ? Window.window.contentItem.topInset : 0
        title: "Главная"
    }

    Column {
        anchors.centerIn: parent
        spacing: Styles.spacingMedium

        Repeater {
            model: [
                { label: "Категории", page: "CategoryPage.qml" },
                { label: "О Компании", page: "AboutPage.qml" },
                { label: "Обучение", page: "TrainingPage.qml" },
                { label: "Личный кабинет", page: "ProfilePage.qml" }
            ]

            delegate: Button {
                text: modelData.label
                font.family: Styles.fontFamily
                font.pointSize: Styles.fontSizeMedium
                width: 220
                height: 44

                background: Rectangle {
                    color: Styles.primaryColor
                    radius: Styles.borderRadius
                }

                contentItem: Text {
                    text: modelData.label
                    font.family: Styles.fontFamily
                    font.pointSize: Styles.fontSizeMedium
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.fill: parent
                }

                onClicked: stackView.push(Qt.resolvedUrl(modelData.page), { stackView: stackView })
            }
        }

        Button {
            text: "Выход"
            width: 220
            height: 44
            font.family: Styles.fontFamily
            font.pointSize: Styles.fontSizeMedium

            background: Rectangle {
                color: Styles.disabledColor
                radius: Styles.borderRadius
            }

            contentItem: Text {
                text: "Выход"
                font.family: Styles.fontFamily
                font.pointSize: Styles.fontSizeMedium
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
            }

            onClicked: Qt.quit()
        }
    }
}
