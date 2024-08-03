var $propellerAlias = "propeller"

const $sendPropellerSpeedChannel = 0
const $sendPropellerPitchChannel = 1

function @setPropellerAlias($alias : text)
	$propellerAlias = $alias
	
function @sendPropellerSpeed($speed : number)
	output_number($propellerAlias, $sendPropellerSpeedChannel, $speed)
	
function @sendPropellerPitch($pitch: number)
	output_number($propellerAlias, $sendPropellerSpeedChannel, $pitch)
