import QtQuick 2.1
import QtQuick.Controls 1.0

Grid {
    columns: 2
    spacing: 5
    anchors.horizontalCenter: parent.horizontalCenter
    JPText {
        text: "Serial"
    }
    TextField {
        Component.onCompleted: text = acct.device.serial
        onTextChanged: acct.device.serial = text
    }
    JPText {
        text: "Sector"
    }
    TextField {
        Component.onCompleted: text = acct.device.sector
        onTextChanged: acct.device.sector = text
    }
}
