include "scanAndStoreBestResults.xc"
include "oreTracker.xc"

var $findingState = 0
var $checkFullRotation = 0
var $oreFound = 0
var $medianAngle = 0
var $tracking = 0
var $ticksToWait = 0
var $startedReading360Scan = 0

init
	@initialize()
	
function @findBestOreThisTick()
	@scanForOre($oreToScanFor)
	if ($startedReading360Scan == 0)
		$startedReading360Scan = 1
	else
		@storeBestOreResults($oreToScanFor)
	
	if ($bestOreConcentrationForCurrentScan > $bestResult)
		$bestResult = $bestOreConcentrationForCurrentScan
		$distanceOfBestOre = $distanceOfBestOreForCurrentScan
		$bestAngle = $angle
			
function @findTargetOreIn360Arc()
	if ($findingState == 0)
		if (@readPivotAngle() != 0)
			@sendPivotAngle(0)
		else
			$findingState = 1
		return
	if ($checkFullRotation == 0)
		$checkFullRotation = 1
		$angle = 0
		return
	
	if (@confirmAtAngle($angle))
		@findBestOreThisTick()
		$angle = $angle + $increment
		if ($angle >= 360)
			$oreFound = 1
			
update
	if ($oreFound == 0)
		@findTargetOreIn360Arc()
		$medianAngle = $bestAngle
		print($medianAngle)
		print("Best result for " & $oreToScanFor & " = " & $bestResult:text & " at an angle of " & $bestAngle:text & " at a distance of " & $distanceOfBestOre:text)
	else
		if ($tracking == 0)
			if (@confirmAtAngle($bestAngle))
				@setOreToTrack($oreToScanFor)
				@setDistanceToOre($distanceOfBestOre)
				@setAngleToOre($bestAngle)
				@setOreConcentration($bestResult)
				$tracking = 1
		else
;			print("Angle to ore")
;			print($angleToOre)
;			print($distanceToOre)
;			@trackOre()
		
	






