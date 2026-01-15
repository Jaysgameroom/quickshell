import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Rectangle {
	Layout.fillHeight: true 
	Layout.fillWidth: true

	color: 'green'

	property var player: Mpris.players.values[1]


	RowLayout{
		ColumnLayout{
				RowLayout {

					Layout.fillHeight: true 
					Layout.fillWidth: true

					spacing: 5

					Button{
						onClicked: player.previous()
						text: ""
					}

					Button{
						onClicked: player.togglePlaying()
						text: player.isPlaying ? "" : ""
					}

					Button{
						onClicked: player.next()
						text: ""
					}
				}

				Slider{
					Layout.fillWidth: true
					from: 0
					value: player.position
					to: player.length
					live: true
					onMoved: player.position = value
				}
			}

			Image {
				Layout.preferredHeight: 50 
				Layout.preferredWidth: this.height
				source: player.trackArtUrl
			}
		}


	Timer {
	  // only emit the signal when the position is actually changing.
	  running: player.playbackState == MprisPlaybackState.Playing
	  // Make sure the position updates at least once per second.
	  interval: 1000
	  repeat: true
	  // emit the positionChanged signal every second.
	  onTriggered: player.positionChanged()
	}



		
		

}


