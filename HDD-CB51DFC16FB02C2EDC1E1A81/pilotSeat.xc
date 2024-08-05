var $pilotSeatAlias = "pilotSeat"

const $pilotSeatInUseChannel = 0
const $pilotSeatBackFrontChannel = 1
const $pilotSeatBackwardLeftRight = 2
const $pilotSeatDownUpChannel = 3
const $pilotSeatPitchChannel = 4
const $pilotSeatRollChannel = 5
const $pilotSeatYawChannel = 6
const $pilotSeatMainThrustChannel = 7

function @setPilotSeatAlias($alias : text)
	$pilotSeatAlias = $alias

function @readPilotSeatBackFront() : number
	return input_number($pilotSeatAlias, $pilotSeatBackFrontChannel)
	
function @readPilotSeatLeftRight() : number
	return input_number($pilotSeatAlias, $pilotSeatBackwardLeftRight)

function @readPilotSeatInUse() : number
	return input_number($pilotSeatAlias, $pilotSeatInUseChannel)

function @readPilotSeatDownUp() : number
	return input_number($pilotSeatAlias, $pilotSeatDownUpChannel)
	
function @readPilotSeatPitch() : number
	return input_number($pilotSeatAlias, $pilotSeatPitchChannel)
	
function @readPilotSeatRoll() : number
	return input_number($pilotSeatAlias, $pilotSeatRollChannel)
	
function @readPilotSeatYaw() : number
	return input_number($pilotSeatAlias, $pilotSeatYawChannel)

function @readMainThrust() : number
	return input_number($pilotSeatAlias, $pilotSeatMainThrustChannel)