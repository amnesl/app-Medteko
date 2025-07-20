pragma Singleton
import QtQuick 2.15

QtObject {
    property bool darkTheme: false

    // Базовая ширина макета (например, 360 — типичная ширина экрана мобильника)
     readonly property int baseWidth: 360

    // Динамический масштаб в зависимости от ширины экрана
    readonly property real scaleFactor: Qt.application.activeWindow
        ? Qt.application.activeWindow.width / baseWidth
        : 1.0

    // Цвета
    property color primaryColor: darkTheme ? "#1E88E5" : "#00669F"
    property color accentColor: darkTheme ? "#29B6F6" : "#007FB1"
    property color textColor: darkTheme ? "#EEEEEE" : "#333333"
    property color backgroundColor: darkTheme ? "#121212" : "#F5F5F5"
    property color cardBackground: darkTheme ? "#1E1E1E" : "#FFFFFF"
    property color disabledColor: darkTheme ? "#555555" : "#999999"
    property color foreground: textColor

    // Шрифт с масштабом
        property int fontSizeLarge: Math.round(18 * scaleFactor)
        property int fontSizeMedium: Math.round(14 * scaleFactor)
        property int fontSizeSmall: Math.round(12 * scaleFactor)

    // Отступы с масштабом
        property int spacingSmall: Math.round(8 * scaleFactor)
        property int spacingMedium: Math.round(16 * scaleFactor)
        property int spacingLarge: Math.round(24 * scaleFactor)

    // Радиус с масштабом
        property int borderRadius: Math.round(6 * scaleFactor)
}
