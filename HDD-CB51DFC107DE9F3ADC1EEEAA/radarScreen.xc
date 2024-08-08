include "trigLib.xc"

const $dashboardAlias = "dashboard"
const $radarScreenChannel = 0
const $radarLineLength = 100
	
var $screen = screen($dashboardAlias, $radarScreenChannel)

function @radar($angle : number)
	$screen.blank(black)
	var $centerX = $screen.width/2
	var $centerY = $screen.height/2

	var $lineAngle = $angle + 90
	
	var $endX = cos(@degreesToRadians($lineAngle)) * $radarLineLength + $centerX
	var $endY = sin(@degreesToRadians($lineAngle)) * $radarLineLength * -1 + $centerY
	if ($screen.button_circle($centerX, $centerY, $radarLineLength, white))
		print("Clicked on button")
	$screen.draw_line($centerX, $centerY, $endX, $endY, white)