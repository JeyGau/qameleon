#include <QDateTime>
#include <QFileSystemWatcher>

#ifndef SRC_HOT_RELOAD_QML_FILES_WATCHER_HPP
#define SRC_HOT_RELOAD_QML_FILES_WATCHER_HPP

namespace qameleon::hot_reload {

class QmlFilesWatcher : public QObject
{
    Q_OBJECT
public:
    explicit QmlFilesWatcher(
        uint64_t watchDelay = 100, QObject* parent = nullptr);

    void watch(const QString& directoryPath);

signals:
    void qmlFileChanged(const QString& path);

private:
    void onFileChanged(const QString& path);
    void onDirectoryChanged(const QString& path);

    QFileSystemWatcher m_watcher;
    QDateTime m_lastSaveTime;
    uint64_t m_watchDelay;
};

}  // namespace qameleon::hot_reload
#endif  // SRC_HOT_RELOAD_QML_FILES_WATCHER_HPP
