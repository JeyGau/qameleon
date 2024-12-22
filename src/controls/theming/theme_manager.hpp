#ifndef CB788845_75DE_4D48_85EA_FF341446E4C5
#define CB788845_75DE_4D48_85EA_FF341446E4C5

// ThemeManager.h
#include <QObject>

namespace qameleon::theming {

class ThemeManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(QObject* theme READ theme WRITE setTheme NOTIFY themeChanged)

public:
    explicit ThemeManager(QObject* parent = nullptr);

    QObject* theme() const;
    void setTheme(QObject* theme);

signals:
    void themeChanged();
private:
    QObject* m_theme;
};

}



#endif /* CB788845_75DE_4D48_85EA_FF341446E4C5 */
