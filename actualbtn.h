#ifndef ACTUALBTN_H
#define ACTUALBTN_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QColor>
#include <tuple>
#include <vector>

class ActualBtn : public QObject
{
    Q_OBJECT

    Q_PROPERTY (ACTUAL_BTN_TYPE actualBtnType READ getActualBtnType WRITE setActualBtnType NOTIFY actualBtnTypeChanged)
    Q_PROPERTY (QColor actualBtnColor READ getActualBtnColor NOTIFY actualBtnColorChanged)

public:
    explicit ActualBtn(QObject *parent = nullptr);
    ~ActualBtn();

    enum ACTUAL_BTN_TYPE {READING, PROCESSING, GALLERY};
    Q_ENUM(ACTUAL_BTN_TYPE)

    Q_INVOKABLE ACTUAL_BTN_TYPE getActualBtnType() const {return actualBtnType;}
    Q_INVOKABLE void setActualBtnType(ACTUAL_BTN_TYPE type) {actualBtnType = type;}
    Q_INVOKABLE QColor getActualBtnColor() const {return actualBtnColor;}
    Q_INVOKABLE QColor getBtnColor(ACTUAL_BTN_TYPE type);


signals:
    void actualBtnTypeChanged();
    void actualBtnColorChanged();

public slots:
    void updateActualBtnColor();

private:
    ACTUAL_BTN_TYPE actualBtnType;
    QColor  actualBtnColor;
    static std::vector<std::tuple<ACTUAL_BTN_TYPE, QColor>> btnColorAlignment;

};

#endif // ACTUALBTN_H
