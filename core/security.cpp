#include "security.h"
#include <QCryptographicHash>
#include <QFile>
#include <QCoreApplication>

#ifdef Q_OS_WIN
#include <windows.h>
#endif

namespace Security {

QByteArray simpleEncrypt(const QByteArray& data, const QByteArray& key) {
    QByteArray result = data;
    for (int i = 0; i < result.size(); ++i)
        result[i] = result[i] ^ key[i % key.size()];
    return result;
}

QByteArray simpleDecrypt(const QByteArray& data, const QByteArray& key) {
    return simpleEncrypt(data, key);  // XOR is symmetric
}

QString fileSha256(const QString& filePath) {
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly)) return {};
    QCryptographicHash hash(QCryptographicHash::Sha256);
    hash.addData(&file);
    return QString(hash.result().toHex());
}

bool isDebuggerPresent() {
#ifdef Q_OS_WIN
    return IsDebuggerPresent();
#else
    return false;
#endif
}

}
