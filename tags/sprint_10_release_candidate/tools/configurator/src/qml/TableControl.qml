import QtQuick 2.1
import QtQuick.Controls 1.0

Grid {
	property color invalid: "#e58989"
	property color valid: "#99e589"
	function initIds(){
		idSeq.create();
	}
	function wipeIds(){
		wipeFactories();
		idSeq.del();
	}
	function initFactories(){
		initIds();
		factories.create();
		log.info("Init factory table.");
	}
	function wipeFactories(){
		wipeHalls();
		factories.del();
	}
	function initHalls(){
		initFactories();
		halls.create()
		log.info("Init hall table.");
	}
	function wipeHalls(){
		wipeLines();
		halls.del();
	}
	function initLines(){
		initHalls();
		lines.create();
	}
	function wipeLines(){
		wipeLocations();
		lines.del();
	}
	function initLocations(){
		initLines();
		locations.create();
	}
	function wipeLocations(){
        wipeDevices();
		locations.del();
	}
    function initDevices(){
        initLocations();
        devices.create();
    }
    function wipeDevices(){
        wipeComponents();
        devices.del();
    }
    function initComponents(){
        initDevices();
        components.create();
    }
    function wipeComponents(){
        components.del();
    }
	
	columns: 4
	spacing: 5

	Rectangle {
		width: 20
		height: 20
		color: "#00000000"
	}
	Label {
		color: "white"
		text: "All"
		font.pixelSize: 14
	}
	JPButton {
		text: "Init"
        onClicked: initComponents()
	}
	JPButton {
		text: "Wipe"
		onClicked: wipeIds()
	}
	Rectangle {
		width: 20
		height: 20
		color: "#00000000"
	}
	Label {
		color: "white"
		text: "Id Sequence"
		font.pixelSize: 14
	}
	JPButton {
		text: "Init"
		onClicked: idSeq.init()
	}
	JPButton {
		text: "Wipe"
		onClicked: idSeq.wipe()
	}
	Rectangle {
		width: 20
		height: 20
		color: factories.status ? parent.valid : parent.invalid
	}
	Label {
		color: "white"
		text: "Factory"
		font.pixelSize: 14
	}
	JPButton {
		text: "Init"
		onClicked: initFactories()
	}
	JPButton {
		text: "Wipe"
		onClicked: wipeFactories()
	}
	Rectangle {
		width: 20
		height: 20
		color: halls.status ? parent.valid : parent.invalid
	}
	Label {
		color: "white"
		text: "Hall"
		font.pixelSize: 14
	}
	JPButton {
		text: "Init"
		onClicked: initHalls()
	}
	JPButton {
		text: "Wipe"
		onClicked: wipeHalls()
	}
	Rectangle {
		width: 20
		height: 20
		color: lines.status ? parent.valid : parent.invalid
	}
	Label {
		color: "white"
		text: "Line"
		font.pixelSize: 14
	}
	JPButton {
		text: "Init"
		onClicked: initLines()
	}
	JPButton {
		text: "Wipe"
		onClicked: wipeLines()
	}
	Rectangle {
		width: 20
		height: 20
		color: locations.status ? parent.valid : parent.invalid
	}
	Label {
		color: "white"
		text: "Location"
		font.pixelSize: 14
	}
	JPButton {
		text: "Init"
		onClicked: initLocations()
	}
	JPButton {
		text: "Wipe"
		onClicked: wipeLocations()
	}
    Rectangle {
        width: 20
        height: 20
        color: devices.status ? parent.valid : parent.invalid
    }
    JPText {
        text: "Device"
    }
    JPButton {
        text: "Init"
        onClicked: initDevices()
    }
    JPButton {
        text: "Wipe"
        onClicked: wipeDevices()
    }
    Rectangle {
        width: 20
        height: 20
        color: components.status ? parent.valid : parent.invalid
    }
    JPText {
        text: "Component"
    }
    JPButton {
        text: "Init"
        onClicked: initComponents()
    }
    JPButton {
        text: "Wipe"
        onClicked: wipeComponents()
    }
}
