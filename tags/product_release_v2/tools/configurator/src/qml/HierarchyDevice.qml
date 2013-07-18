import QtQuick 2.1
import org.unbugged.amos13 1.0

Item {
    ChildrenList {
        model: ComponentList {
            parentId: acct.device.id
        }
        onCreateChild: hierarchyLoader.source = "ComponentCreate.qml"
        onChildClicked: {
            acct.setComponent(id);
            progressComponent.enable();
            hierarchyLoader.source = "HierarchyComponent.qml"
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
                devices.del(acct.device);
                backToLocation();
            }
        }
        DeviceProperties {}
        JPButton {
            text: "update"
            width: parent.width
            onClicked: {
                devices.update(acct.device);
            }
        }
    }
}
