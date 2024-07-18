import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

import ActualBtn 1.0
import ImagesHandler 1.0

ApplicationWindow {
    visible: true
    Material.theme: Material.Dark
    Material.accent: Material.Green
    width: 1500
    height: 1000
    minimumHeight: 500
    minimumWidth:  700
    color: "#231057"

    property real btn_size_koef: 7
    property int btn_animation_duration: 100
    property real btn_brightness_koef: 1.05
    property int btn_border_width: 3
    property string btn_border_color: "#FCFBAB"

    property bool reading_section_visible: true
    property bool processing_section_visible: false
    property bool gallery_section_visible: false

    // function onActualBtnTypeChanged(newValue){
    //         labelCount.text = newValue;
    // }
    ActualBtn{
        id: actualBtn
    }

    ImagesHandler {
        id: imageHandler
    }

    Image {
        id: background_img
        anchors.fill: parent
        source: "img/background.png"
        fillMode: Image.Stretch

        Frame {
            id: mainFrame
            width: background_img.width / 1.05
            height: background_img.height / 1.3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: background_img.childrenRect.left

            Rectangle {
                id: rect_center
                color: actualBtn.actualBtnColor
                opacity: 0.9
                anchors.fill: parent
                radius: 5
                Behavior on color {
                    ColorAnimation { duration: btn_animation_duration }
                }

                ColumnLayout {
                    id: column
                    width: mainFrame.width / 5
                    height: mainFrame.height
                    anchors.left: parent.left
                    spacing: 0
                    anchors.verticalCenter: parent.verticalCenter
                    Material.foreground: "black" // font color

                    Button {
                        id: btn_load
                        Layout.preferredWidth: column.width
                        Layout.preferredHeight:column.height / btn_size_koef
                        text: qsTr("Загрузить фото")
                        font.pointSize: 18
                        display: AbstractButton.TextBesideIcon
                        highlighted: false
                        flat: false

                        background: Rectangle {
                            id: btn_load_rectangle
                            anchors.fill: parent
                            color:  actualBtn.getBtnColor(ActualBtn.READING)
                            radius: 20
                            border.width: btn_border_width
                            border.color: actualBtn.actualBtnType === ActualBtn.READING? btn_border_color : btn_load_rectangle.color

                        }

                        MouseArea {
                            id: btn_load_mouseArea;
                            hoverEnabled: true;
                            anchors.fill: parent
                            onClicked: {
                                actualBtn.actualBtnType = ActualBtn.READING;
                                actualBtn.actualBtnTypeChanged();
                            }
                        }

                        states: State {
                            name: "brighter"; when:  btn_load_mouseArea.containsMouse
                            PropertyChanges { target: btn_load_rectangle; color: Qt.lighter(actualBtn.getBtnColor(ActualBtn.READING), btn_brightness_koef) }

                        }

                        transitions: Transition {
                            ColorAnimation { duration: btn_animation_duration }
                        }
                    }

                    Button {
                        id: btn_proceed
                        Layout.preferredWidth: column.width
                        Layout.preferredHeight: column.height / btn_size_koef
                        text: qsTr("Обработанные\n фото")
                        font.pointSize: 18

                        background: Rectangle {
                            id: btn_proceed_rectangle;
                            color: actualBtn.getBtnColor(ActualBtn.PROCESSING)
                            radius: 20
                            border.width: btn_border_width
                            border.color: actualBtn.actualBtnType === ActualBtn.PROCESSING? btn_border_color : btn_proceed_rectangle.color
                        }

                        MouseArea {
                            id: btn_proceed_mouseArea;
                            hoverEnabled: true;
                            anchors.fill: parent;
                            onClicked: {
                                actualBtn.actualBtnType = ActualBtn.PROCESSING;
                                actualBtn.actualBtnTypeChanged();

                            }
                        }

                        states: State {
                            name: "brighter"; when:  btn_proceed_mouseArea.containsMouse
                            PropertyChanges { target: btn_proceed_rectangle; color: Qt.lighter(actualBtn.getBtnColor(ActualBtn.PROCESSING), btn_brightness_koef) }

                        }
                        transitions: Transition {
                            ColorAnimation { duration: btn_animation_duration }
                        }
                    }

                    Button {
                        id: btn_photos
                        Layout.preferredWidth: column.width
                        Layout.preferredHeight: column.height / btn_size_koef
                        text: qsTr("ГАЛЕРЕЯ")
                        font.pointSize: 18

                        background: Rectangle {
                            id: btn_photos_rectangle;
                            color: actualBtn.getBtnColor(ActualBtn.GALLERY)
                            radius: 20
                            border.width: btn_border_width
                            border.color: actualBtn.actualBtnType === ActualBtn.GALLERY? btn_border_color : btn_photos_rectangle.color
                        }

                        MouseArea {
                            id: btn_photos_mouseArea;
                            hoverEnabled: true;
                            anchors.fill: parent;
                            onClicked: {
                                actualBtn.actualBtnType = ActualBtn.GALLERY;
                                actualBtn.actualBtnTypeChanged();
                            }
                        }

                        states: State {
                            name: "brighter"; when:  btn_photos_mouseArea.containsMouse
                            PropertyChanges { target: btn_photos_rectangle; color: Qt.lighter(actualBtn.getBtnColor(ActualBtn.GALLERY), btn_brightness_koef) }

                        }
                        transitions: Transition {
                            ColorAnimation { duration: btn_animation_duration }
                        }
                    }
                }

                Frame {
                    id: func_frame
                    width: 3.5 * mainFrame.width / 5
                    height: mainFrame.height / 1.3
                    anchors.left: column.right
                    anchors.verticalCenter: parent.verticalCenter
                    //color: parent.color

                    Frame{
                        id: reading_frame
                        visible: true
                        anchors.fill: parent
                        //color: parent.color
                        Frame{
                            id: btn_frame
                            height: parent.height / 7
                            width: parent.width
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter

                            Button{
                                id: btn_choose_img
                                text: qsTr("выбрать фото")
                                Material.foreground: "black" // font color
                                width: parent.width / 5
                                height: parent.height / 2
                                anchors.centerIn: parent
                                //anchors.verticalCenter: parent.verticalCenter / 2
                                background: Rectangle{
                                    color: "cyan"
                                    anchors.fill: btn_choose_img
                                }
                                onClicked: {
                                    fileDialog.open();
                                }
                            }
                        }
                        Frame{
                            anchors.top: btn_frame.bottom
                            width: reading_frame.width
                            height: 6 * parent.height / 7
                            //anchors.bottom: reading_frame.bottom


                            ScrollView {
                                   id: scroll
                                   clip: true
                                   anchors.fill: parent
                                   //anchors.margins:
                                   // anchors.top: btn_frame.bottom
                                   // width: parent.width
                                   // height: 2* parent.height / 3
                                   // anchors.horizontalCenter: parent.horizontalCenter
                                   //anchors.bottom: reading_frame.bottom
                                   ListModel{
                                       id: demosModel
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                       ListElement{  src:"img/background.png"; }
                                   }

                                   GridLayout{
                                       anchors.fill: parent
                                       columns: 3
                                       rowSpacing: 10
                                       Repeater{
                                           model: demosModel
                                           Image {
                                               source: src;
                                               Layout.preferredWidth: .3*scroll.width;
                                               sourceSize.width: Layout.preferredWidth
                                               //fillMode: Image.PreserveAspectFit;
                                           }
                                       }
                                   }
                               }

                        }
                    }

                    Frame{
                        id: processing_frame
                        visible: false
                        anchors.fill: parent
                    }

                    Frame{
                        id: gallery_frame
                        visible: false
                        anchors.fill: parent
                    }

                }
            }
        }

    }
    FileDialog {
           id: fileDialog
           title: "Choose a photo"
           folder: shortcuts.home
           selectMultiple: true
           nameFilters: [ "Image files (*.jpg *.png)", "All files (*)" ]
           onAccepted: {
               paths = fileDialog.fileUrls
           }
    }
    Component.onCompleted: {

        //imageHandler.
    }
}
