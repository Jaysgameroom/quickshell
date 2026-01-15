import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
Rectangle {
	Layout.fillHeight: true 
	Layout.fillWidth: true

	RowLayout {
		anchors.fill: parent
		Repeater {
			model: Hyprland.workspaces.values

			delegate: Rectangle{
				required property string name
				property string truename
				property bool special

				special: name.startsWith("special") 
				truename: special ? name.slice(8) : name

				border.color: "black"
				border.width: 3

				Layout.fillWidth: true
				Layout.fillHeight: true

				Text{
					anchors.centerIn: parent
					text: truename
				}

				TapHandler {
					onTapped: special ? Hyprland.dispatch(`togglespecialworkspace ${truename}`) :  Hyprland.dispatch(`workspace ${truename}`) 
				}
			}


		}

	}


}


