const $hingePort = 1

const $hingeAngleChannel = 0

var $maxHingeAngle = 1

function @setMaxHingeAngle($angle : number)
	$maxHingeAngle = $angle

function @sendAngleToHinge($angle : number)
	output_number($hingePort, $hingeAngleChannel, $angle * $maxHingeAngle)
	
function @readAngleFromHinge() : number
	return input_number($hingePort, $hingeAngleChannel)
	