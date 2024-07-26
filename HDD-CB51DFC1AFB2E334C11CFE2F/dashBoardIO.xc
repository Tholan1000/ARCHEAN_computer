const $container1Dashboard = "container1Dashboard"
const $container2Dashboard = "container2Dashboard"
const $container3Dashboard = "container3Dashboard"

var $screen = screen($container1Dashboard, 0)

const $triangleHeight = 9
const $triangleWidth = 10
var $componentColor = white
var $backGroundColor = black

function @setScreen($dashBoardVar : text, $screenChannelVar : number)
	$screen = screen($dashBoardVar, $screenChannelVar)

function @setTextSize($size:number)
	$screen.text_size($size)
	
function @addCharWidth($numChars:number) : number
	return $screen.char_w * $numChars

function @getRowHeight() : number
	return $screen.char_h + 4

function @drawLabel($topLeftX:number, $topLeftY:number, $label:text)
	$screen.write($topLeftX, $topLeftY, $componentColor, $label)

function @drawButton($topLeftX : number, $topLeftY : number, $buttonLabel:text, $buttonWidth:number) : number
	var $bottomRightX = $topLeftX + $buttonWidth
	var $bottomRightY = $topLeftY + $screen.char_h
	var $labelStartX = $topLeftX + $buttonWidth/2 - (@addCharWidth(size($buttonLabel)/2))
	var $retVal =  $screen.button_rect($topLeftX, $topLeftY - 1, $bottomRightX, $bottomRightY + 1, blue, $backGroundColor)
	@drawLabel($labelStartX, $topLeftY, $buttonLabel)
	
	return $retVal

function @incrementByHandler()
	var $topLeftX = 10
	var $topLeftY = 10
	var $labelStartsAtX = $topLeftX
	var $label = "Increment by: "
	
	@drawLabel($labelStartsAtX, $topLeftY, $label)
	var $startButtonX = $topLeftX + @addCharWidth(size($label)) + 4
	var $buttonWidth = @addCharWidth(6)
	@drawButton($startButtonX, $topLeftY, "1", $buttonWidth)
	$startButtonX = $startButtonX + $buttonWidth + 2
	@drawButton($startButtonX, $topLeftY, "10", $buttonWidth)
	$startButtonX = $startButtonX + $buttonWidth + 2
	@drawButton($startButtonX, $topLeftY, "100", $buttonWidth)
	$startButtonX = $startButtonX + $buttonWidth + 2
	@drawButton($startButtonX, $topLeftY, "1000", $buttonWidth)
	
;	var $buttonStartsAtX = @addCharWidth(size($label)) + 4
;	var $bottomRightX = $buttonStartsAtX + @addCharWidth(5)
;	$screen.draw_rect($buttonStartsAtX, $topLeftY, $bottomRightX, $bottomRightY, blue, $backGroundColor)

function @upOrDownButtonTriangle($topPointX:number, $topPointY:number, $direction:number) : number
	var $leftPointX = $topPointX - $triangleWidth/2
	var $leftPointY = $topPointY + ($triangleHeight * $direction)
	var $rightPointX = $topPointX + $triangleWidth/2
	var $rightPointY = $leftPointY
	return $screen.button_triangle($topPointX, $topPointY, $leftPointX, $leftPointY, $rightPointX, $rightPointY, $componentColor, $componentColor)
	
function @upButtonTriangle($topPointX:number, $topPointY:number) : number
	return @upOrDownButtonTriangle($topPointX, $topPointY - 1, 1)

function @downButtonTriangle($topPointX:number, $topPointY:number) : number
	return @upOrDownButtonTriangle($topPointX, $topPointY + 1, -1)
	
function @upDownButtonTriangles($middlePointX:number, $middlePointY:number) : number
	var $upTriangleStartY = $middlePointY - $triangleHeight
	if (@upButtonTriangle($middlePointX, $upTriangleStartY))
		return 1
	var $downTriangleStartY = $middlePointY + $triangleHeight
	if (@downButtonTriangle($middlePointX, $downTriangleStartY))
		return -1
	return 0
	
function @leftOrRightButtonTriangle($point1X:number, $point1Y:number, $direction:number) : number
	var $point2X = $point1X + ($triangleHeight * $direction)
	var $point2Y = $point1Y - $triangleWidth/2
	var $point3X = $point1X + ($triangleHeight * $direction)
	var $point3Y = $point1Y + $triangleWidth/2
	return $screen.button_triangle($point1X, $point1Y, $point2X, $point2Y, $point3X, $point3Y, $componentColor, $componentColor)

function @leftButtonTriangle($topPointX:number, $topPointY:number) : number
	return @leftOrRightButtonTriangle($topPointX, $topPointY, -1)
	
function @rightButtonTriangle($topPointX:number, $topPointY:number) : number
	return @leftOrRightButtonTriangle($topPointX, $topPointY, 1)
	
function @leftRightButtonTriangles($middlePointX:number, $middlePointY:number) : number
	var $shiftBy = $triangleHeight + 1
	if (@leftButtonTriangle($middlePointX + $shiftBy, $middlePointY))
		return 1
	if (@rightButtonTriangle($middlePointX - $shiftBy, $middlePointY))
		return -1
	return 0

function @blankScreen()
	$screen.blank($backGroundColor)
	
function @progressBar($value:number, $maxValue:number, $topLeftX:number, $topLeftY:number, $width:number)
	if ($maxValue == 0)
		$maxValue = 1
	if ($value > $maxValue)
		$value = $maxValue
	$topLeftY = $topLeftY - 2
	var $bottomRightY = $topLeftY + $screen.char_h + 2
	var $progressColor = color(0, 320, 0)
	var $progressWidth = 0
	$progressWidth = ($value/$maxValue) * $width
	$screen.draw_rect($topLeftX, $topLeftY, $topLeftX + $width, $bottomRightY, blue, $backGroundColor)
	$screen.draw_rect($topLeftX, $topLeftY, $topLeftX + $progressWidth, $bottomRightY, blue, $progressColor)

function @counter($label:text, $currentValue:number, $desiredValue:number, $topLeftX:number, $topLeftY:number) : number
	var $labelWidth = @addCharWidth(30)
	var $progressWidth = $labelWidth
	var $startAt = $topLeftX + 2
	var $labelStartAt = $startAt
	$startAt = $startAt + $labelWidth
	var $valueStartAt = $startAt;
	$startAt = $startAt + @addCharWidth(7) + 2
	var $newValue = $desiredValue + @leftRightButtonTriangles($startAt, $topLeftY + 3)
	if ($newValue < 0)
		$newValue = 0
	@progressBar($currentValue, $desiredValue, $topLeftX, $topLeftY, $labelWidth)
	$screen.write($valueStartAt, $topLeftY, $componentColor, $desiredValue:text)
	$screen.write($labelStartAt, $topLeftY, $componentColor, $label)
	return $newValue

	