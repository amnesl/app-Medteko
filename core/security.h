#pragma once
#include <QString>
#include <QByteArray>

namespace Security {
    QByteArray simpleEncrypt(const QByteArray& data, const QByteArray& key);
    QByteArray simpleDecrypt(const QByteArray& data, const QByteArray& key);
    QString fileSha256(const QString& filePath);
    bool isDebuggerPresent();
}