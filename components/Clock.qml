import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
	Layout.fillHeight: true 
	Layout.fillWidth: true

	color: '#88000000'

	Text {
		anchors.centerIn: parent
		text: Qt.formatDateTime(clock.date, "hh:mmap")
	}

	SystemClock{
		id: clock
		precision: SystemClock.Seconds
	}


}


