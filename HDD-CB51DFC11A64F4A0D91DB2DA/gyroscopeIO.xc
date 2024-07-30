var $gyroscopeAlias : text

const $sendGyroscopeSpeedChannel = 0
const $sendGyroscopeControlChannel = 1

function @setGyroscopeAlias($alias : text)
	$gyroscopeAlias = $alias
	
function @setGyroscopeSpeed($speed : number)
	output_number($gyroscopeAlias, $sendGyroscopeSpeedChannel, $speed)

function @setGyroscopeControl($control : number)
	output_number($gyroscopeAlias, $sendGyroscopeControlChannel, $control)