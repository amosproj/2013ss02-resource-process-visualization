import QtQuick 2.1
import QtQuick.Controls 1.0

Item{
	anchors.fill: parent

	Column {
		anchors {
			left: parent.left
			leftMargin: 5
			top: parent.top
			topMargin: 5
		}
		spacing: 5
		TableOverview {}
		JPButton {
			text: "Load test data"
			onClicked: {
				database.loadTestData();
			}
		}
	}
	TableControl {
		anchors.right: parent.right
		anchors.rightMargin: 5
	}
	
}