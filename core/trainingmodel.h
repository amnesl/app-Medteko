#pragma once

#include <QAbstractListModel>
#include <QVector>

struct TrainingItem {
    QString title;
    QString description;
    QString file;
};

class TrainingModel : public QAbstractListModel {
    Q_OBJECT

public:
    explicit TrainingModel(QObject *parent = nullptr);

    enum Roles {
        TitleRole = Qt::UserRole + 1,
        DescriptionRole,
        FileRole
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<TrainingItem> m_items;
    void loadJson();
};
