import QtQuick 2.1
import QtQuick.Controls 1.0
import org.unbugged.amos13 1.0

Grid {
	columns: 2
	spacing: 5
	anchors.horizontalCenter: parent.horizontalCenter
	JPText {
		text: "Name"
	}
	TextField {
		Component.onCompleted: text = acct.factory.name
		onTextChanged: acct.factory.name = text
	}
	JPText {
		text: "City"
	}
	TextField {
		Component.onCompleted: text = acct.factory.city
		onTextChanged: acct.factory.city = text
	}
	JPText {
		text: "Country"
	}
	TextField {
		Component.onCompleted: text = acct.factory.country
		onTextChanged: acct.factory.country = text
	}
	JPText {
		text: "Company"
	}
	TextField {
		Component.onCompleted: text = acct.factory.company
		onTextChanged: acct.factory.company = text
	}
	JPText {
		text: "GPS Lat"
	}
	TextField {
		validator: DoubleValidator {}
		Component.onCompleted: text = acct.factory.gpsLatitude
		onTextChanged: acct.factory.gpsLatitude = text
	}
	JPText {
		text: "GPS Lon"
	}
	TextField {
		validator: DoubleValidator {}
		Component.onCompleted: text = acct.factory.gpsLongitude
		onTextChanged: acct.factory.gpsLongitude = text
	}
	JPText {
		text: "Staff"
	}
	TextField {
		validator: IntValidator {}
		Component.onCompleted: text = acct.factory.staff
		onTextChanged: acct.factory.staff = text
	}
	JPText {
		text: "Vehicles"
	}
	TextField {
		validator: IntValidator {}
		Component.onCompleted: text = acct.factory.vehicles
		onTextChanged: acct.factory.vehicles = text
	}
}