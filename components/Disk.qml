import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
	Layout.fillWidth: true
	Layout.fillHeight: true

	color: 'gray'

	Text {
		anchors.centerIn: parent
		id: mytext
	}

	Process{
		running: true
		command:  ["lsblk", "-o", "SIZE,FSUSED,FSUSE%", "/dev/nvme0n1p3", "-n", "-i", "-r"]
		stdout: StdioCollector{
			onStreamFinished: mytext.text=this.text
		}
	}
}
