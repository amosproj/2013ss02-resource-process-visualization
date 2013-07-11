import QtQuick 2.1
import QtQuick.Controls 1.0

Grid {
    columns: 2
    spacing: 5
    anchors.horizontalCenter: parent.horizontalCenter
    JPText {
        text: "Name"
    }
    TextField {
        Component.onCompleted: text = acct.location.name
        onTextChanged: acct.location.name = text
    }
}
