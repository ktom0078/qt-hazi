import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1



Item {
    anchors.fill: parent
    objectName: "DiscoveryWindow"

    // signals for the leds
    signal toggleRed();
    signal toggleOrange();
    signal toggleGreen();
    signal toggleBlue();

    property int margin: 10

    RowLayout {
        id: baseGrid
        anchors.fill: parent
        anchors.margins: margin

        // 1. oszlop

        GroupBox {
            Layout.fillHeight: true


            ColumnLayout {
                anchors.fill: parent

                Text {
                    text: "Ledek kapcsolása:";
                }

                CheckBox {
                    id: redCheckBox
                    text: "Piros"
                    onClicked: {
                        toggleRed();
                    }
                }

                CheckBox {
                    id: blueCheckBox
                    text: "Kék"
                    onClicked: {
                        toggleBlue();
                    }
                }
                CheckBox {
                    id: orangeCheckBox
                    text: "Narancssárga"
                    onClicked: {
                        toggleOrange();
                    }
                }

                CheckBox {
                    id: greenCheckBox
                    text: "Zöld"
                    onClicked: {
                        toggleGreen();
                    }
                }

                Text {
                    id:serialLog
                    anchors.top:greenCheckBox.bottom
                    anchors.margins: margin
                    text: "Soros port szöveges log:";
                }

                // Soros port log scrollozható szöveggel
                ScrollView {
                    anchors.top:serialLog.bottom
                    anchors.margins: margin
                    Layout.fillHeight: true

                    // Itt jön a tényleges lista.
                    ListView {
                        id: logHistoryList
                        model: logModel
                        delegate: Row {
                            Text { text: modelData }
                        }
                        // Folyamatos scroll
                        onCountChanged: {
                            logHistoryList.currentIndex = logHistoryList.count - 1;
                        }
                    }
                }

            }
        }

        // 2. oszlop

        GroupBox
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
