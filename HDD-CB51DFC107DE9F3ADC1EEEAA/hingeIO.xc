const $hingePort = 1

const $hingeAngleChannel = 0
const $hingeSpeedChannel = 0

var $maxHingeAngle = 1
var $hingeAngle = 0
var $hingeAngleIncrement = 0.05

function @setMaxHingeAngle($angle : number)
	$maxHingeAngle = $angle

function @sendAngleToHinge($angle : number)
	output_number($hingePort, $hingeAngleChannel, $angle * $maxHingeAngle)
	
function @readAngleFromHinge() : number
	return input_number($hingePort, $hingeAngleChannel)
	
function @sendHingeIncrementAngle($upDown : number)
	$hingeAngle = $hingeAngle + $hingeAngleIncrement * $upDown
	if ($hingeAngle > 1)
		$hingeAngle = 1
	elseif ($hingeAngle < -1)
		$hingeAngle = -1
	@sendAngleToHinge($hingeAngle)
