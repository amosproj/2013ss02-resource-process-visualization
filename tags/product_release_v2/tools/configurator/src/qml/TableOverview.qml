import QtQuick 2.1

Grid {
	columns: 2
	spacing: 5
	JPText {
		text: "Factories"
	}
	JPText {
		text: factories.count == -1 ? "-": factories.count
	}
	JPText {
		text: "Halls"
	}
	JPText {
		text: halls.count == -1 ? "-": halls.count
	}
	JPText {
		text: "Lines"
	}
	JPText {
		text: lines.count == -1 ? "-": lines.count
	}
	JPText {
		text: "Locations"
	}
	JPText {
		text: locations.count == -1 ? "-": locations.count
	}
    JPText {
        text: "Devices"
    }
    JPText {
        text: devices.count == -1 ? "-": devices.count
    }
    JPText {
        text: "Components"
    }
    JPText {
        text: components.count == -1 ? "-": components.count
    }
}
