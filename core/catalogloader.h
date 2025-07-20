#pragma once
#include <QObject>
#include <QJsonArray>

class CatalogLoader : public QObject {
    Q_OBJECT
    Q_PROPERTY(QJsonArray categories READ categories NOTIFY categoriesChanged)

public:
    explicit CatalogLoader(QObject *parent = nullptr);
    QJsonArray categories() const;

signals:
    void categoriesChanged();

private:
    QJsonArray m_categories;
    void loadCatalog();
};
