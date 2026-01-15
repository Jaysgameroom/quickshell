import Quickshell
import QtQuick
import QtQuick.Layouts

import "components"

PanelWindow {

	anchors {
		top: true
		left: true
		right: true
	}

	color: 'gray'
	implicitHeight:50

		RowLayout{

			anchors.fill: parent
			Clock {}
		}
}
