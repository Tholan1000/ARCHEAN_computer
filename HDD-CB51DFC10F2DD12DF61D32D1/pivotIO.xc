const $pivotAlias = "pivot"
const $pivotSetSpeedChannel = 0
const $pivotGetSpeedChannel = 1
const $pivotGetAngleChannel = 0

; Servo mode
const $pivotSetAngleChannel = 0

function @normalizeAngle($angle:number) : number
	if ($angle > 360)
		$angle = $angle - 360
	if ($angle < -360)
		$angle = $angle + 360
	return $angle

; Velocity mode
function @sendPivotSpeed($speed:number)
	output_number($pivotAlias, $pivotSetSpeedChannel, $speed)
	
function @getPivotSpeed() : number
	return input_number($pivotAlias, $pivotGetSpeedChannel)
	
function @invertPivotSpeed()
	@sendPivotSpeed(@getPivotSpeed() * -1)
	
function @sendPivotDirectionCounterClockwise()
	if (@getPivotSpeed() < 0)
		@invertPivotSpeed()
		
function @sendPivotDirectionClockwise()
	if (@getPivotSpeed() > 0)
		@invertPivotSpeed()

; Servo mode
function @sendPivotAngle($angle:number)
	$angle = @normalizeAngle($angle)
	output_number($pivotAlias, $pivotSetAngleChannel, $angle/360)

; Both
function @getPivotAngle() : number
	return input_number($pivotAlias, $pivotGetAngleChannel) * 360
	