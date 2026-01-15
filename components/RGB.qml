import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Dialogs

Rectangle {

	id: root
	Layout.fillHeight: true
	Layout.fillWidth: true

	property string current
	current: "#ffffff"
	color: current

	Process {
		id: cmd
		running: true
	 	command: ["openrgb", "-c", current.slice(1)]
	}
	
	TapHandler {
		onTapped: colorDialog.open()
	}

	ColorDialog {
		id: colorDialog
		onAccepted: {root.current = selectedColor; cmd.running = true}

	}

	

}

