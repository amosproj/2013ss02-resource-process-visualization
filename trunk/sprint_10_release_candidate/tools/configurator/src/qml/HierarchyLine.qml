import QtQuick 2.1
import org.unbugged.amos13 1.0

Item {
    ChildrenList {
        model: LocationList {
            parentId: acct.line.id
        }
        onCreateChild: hierarchyLoader.source = "LocationCreate.qml"
        onChildClicked: {
            acct.setLocation(id);
            progressLocation.enable();
            hierarchyLoader.source = "HierarchyLocation.qml"
        }
    }
    Column {
        spacing: 5
        width: parent.width / 2 - 15
        anchors {
            right: parent.right
            rightMargin: 5
            top: parent.top
            topMargin: 5
        }
        JPButton {
            text: "X"
            width: parent.width
            baseColor: "#e58989"
            onClicked: {
                lines.del(acct.line);
                backToHall();
            }
        }
        LineProperties {}
        JPButton {
            text: "update"
            width: parent.width
            onClicked: {
                lines.update(acct.line);
            }
        }
    }
}
