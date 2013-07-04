import QtQuick 2.1

Column {
    signal childClicked (int id)
    signal createChild ()
    width: parent.width / 2 - 15
    height: parent.height
    anchors {
        left: parent.left
        leftMargin: 5
        top: parent.top
        topMargin: 5
    }
    spacing: 5
    JPList {
        id: list
        width: parent.width
        height: parent.height - addChildButton.height - 3*parent.spacing
        onClicked: parent.childClicked(id)
    }
    JPButton {
        id: addChildButton
        text: "+"
        baseColor: "#99e589"
        width: parent.width
        onClicked: parent.createChild()
    }
    property alias model: list.model

}
