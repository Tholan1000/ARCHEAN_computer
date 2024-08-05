var $propellerPort = 2

const $sendPropellerSpeedChannel = 0

var $propellerSpeed = 0
var $propellerSpeedInc = 0.01
var $propellerDirection = 1

function @setPropellerDirection($direction : number)
	$propellerDirection = $direction
	
function @sendPropellerSpeed($speed : number)
	output_number($propellerPort, $sendPropellerSpeedChannel, $speed)

function @sendPropellerIncrementSpeed($speedUpDown : number)
	$propellerSpeed = $propellerSpeed + $propellerSpeedInc * $speedUpDown
	if ($propellerSpeed > 1)
		$propellerSpeed = 1
	elseif ($propellerSpeed < 0)
		$propellerSpeed = 0
	@sendPropellerSpeed($propellerSpeed * $propellerDirection)

function @sendShutDownPropeller()
	$propellerSpeed = 0
	@sendPropellerSpeed(0)