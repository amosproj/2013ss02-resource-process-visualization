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
        Component.onCompleted: text = acct.line.name
        onTextChanged: acct.line.name = text
    }
    JPText {
        text: "Series"
    }
    TextField {
        Component.onCompleted: text = acct.line.series
        onTextChanged: acct.line.series = text
    }
    JPText {
        text: "Path"
    }
    TextField {
        Component.onCompleted: text = acct.line.path
        onTextChanged: acct.line.path = text
    }
    JPText {
        text: "Capacity"
    }
    TextField {
        Component.onCompleted: text = acct.line.capacity
        onTextChanged: acct.line.capacity = text
        validator: IntValidator {}
    }
}
