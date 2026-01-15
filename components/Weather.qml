import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
	Layout.fillHeight: true 
	Layout.fillWidth: true

	color: '#40e0d0'

	Text {
		id: display
		anchors.centerIn: parent
	}

	Process {
		id: cmd
		running: true
		command: ["curl", "wttr.in/Chicago?format=3"]
		stdout: StdioCollector {
			onStreamFinished: display.text = this.text
		}
	}

	Timer {
		interval: 1000
		running: true
		repeat: true
		onTriggered: cmd.running = true
	}


}


