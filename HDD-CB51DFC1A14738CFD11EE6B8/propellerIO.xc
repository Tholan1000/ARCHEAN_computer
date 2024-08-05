var $propellerPort = 2

const $sendPropellerSpeedChannel = 0
const $sendPropellerPitchChannel = 1
	
function @sendPropellerSpeed($speed : number)
	output_number($propellerPort, $sendPropellerSpeedChannel, $speed)
	
function @sendPropellerPitch($pitch: number)
	output_number($propellerPort, $sendPropellerSpeedChannel, $pitch)
	
var $propellerSpeed = 0
var $propellerSpeedInc = 0.05

function @sendPropellerIncrementSpeed($speedUpDown : number)
	$propellerSpeed = $propellerSpeed + $propellerSpeedInc * $speedUpDown
	if ($propellerSpeed > 1)
		$propellerSpeed = 1
	elseif ($propellerSpeed < 0)
		$propellerSpeed = 0
	@sendPropellerSpeed($propellerSpeed)
