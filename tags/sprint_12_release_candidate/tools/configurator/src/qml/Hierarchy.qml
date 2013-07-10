import QtQuick 2.1
import org.unbugged.amos13 1.0

Item {
	anchors.fill: parent
	function backToGlobal(){
		acct.resetFactory();
        acct.resetHall();
        acct.resetLine();
        acct.resetLocation();
        acct.resetDevice();
        acct.resetComponent();
		progressFactory.disable();
        progressHall.disable();
        progressLine.disable();
        progressLocation.disable();
        progressDevice.disable();
        progressComponent.disable();
		hierarchyLoader.source = "HierarchyGlobal.qml"
	}
    function backToFactory(){
        acct.resetHall();
        acct.resetLine();
        acct.resetLocation();
        acct.resetDevice();
        acct.resetComponent();
        progressHall.disable();
        progressLine.disable();
        progressLocation.disable();
        progressDevice.disable();
        progressComponent.disable();
        hierarchyLoader.source = "HierarchyFactory.qml"
    }
    function backToHall(){
        acct.resetLine();
        acct.resetLocation();
        acct.resetDevice();
        acct.resetComponent();
        progressLine.disable();
        progressLocation.disable();
        progressDevice.disable();
        progressComponent.disable();
        hierarchyLoader.source = "HierarchyHall.qml"
    }
    function backToLine(){
        acct.resetLocation();
        acct.resetDevice();
        acct.resetComponent();
        progressLocation.disable();
        progressDevice.disable();
        progressComponent.disable();
        hierarchyLoader.source = "HierarchyLine.qml"
    }
    function backToLocation(){
        acct.resetDevice();
        acct.resetComponent();
        progressDevice.disable();
        progressComponent.disable();
        hierarchyLoader.source = "HierarchyLocation.qml"
    }
    function backToDevice(){
        acct.resetComponent();
        progressComponent.disable();
        hierarchyLoader.source = "HierarchyDevice.qml"
    }

	Row {
		id: progressBar
		Progress {
			id: acct
		}
		anchors {
			left: parent.left
			top: parent.top
			topMargin: 5
			leftMargin: 5
		}
		JPButton {
			id: progressGlobal
			text: "Global"
			baseColor: "#e6bf8a"
			onClicked: backToGlobal()
		}
		JPButton {
			id: progressFactory
			text: "Factory"
			baseColor: "#e6bf8a"
			enabled: false
            onClicked: backToFactory()
		}
        JPButton {
            id: progressHall
            text: "Hall"
            baseColor: "#e6bf8a"
            enabled: false
            onClicked: backToHall()
        }
        JPButton {
            id: progressLine
            text: "Line"
            baseColor: "#e6bf8a"
            enabled: false
            onClicked: backToLine()
        }
        JPButton {
            id: progressLocation
            text: "Location"
            baseColor: "#e6bf8a"
            enabled: false
            onClicked: backToLocation()
        }
        JPButton {
            id: progressDevice
            text: "Device"
            baseColor: "#e6bf8a"
            enabled: false
            onClicked: backToDevice()
        }
        JPButton {
            id: progressComponent
            text: "Component"
            baseColor: "#e6bf8a"
            enabled: false
        }
	}
	Loader {
		y: progressBar.height + 10
		height: parent.height - progressBar.height - 10
		width: parent.width
		id: hierarchyLoader
		source: "HierarchyGlobal.qml"
	}
}
