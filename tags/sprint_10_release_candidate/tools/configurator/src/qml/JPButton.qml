import QtQuick 2.1
import QtQuick.Controls 1.0

MouseArea {
	property color baseColor: "#8989e5"
	property color currentColor: enabled ? baseColor : "#414141"
	property string text: ""
	property int padding: 10
	width: childrenRect.width
	height: childrenRect.height
	Rectangle {
		color: parent.currentColor
		width: {
			if(parent.width > childrenRect.width + 2*parent.padding){
				parent.width
			}else childrenRect.width + 2*parent.padding;
		}
		height: childrenRect.height + parent.padding
		Label {
			x: parent.parent.width / 2 - width / 2
			y: parent.parent.padding / 2
			text: parent.parent.text
			color: parent.parent.enabled ? "black" : "white"
		}
	}

	hoverEnabled: true
	onEntered: {
		currentColor.r = baseColor.r * 1.1;
		currentColor.g = baseColor.g * 1.1;
		currentColor.b = baseColor.b * 1.1;
	}
	onExited: currentColor = baseColor
	function enable(){
		enabled = true;
		currentColor = baseColor;
	}
	function disable(){
		enabled = false;
		currentColor = "#414141";
	}
}