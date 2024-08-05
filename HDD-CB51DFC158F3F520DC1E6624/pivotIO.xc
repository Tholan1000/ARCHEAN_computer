var $pivotPort = 0

const $pivotReadAngleChannel = 0
const $pivotSendAngleChannel = 0

var $maxPivotAngle = 1
var $pivotAngle = 0
var $pivotAngleIncrement = 0.03

function @setMaxPivotAngle($angle : number)
	$maxPivotAngle = $angle

; Servo mode
function @sendAngleToPivot($angle : number)
	output_number($pivotPort, $pivotSendAngleChannel, $angle * $maxPivotAngle)

; Both
function @readAngleFromPivot() : number
	return input_number($pivotPort, $pivotReadAngleChannel)

function @sendPivotIncrementAngle($upDown : number)
	$pivotAngle = $pivotAngle + $pivotAngleIncrement * $upDown
	if ($pivotAngle > 1)
		$pivotAngle = 1
	elseif ($pivotAngle < -1)
		$pivotAngle = -1
	@sendAngleToPivot($pivotAngle)
