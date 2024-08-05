const $vectoredPropellerPort = 11

const $frontBackAngleChannel = 0
const $leftRightAngleChannel = 1
const $propellerIncrementSpeedChannel = 2
const $propellerDirectionChannel = 3
const $propellerShutdownChannel = 4

function @readFrontBackAngle() : number
	return input_number($vectoredPropellerPort, $frontBackAngleChannel)
	
function @readLeftRightAngle() : number
	return input_number($vectoredPropellerPort, $leftRightAngleChannel)

function @readPropellerIncrementSpeed() : number
	return input_number($vectoredPropellerPort, $propellerIncrementSpeedChannel)
	
function @readPropellerDirection() : number
	return input_number($vectoredPropellerPort, $propellerDirectionChannel)

function @readPropellerShutdown() : number
	return input_number($vectoredPropellerPort, $propellerShutdownChannel)
