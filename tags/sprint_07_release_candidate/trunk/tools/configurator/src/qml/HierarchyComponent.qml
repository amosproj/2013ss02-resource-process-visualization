import QtQuick 2.1
import org.unbugged.amos13 1.0

Item {
    Column {
        spacing: 5
        width: parent.width / 2
        anchors.horizontalCenter: parent.horizontalCenter
        JPButton {
            text: "X"
            width: parent.width
            baseColor: "#e58989"
            onClicked: {
                components.del(acct.component);
                backToDevice();
            }
        }
        ComponentProperties {}
        JPButton {
            text: "update"
            width: parent.width
            onClicked: {
                components.update(acct.component);
            }
        }
    }
}
