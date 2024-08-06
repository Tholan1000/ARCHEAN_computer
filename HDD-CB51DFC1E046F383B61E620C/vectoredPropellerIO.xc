var $vectoredPropellerAlias = "vectoredPropeller"

const $frontBackAngleChannel = 0
const $leftRightAngleChannel = 1
const $propellerSpeedChannel = 2
const $propellerPitchChannel = 3

function @setVectoredPropellerAlias($alias : text)
	$vectoredPropellerAlias = $alias

function @sendPropellerFrontBackAngle($angle : number)
	output_number($vectoredPropellerAlias, $frontBackAngleChannel, $angle)
	
function @sendPropellerLeftRightAngle($angle : number)
	output_number($vectoredPropellerAlias, $leftRightAngleChannel, $angle)

function @sendPropellerSpeed($speed : number)
	output_number($vectoredPropellerAlias, $propellerSpeedChannel, $speed)
	
function @sendPropellerPitch($pitch : number)
	output_number($vectoredPropellerAlias, $propellerPitchChannel, $pitch)