const $vectoredPropellerPort = 0

const $frontBackAngleChannel = 0
const $leftRightAngleChannel = 1
const $propellerSpeedChannel = 2

function @sendFrontBackAngle($angle : number)
	output_number($vectoredPropellerPort, $frontBackAngleChannel, $angle)
	
function @sendLeftRightAngle($angle : number)
	output_number($vectoredPropellerPort, $leftRightAngleChannel, $angle)

function @sendPropellerSpeed($speed : number) : number
	output_number($vectoredPropellerPort, $propellerSpeedChannel, $speed)