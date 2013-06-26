import QtQuick 2.1
import QtQuick.Controls 1.0
import org.unbugged.amos13 1.0

Item {
	anchors.fill: parent
	Column {
		spacing: 5
		height: parent.height
		width: parent.width / 3 * 2
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.top: parent.top
		anchors.topMargin: 5
        JPList {
            height: parent.height / 3 * 2
            width: parent.width
            model: FactoryList {}
            onClicked: {
                acct.setFactory(id);
                progressFactory.enable();
                hierarchyLoader.source = "HierarchyFactory.qml";
            }
        }

		JPButton {
			text: "+"
			baseColor: "#99e589"
			width: parent.width
			onClicked: hierarchyLoader.source = "FactoryCreate.qml"
		}
	}
}
