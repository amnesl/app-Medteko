#include "trainingmodel.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

TrainingModel::TrainingModel(QObject *parent)
    : QAbstractListModel(parent) {
    loadJson();
}

int TrainingModel::rowCount(const QModelIndex &) const {
    return m_items.size();
}

QVariant TrainingModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() < 0 || index.row() >= m_items.size())
        return {};

    const TrainingItem &item = m_items[index.row()];
    switch (role) {
    case TitleRole: return item.title;
    case DescriptionRole: return item.description;
    case FileRole: return item.file;
    default: return {};
    }
}

QHash<int, QByteArray> TrainingModel::roleNames() const {
    return {
        { TitleRole, "title" },
        { DescriptionRole, "description" },
        { FileRole, "file" }
    };
}

void TrainingModel::loadJson() {
    QFile file(":/resource/data/training.json");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Не удалось открыть training.json";
        return;
    }

    QByteArray jsonData = file.readAll();
    QJsonParseError parseError;
    QJsonDocument doc = QJsonDocument::fromJson(jsonData, &parseError);
    if (parseError.error != QJsonParseError::NoError) {
        qWarning() << "Ошибка парсинга training.json:" << parseError.errorString();
        return;
    }

    if (!doc.isArray()) {
        qWarning() << "training.json не является массивом";
        return;
    }

    QJsonArray arr = doc.array();

    beginResetModel();
    m_items.clear();

    for (const QJsonValue &value : arr) {
        if (!value.isObject()) continue;
        QJsonObject obj = value.toObject();
        TrainingItem item;
        item.title = obj.value("title").toString();
        item.description = obj.value("description").toString();
        item.file = obj.value("file").toString();
        m_items.append(item);
    }

    endResetModel();
}
