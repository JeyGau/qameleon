#include "theme_manager.hpp"

namespace qameleon::theming {
ThemeManager::ThemeManager(QObject* parent)
    : QObject(parent), m_theme(nullptr), m_engine(new QQmlEngine(this)) {
}

QObject* ThemeManager::theme() const {
    return m_theme;
}

void ThemeManager::setTheme(QObject* theme) {
    if (m_theme != theme) {
        m_theme = theme;
        emit themeChanged();
    }
}
}