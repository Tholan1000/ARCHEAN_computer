var $pilotSeatAlias = "pilotSeat"

const $pilotSeatInUseChannel = 0
const $pilotSeatDownUpChannel = 3
const $pilotSeatPitchChannel = 4
const $pilotSeatRollChannel = 5
const $pilotSeatYawChannel = 6
const $pilotSeatMainThrustChannel = 7

var $throttle = 0
const $throttleIncrement = 0.001

function @setPilotSeatAlias($alias : text)
	$pilotSeatAlias = $alias

function @getPilotSeatInUse() : number
	return input_number($pilotSeatAlias, $pilotSeatInUseChannel)

function @getPilotSeatDownUp() : number
	return input_number($pilotSeatAlias, $pilotSeatDownUpChannel)

function @getPilotSeatDownUpThrottle() : number
	if (@getPilotSeatDownUp() > 0)
		$throttle = $throttle + $throttleIncrement
		if ($throttle > 1)
			$throttle = 1
	if (@getPilotSeatDownUp() < 0)
		$throttle = $throttle - $throttleIncrement
		if ($throttle < 0)
			$throttle = 0
	return $throttle
	
function @getPilotSeatPitch() : number
	return input_number($pilotSeatAlias, $pilotSeatPitchChannel)
	
function @getPilotSeatRoll() : number
	return input_number($pilotSeatAlias, $pilotSeatRollChannel)
	
function @getPilotSeatYaw() : number
	return input_number($pilotSeatAlias, $pilotSeatYawChannel)

function @getMainThrust() : number
	return input_number($pilotSeatAlias, $pilotSeatMainThrustChannel)