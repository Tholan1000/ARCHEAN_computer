var $pivotAlias = "pivot"

const $pivotReadAngleChannel = 0
const $pivotSendAngleChannel = 0

function @setPivotAlias($alias : text)
	$pivotAlias = $alias

function @normalizeAngle($angle:number) : number
	return mod($angle, 360)

; Servo mode
function @sendPivotAngle($angle:number)
	output_number($pivotAlias, $pivotSendAngleChannel, @normalizeAngle($angle)/360)

; Both
function @readPivotAngle() : number
	return input_number($pivotAlias, $pivotReadAngleChannel) * 360