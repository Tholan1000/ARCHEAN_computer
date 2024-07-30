var $pilotSeatAlias : text

const $pilotSeatDownUpChannel = 3
const $pilotSeatPitchChannel = 4
const $pilotSeatRollChannel = 5
const $pilotSeatYawChannel = 6

function @setPilotSeatAlias($alias : text)
	$pilotSeatAlias = $alias
	
function @getPilotSeatDownUp() : number
	return input_number($pilotSeatAlias, $pilotSeatDownUpChannel)
	
function@getPilotSeatPitch() : number
	return input_number($pilotSeatAlias, $pilotSeatPitchChannel)
	
function@getPilotSeatRoll() : number
	return input_number($pilotSeatAlias, $pilotSeatRollChannel)
	
function@getPilotSeatYaw() : number
	return input_number($pilotSeatAlias, $pilotSeatYawChannel)