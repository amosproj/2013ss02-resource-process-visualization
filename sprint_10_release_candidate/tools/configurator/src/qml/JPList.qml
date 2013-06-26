import QtQuick 2.1
import QtQuick.Controls 1.0

ScrollView {
    signal clicked (int id)
    id: scroll
    ListView {
        id: view
        height: parent.height
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 3
        delegate: JPButton {
            text: name
            width: parent.width
            onClicked: scroll.clicked(id)
        }
    }
    property alias model: view.model
}
