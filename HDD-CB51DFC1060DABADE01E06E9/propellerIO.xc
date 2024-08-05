var $propellerPort = 2

const $sendPropellerSpeedChannel = 0
	
function @sendPropellerSpeed($speed : number)
	output_number($propellerPort, $sendPropellerSpeedChannel, $speed)
