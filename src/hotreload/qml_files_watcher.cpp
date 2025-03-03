#include "qml_files_watcher.hpp"

#include <QDateTime>
#include <QDirIterator>

using namespace qameleon::hot_reload;

QmlFilesWatcher::QmlFilesWatcher(uint64_t watchDelay, QObject* parent)
    : QObject(parent), m_watchDelay(watchDelay)
{
    connect(&m_watcher,
            &QFileSystemWatcher::fileChanged,
            this,
            &QmlFilesWatcher::onFileChanged);
    connect(&m_watcher,
            &QFileSystemWatcher::directoryChanged,
            this,
            &QmlFilesWatcher::onDirectoryChanged);
}

void QmlFilesWatcher::onFileChanged(const QString& path)
{
    // Prevent multiple reloads in a short time (VSCode emits multiple fileChanged
    // signals)
    if (!m_lastSaveTime.isNull()
        && QDateTime::currentDateTime() < m_lastSaveTime.addMSecs(m_watchDelay)) {
        return;
    }

    m_lastSaveTime = QDateTime::currentDateTime();

    emit qmlFileChanged(path);
}

void QmlFilesWatcher::onDirectoryChanged(const QString& path)
{
    watch(path);
}

void QmlFilesWatcher::watch(const QString& directoryPath)
{
    m_watcher.addPath(directoryPath);
    // add directories to watch
    QDirIterator itDir(
        directoryPath, QDir::Dirs | QDir::NoDotAndDotDot, QDirIterator::Subdirectories);
    while (itDir.hasNext()) {
        QString dirPath = itDir.next();
        if (m_watcher.directories().contains(dirPath)) {
            continue;
        }

        m_watcher.addPath(dirPath);
    }

    // add files to watch
    QDirIterator it(directoryPath,
                    QStringList{"*.qml", "*.js", "qmldir"},
                    QDir::Files,
                    QDirIterator::Subdirectories);
    while (it.hasNext()) {
        QString filePath = QFileInfo(it.next()).absoluteFilePath();
        if (m_watcher.files().contains(filePath)) {
            continue;
        }

        m_watcher.addPath(filePath);
    }
}
