var $pivotPort = 0

const $pivotAngleChannel = 0

var $maxPivotAngle = 1

function @setMaxPivotAngle($angle : number)
	$maxPivotAngle = $angle

; Servo mode
function @sendAngleToPivot($angle : number)
	output_number($pivotPort, $pivotAngleChannel, $angle * $maxPivotAngle)

; Both
function @readAngleFromPivot() : number
	return input_number($pivotPort, $pivotAngleChannel)
