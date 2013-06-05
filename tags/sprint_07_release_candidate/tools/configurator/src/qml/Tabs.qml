import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

TabView {
	anchors.fill: parent
    currentIndex: 1
	Tab {
		title: "Summary"
		Summary {
		}
	}
	Tab {
		title: "Hierarchy"
		Hierarchy {
		}
    }

	style: TabViewStyle {
		frameOverlap: 1
		tab: Rectangle {
			color: tab.selected ? "#333333" :"#444444"
			border.color:  "white"
			implicitWidth: Math.max(text.width + 4, 80)
			implicitHeight: 20
			radius: 2
			Text {
				id: text
				anchors.centerIn: parent
				text: tab.title
				color: tab.selected ? "white" : "lightgray"
			}
		}
		frame: Rectangle { color: "#222222" }
    }
}
