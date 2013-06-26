import QtQuick 2.1
import QtQuick.Controls 1.0
import org.unbugged.amos13 1.0

Item {
    ChildrenList {
        onChildClicked: {
            acct.setHall(id)
            progressHall.enable();
            hierarchyLoader.source = "HierarchyHall.qml"
        }
        onCreateChild: hierarchyLoader.source = "HallCreate.qml"

        model: HallList {
            parentId: acct.factory.id
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
				factories.del(acct.factory);
				backToGlobal();
			}
		}
		FactoryProperties {
			id: properties
		}
		JPButton {
			text: "update"
			width: parent.width
			onClicked: {
				factories.update(acct.factory);
			}
		}
        TextField {
            id: hallFile
            width: parent.width
        }
        JPButton {
            text: "read plan"
            width: parent.width
            onClicked: {
                halls.createHallList(acct.factory.id, hallFile.text);
            }
        }
	}
}
