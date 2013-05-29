import QtQuick 2.1
import QtQuick.Controls 1.0
import org.unbugged.amos13 1.0

Item {
function connectDB(host, db, user, pass){
	var conn = database.init(host, db, user, pass);
	if(conn){
		mainLoader.source = "Tabs.qml"
	}
}
Row {
	width: childrenRect.width
	anchors.horizontalCenter: parent.horizontalCenter
	anchors.verticalCenter: parent.verticalCenter
	spacing: 5
	ListView {
		id: connections
		spacing: 5
		height: childrenRect.height
		width: parent.parent.width / 4
		model: LoginModel {}
		delegate: JPButton {
			width: parent.width
			text: host + ":" + db
			onClicked: connectDB(host, db, user, pass);
		}
	}
	Column {
		spacing: 5
		width: parent.parent.width / 3
		TextField {
			id: hostInput
			text: ""
			placeholderText: "Host"
			horizontalAlignment : TextInput.AlignHCenter
			width: parent.width
		}
		TextField {
			id: dbInput
			text: ""
			placeholderText: "Database"
			horizontalAlignment : TextInput.AlignHCenter
			width: parent.width
		}
		TextField {
			id: userInput
			text: ""
			placeholderText: "User"
			horizontalAlignment : TextInput.AlignHCenter
			width: parent.width
		}
		TextField {
			id: passInput
			text: ""
			echoMode: TextInput.Password
			placeholderText: "Password"
			horizontalAlignment : TextInput.AlignHCenter
			width: parent.width
		}
		JPButton {
			text: "Connect"
			anchors.horizontalCenter: parent.horizontalCenter
			onClicked: connectDB(hostInput.text, dbInput.text, userInput.text, passInput.text)
			width: parent.width
		}
	}
}
}