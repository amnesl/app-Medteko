import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    visible: true
    width: 360; height: 640
    title: qsTr("Med Navigation")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: HomePage { stackView: stack }
    }
}
