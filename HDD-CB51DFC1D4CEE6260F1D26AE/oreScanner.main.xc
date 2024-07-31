include "oreScannerIO.xc"
include "navInstrument.xc"
include "hoverCraftDashboard.xc"

var $findingState = 0
var $checkFullRotation = 0
var $oreFound = 0
var $medianAngle = 0

init
	@initialize()

function @findBestOreThisTick()
	@scanForOre()
	@storeBestOreResults($oreToScanFor)
	
	if ($bestOreConcentrationForCurrentScan >= $bestResult)
		$bestResult = $bestOreConcentrationForCurrentScan
		$distanceOfBestOre = $distanceOfBestOreForCurrentScan
		$bestAngle = $angle
			
function @findTargetOreIn360Arc()
	if ($findingState == 0)
		$findingState = 1
		return
	if ($checkFullRotation == 0)
		$checkFullRotation = 1
		$angle = 0
		return
	@controlScannerRotation()
	@findBestOreThisTick()
	if ($angle >= 360)
		$oreFound = 1
		
update	
	if ($oreFound == 0)
		@findTargetOreIn360Arc()
		$medianAngle = $bestAngle
		print($medianAngle)
	else
		@controlScannerOscillation($medianAngle)
		@findBestOreThisTick()
		if ($bestAngle != $medianAngle)
			$medianAngle = $bestAngle

	var $message = "Best result for " & $oreToScanFor & " = " & $bestResult:text & " at an angle of " & $bestAngle:text & " at a distance of " & $distanceOfBestOre:text)
	print($message)
	@blankScreen()
	@writeToScreen("Angle = " & $bestAngle:text & " at distance " & $distanceOfBestOre:text)
		
	
