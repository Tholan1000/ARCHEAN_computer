var $findingState = 0
var $checkFullRotation = 0
var $oreFound = 0=
var $medianAngle = 0

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