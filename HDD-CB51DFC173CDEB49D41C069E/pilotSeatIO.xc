const $pilotSeatAlias = "seat"

const $backwardForwardChannel = 1
const $leftRightChannel = 2

function @getBackwardForward() : number
	return input_number($pilotSeatAlias, $backwardForwardChannel)
	
function @getLeftRight() : number
	return input_number($pilotSeatAlias, $leftRightChannel)