var $vectoredPropellerAlias = "vectoredPropeller"

const $frontBackAngleChannel = 0
const $leftRightAngleChannel = 1
const $propellerSpeedChannel = 2

function @setVectoredPropellerAlias($alias : text)
	$vectoredPropellerAlias = $alias

function @sendPropellerFrontBackAngle($angle : number)
	output_number($vectoredPropellerAlias, $frontBackAngleChannel, $angle)
	
function @sendPropellerLeftRightAngle($angle : number)
	output_number($vectoredPropellerAlias, $leftRightAngleChannel, $angle)

function @sendPropellerSpeed($upDown : number)
	output_number($vectoredPropellerAlias, $propellerSpeedChannel, $upDown)