import QtQuick 2.1
import QtQuick.Controls 1.0
import org.unbugged.amos13 1.0

Column {
	spacing: 5
	FactoryProperties {
	}
	JPButton {
		text: "Create"
		anchors.horizontalCenter: parent.horizontalCenter
		onClicked: {
			factories.insert(acct.factory);
            backToGlobal();
		}
	}
}
