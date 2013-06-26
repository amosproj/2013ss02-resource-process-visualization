import QtQuick 2.1
import QtQuick.Controls 1.0
import org.unbugged.amos13 1.0

Column {
    anchors.centerIn: parent
    spacing: 5
    LineProperties {}
    JPButton {
        text: "Create"
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            lines.insert(acct.line);
            backToHall();
        }
    }
}
