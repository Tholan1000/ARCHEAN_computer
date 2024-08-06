var $propellerPort = 2

const $sendPropellerSpeedChannel = 0
const $sendPropellerPitchChannel = 1
	
function @sendPropellerSpeed($speed : number)
	output_number($propellerPort, $sendPropellerSpeedChannel, $speed)
	
function @sendPropellerPitch($pitch : number)
	output_number($propellerPort, $sendPropellerPitchChannel, $pitch)
