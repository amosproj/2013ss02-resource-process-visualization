import QtQuick 2.1
import org.unbugged.amos13 1.0

Item {
    ChildrenList {
        model: DeviceList {
            parentId: acct.location.id
        }
        onCreateChild: hierarchyLoader.source = "DeviceCreate.qml"
        onChildClicked: {
            acct.setDevice(id);
            progressDevice.enable();
            hierarchyLoader.source = "HierarchyDevice.qml"
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
                locations.del(acct.location);
                backToLine();
            }
        }
        LocationProperties {}
        JPButton {
            text: "update"
            width: parent.width
            onClicked: {
                locations.update(acct.location);
            }
        }
    }
}
