const $vectoredPropellerPort = 11

const $frontBackAngleChannel = 0
const $leftRightAngleChannel = 1
const $vecPropellerSpeedChannel = 2
const $vecPropellerPitchChannel = 3

function @readFrontBackAngle() : number
	return input_number($vectoredPropellerPort, $frontBackAngleChannel)
	
function @readLeftRightAngle() : number
	return input_number($vectoredPropellerPort, $leftRightAngleChannel)

function @readPropellerSpeed() : number
	return input_number($vectoredPropellerPort, $vecPropellerSpeedChannel)
	
function @readPropellerPitch() : number
	return input_number($vectoredPropellerPort, $vecPropellerPitchChannel)