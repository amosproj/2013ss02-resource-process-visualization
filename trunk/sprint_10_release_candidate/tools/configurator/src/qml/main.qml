import QtQuick 2.1
import QtQuick.Controls 1.0
import org.unbugged.amos13 1.0

ApplicationWindow {
	title: "AMOS dummy data creator"
    width: 700
    height: 600
	color: "#222222"
	Item {
		id: def
		property int fontSize: 16
		property color textColor: "white"
	}
    
	Item {
		height: parent.height / 3 * 2
		anchors.top: parent.top
		width: parent.width
		Loader {
			id: mainLoader
			anchors.fill: parent
			source: "ConnectForm.qml"
		}
	}
	
	Rectangle {
		anchors.bottom: parent.bottom
		height: parent.height / 3
		width: parent.width
		border.width: 2
		border.color: "#333333"
		radius: 2
		color: "#00000000"
		ScrollView {
			anchors.fill: parent
			frameVisible: false
			ListView {
				height: parent.height
				model: LogModel {}
				delegate: Label{
					//text: msg
					text: message
					color: "white"
				}
			}
		}
	}
	
}
