import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Styles 1.0
import "components"

Page {
    property StackView stackView
    property bool isLoginMode: true
    property string userEmail: ""

    title: "Личный кабинет"
    background: Rectangle { color: Styles.backgroundColor }

    header: CustomToolBar {
        anchors.topMargin: Window.window ? Window.window.contentItem.topInset : 0
        title: "Личный кабинет"
        onBack: () => stackView.pop()
    }

    Column {
        anchors.centerIn: parent
        spacing: Styles.spacingMedium
        width: parent.width * 0.8

        // Если НЕ вошёл — форма логина/регистрации
        visible: userEmail === ""

        TextField {
            id: emailField
            placeholderText: "E-mail"
            font.family: Styles.fontFamily
            font.pointSize: Styles.fontSizeMedium
            width: parent.width
        }

        TextField {
            id: passwordField
            placeholderText: "Пароль"
            echoMode: TextInput.Password
            font.family: Styles.fontFamily
            font.pointSize: Styles.fontSizeMedium
            width: parent.width
        }

        TextField {
            id: confirmField
            visible: !isLoginMode
            placeholderText: "Повторите пароль"
            echoMode: TextInput.Password
            font.family: Styles.fontFamily
            font.pointSize: Styles.fontSizeMedium
            width: parent.width
        }

        Button {
            text: isLoginMode ? "Войти" : "Зарегистрироваться"
            width: parent.width
            font.family: Styles.fontFamily
            font.pointSize: Styles.fontSizeMedium

            background: Rectangle {
                color: Styles.primaryColor
                radius: Styles.borderRadius
            }

            contentItem: Text {
                text: isLoginMode ? "Войти" : "Зарегистрироваться"
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.family: Styles.fontFamily
                font.pointSize: Styles.fontSizeMedium
            }

            onClicked: {
                if (!emailField.text || !passwordField.text) {
                    console.warn("Поля не заполнены");
                    return;
                }

                if (!isLoginMode && passwordField.text !== confirmField.text) {
                    console.warn("Пароли не совпадают");
                    return;
                }

                userEmail = emailField.text;
                console.log("Пользователь вошёл:", userEmail);
            }
        }

        Button {
            text: isLoginMode ? "Нет аккаунта? Зарегистрируйтесь" : "Уже есть аккаунт? Войти"
            width: parent.width
            background.visible: false
            font.family: Styles.fontFamily
            font.pointSize: Styles.fontSizeSmall
            onClicked: isLoginMode = !isLoginMode
        }
    }

    // Если вошёл — показываем инфу
    Column {
        anchors.centerIn: parent
        spacing: Styles.spacingMedium
        visible: userEmail !== ""
        width: parent.width * 0.8

        Label {
            text: "Вы вошли как: " + userEmail
            font.bold: true
            color: Styles.textColor
            font.family: Styles.fontFamily
            font.pointSize: Styles.fontSizeMedium
        }

        Button {
            text: "Выйти"
            width: parent.width
            font.family: Styles.fontFamily
            font.pointSize: Styles.fontSizeMedium

            background: Rectangle {
                color: Styles.disabledColor
                radius: Styles.borderRadius
            }

            contentItem: Text {
                text: "Выйти"
                color: "white"
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: Styles.fontFamily
                font.pointSize: Styles.fontSizeMedium
            }

            onClicked: {
                userEmail = "";
                emailField.text = "";
                passwordField.text = "";
                confirmField.text = "";
                isLoginMode = true;
            }
        }
    }
}
