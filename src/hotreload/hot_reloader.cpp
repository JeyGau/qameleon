#include "hot_reloader.hpp"
#include <QDebug>

#include <QQmlComponent>

using namespace qameleon::hot_reload;

HotReloader::HotReloader(QQmlApplicationEngine* engine, const QString& reloadFilePath, QObject* parent)
    : QObject(parent), m_engine(engine), m_reloadFilePath(reloadFilePath)
{}

bool HotReloader::reload()
{
    m_engine->clearComponentCache();

    if (m_engine->rootObjects().isEmpty()) {
        qCritical() << "QML engine has no root objects. Please check that QML root file is loaded";
        return false;
    }

    auto stackView =
        m_engine->rootObjects().first()->findChild<QObject*>(m_stackViewName);
    if (!stackView) {
        qCritical() << "Could not find ApplicationStackView. Please make sure your QML root file has ApplicationStackView";
        return false;
    }

    QQmlComponent component(m_engine, QUrl(m_reloadFilePath));
    if (component.status() != QQmlComponent::Status::Ready) {
        qCritical() << "Could not find view factory at path" << m_reloadFilePath;
        return false;
    }

    auto newViewFactory = component.create(QQmlEngine::contextForObject(stackView));
    if (!newViewFactory) {
        qCritical() << "Could not create view factory from path" << m_reloadFilePath;
        return false;
    }

    if (!stackView->property(m_viewFactoryProperty.toUtf8()).isValid()) {
        qCritical() << "Could not find view factory property" << m_viewFactoryProperty;
    }

    newViewFactory->setParent(stackView);
    stackView->setProperty(m_viewFactoryProperty.toUtf8(),
                           QVariant::fromValue(newViewFactory));

    return true;
}
