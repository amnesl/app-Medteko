
#include "productmodel.h"

ProductModel::ProductModel(QObject* parent) : QAbstractListModel(parent) {}

int ProductModel::rowCount(const QModelIndex&) const {
    return products_.size();
}

QVariant ProductModel::data(const QModelIndex& index, int role) const {
    if (!index.isValid() || index.row() >= products_.size())
        return {};
    if (role == NameRole)
        return products_.at(index.row());
    return {};
}

QHash<int, QByteArray> ProductModel::roleNames() const {
    return { { NameRole, "name" } };
}

void ProductModel::setProducts(const QStringList& products) {
    beginResetModel();
    products_ = products;
    endResetModel();
}
