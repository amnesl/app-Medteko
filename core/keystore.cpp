// core/keystore.cpp
#include "keystore.h"
#include "security.h"
#include <QSettings>

namespace Keystore {

const QByteArray kSecretKey = "offline_secure_key";

void saveEncryptedValue(const QString& key, const QString& value) {
    QByteArray encrypted = Security::simpleEncrypt(value.toUtf8(), kSecretKey);
    QSettings settings("medteko", "app_secure");
    settings.setValue(key, QString(encrypted.toBase64()));
}

QString loadEncryptedValue(const QString& key) {
    QSettings settings("medteko", "app_secure");
    QByteArray base64 = settings.value(key).toString().toUtf8();
    QByteArray decrypted = Security::simpleDecrypt(QByteArray::fromBase64(base64), kSecretKey);
    return QString::fromUtf8(decrypted);
}

}
