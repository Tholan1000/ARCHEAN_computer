const $frontLeftWheelAlias = "leftFront"
const $frontRightWheelAlias = "rightFront"
const $backLeftWheelAlias = "leftRear"
const $backRightWheelAlias = "rightRear"

const $accelerateChannel = 0
const $steerChannel = 1
const $regenChannel = 2
const $brakeChannel = 3
const $gearBoxChannel = 4

function @sendAccelerate($wheelAlias:text, $accelerate:number)
	print("Move forward")
	print($wheelAlias)
	print($accelerate)
	output_number($wheelAlias, $accelerateChannel, $accelerate)
	
function @moveForwardBackward($accelerate:number)
	@sendAccelerate($frontLeftWheelAlias, $accelerate)
	@sendAccelerate($backLeftWheelAlias, $accelerate)
	@sendAccelerate($frontRightWheelAlias, $accelerate * -1)
	@sendAccelerate($backRightWheelAlias, $accelerate * -1)

function @sendSteer($wheelAlias:text, $steer:number)
;	print($wheelAlias)
;	print($steer)
	output_number($wheelAlias, $steerChannel, $steer)
	
function @steerLeftRight($steer:number)
	@sendSteer($frontLeftWheelAlias, $steer)
	@sendSteer($frontRightWheelAlias, $steer)
	@sendSteer($backLeftWheelAlias, $steer * -1)
	@sendSteer($backRightWheelAlias, $steer * -1)