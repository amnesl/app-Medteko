
import QtQuick 2.15
import QtQuick.Controls 2.15
import Styles 1.0

Page {
    property StackView stackView

    header: ToolBar {
        ToolButton {
            text: "← Назад"
            onClicked: stackView.pop()
        }
        Label {
            text: "Выход"
            anchors.centerIn: parent
        }
    }

    Label {
        anchors.centerIn: parent
        text: "Выход страница"
    }
}
