#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>

#include "catalogloader.h"
#include "trainingmodel.h"
#include "core/security.h"
#include "core/keystore.h"

using namespace Qt::StringLiterals;

int real_main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    CatalogLoader catalog;
    TrainingModel trainingModel;

    // сохранить ключ
    Keystore::saveEncryptedValue("access_token", "ABC123TOKEN");
    // прочитать ключ
    QString token = Keystore::loadEncryptedValue("access_token");
    qDebug() << "Decrypted token:" << token;

    engine.rootContext()->setContextProperty("catalogLoader", &catalog);
    engine.rootContext()->setContextProperty("trainingModel", &trainingModel);
    qmlRegisterSingletonType(QUrl("qrc:/qml/Styles.qml"), "Styles", 1, 0, "Styles");

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

int secure_main_wrapper(int argc, char *argv[]) {
    if (Security::isDebuggerPresent()) {
        qCritical("Debugger detected. Exiting...");
        return 1;
    }

    QString catalogPath = ":/qml/assets/catalog.json";
    QString hash = Security::fileSha256(catalogPath);
    qDebug() << "Catalog hash:" << hash;

    // if (hash != "EXPECTED_HASH") {
    //     qCritical("Integrity check failed!");
    //     return 1;
    // }

    return real_main(argc, argv);
}

int main(int argc, char *argv[]) {
    return secure_main_wrapper(argc, argv);
}
