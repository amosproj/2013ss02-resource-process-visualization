import QtQuick 2.1
import QtQuick.Controls 1.0
import org.unbugged.amos13 1.0

Item {
    ChildrenList {
        model: LineList {
            parentId: acct.hall.id
        }
        onCreateChild: hierarchyLoader.source = "LineCreate.qml"
        onChildClicked: {
            acct.setLine(id);
            progressLine.enable();
            hierarchyLoader.source = "HierarchyLine.qml"
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
                halls.del(acct.hall);
                backToFactory();
            }
        }
        HallProperties {}
        JPButton {
            text: "update"
            width: parent.width
            onClicked: {
                halls.update(acct.hall);
            }
        }
        TextField {
            id: lineFile
            width: parent.width
        }
        JPButton {
            text: "read plan"
            width: parent.width
            onClicked: {
                lines.createLineList(acct.hall.id, lineFile.text);
            }
        }
    }
}
