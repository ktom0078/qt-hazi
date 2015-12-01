#ifndef SERIALCOMMUNICATION
#define SERIALCOMMUNICATION

#include <QObject>
#include <QtSerialPort/QSerialPort>
#include "MainWindowCppSide.h"

class SerialComm : public QObject
{
    Q_OBJECT

public:
    SerialComm(MainWindowCppSide* MainWindow);
    ~SerialComm() = default;
    void setMainWindowToSerial(MainWindowCppSide* MainWind);
    QString getSerialDataBuff();

private slots:
    void readData();
    void ledRedEntryHandler();
    void ledBlueEntryHandler();
    void ledOrangeEntryHandler();
    void ledGreenEntryHandler();
    void configSavedHandler();
signals:
    void serialDataAvailable(QString data);

private:
    QSerialPort* serial;
    MainWindowCppSide*  mainWindowFromSerial;
    QString serialDataBuff;
};


#endif // SERIALCOMMUNICATION

