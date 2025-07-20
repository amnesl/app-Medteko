#include "catalogloader.h"
#include <QFile>
#include <QJsonDocument>
#include <QDebug>

CatalogLoader::CatalogLoader(QObject *parent) : QObject(parent) {
    loadCatalog();
}

void CatalogLoader::loadCatalog() {
    QFile file(":/qml/assets/catalog.json");
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Can't open catalog.json";
        return;
    }

    const QByteArray data = file.readAll();
    const QJsonDocument doc = QJsonDocument::fromJson(data);
    if (!doc.isArray()) {
        qWarning() << "catalog.json is not a valid array";
        return;
    }

    m_categories = doc.array();
    emit categoriesChanged();
}

QJsonArray CatalogLoader::categories() const {
    return m_categories;
}
