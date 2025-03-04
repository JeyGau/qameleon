#ifndef SRC_HOT_RELOAD_HOT_RELOADER_HPP
#define SRC_HOT_RELOAD_HOT_RELOADER_HPP

#include <QQmlApplicationEngine>

namespace qameleon::hot_reload {
class HotReloader : public QObject
{
    Q_OBJECT
public:
    explicit HotReloader(QQmlApplicationEngine* engine, const QString& reloadFilePath, QObject* parent = nullptr);

    bool reload();

private:
    QQmlApplicationEngine* m_engine;
    QString m_reloadFilePath;  // path of the view factory file to reload
    QString m_viewFactoryName = "viewFactory";
    QString m_stackViewName = "applicationStackView";
};
}  // namespace qameleon::hot_reload
#endif  // SRC_HOT_RELOAD_HOT_RELOADER_HPP
