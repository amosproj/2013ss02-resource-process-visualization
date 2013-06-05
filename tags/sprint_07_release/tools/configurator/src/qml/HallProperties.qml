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
        Component.onCompleted: text = acct.hall.name
        onTextChanged: acct.hall.name = text
    }
    JPText {
        text: "Staff"
    }
    TextField {
        Component.onCompleted: text = acct.hall.staff
        onTextChanged: acct.hall.staff = text
        validator: IntValidator {}
    }
    JPText {
        text: "Capacity"
    }
    TextField {
        Component.onCompleted: text = acct.hall.capacity
        onTextChanged: acct.hall.capacity = text
        validator: IntValidator {}
    }
    JPText {
        text: "Path"
    }
    TextField {
        Component.onCompleted: text = acct.hall.path
        onTextChanged: acct.hall.path = text
    }
}
