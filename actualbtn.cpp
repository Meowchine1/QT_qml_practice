#include "actualbtn.h"

std::vector<std::tuple<ActualBtn::ACTUAL_BTN_TYPE, QColor>> ActualBtn:: btnColorAlignment = {
    {ActualBtn::ACTUAL_BTN_TYPE::READING, QColor(34, 12, 118)},
    {ActualBtn::ACTUAL_BTN_TYPE::PROCESSING, QColor(231, 223, 250)},
    {ActualBtn::ACTUAL_BTN_TYPE::GALLERY, QColor(253, 254, 214)}
};


ActualBtn::ActualBtn(QObject *parent)
    : QObject{parent}
{

    actualBtnType = ACTUAL_BTN_TYPE::READING;
    updateActualBtnColor();
    QObject::connect(this, SIGNAL(actualBtnTypeChanged()),this, SLOT(updateActualBtnColor()));

}

ActualBtn::~ActualBtn() {}

void ActualBtn::updateActualBtnColor(){

    for (const auto& tuple : btnColorAlignment) {
        if (std::get<0>(tuple) == actualBtnType) {
            actualBtnColor = std::get<1>(tuple);
            emit actualBtnColorChanged();
            break;
        }
    }

}

QColor ActualBtn::getBtnColor(ActualBtn::ACTUAL_BTN_TYPE type){

    for (const auto& tuple : btnColorAlignment) {
        if (std::get<0>(tuple) == type) {
            return std::get<1>(tuple);
            break;
        }
    }
}


// // define the singleton type provider function (callback).
// static QObject *actualBtn_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
// {
//     Q_UNUSED(engine)
//     Q_UNUSED(scriptEngine)
//     return ActualBtn::getInstance();
// }


