
#pragma once

#include <QAbstractListModel>
#include <QStringList>

class ProductModel : public QAbstractListModel {
    Q_OBJECT
public:
    enum Roles { NameRole = Qt::UserRole + 1 };

    ProductModel(QObject* parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    void setProducts(const QStringList& products);

private:
    QStringList products_;
};
