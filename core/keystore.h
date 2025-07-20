// core/keystore.h
#pragma once
#include <QString>

namespace Keystore {
void saveEncryptedValue(const QString& key, const QString& value);
QString loadEncryptedValue(const QString& key);
}
