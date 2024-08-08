include "directedOreScannerIO.xc"
include "scanAndStoreBestResults.xc"
include "trigLib.xc"

var $checkingCone = 0
var $oreFound = 0
var $tracking = 0
var $ticksToWait = 0
var $startedReadingScan = 0
var $configured = 0
var $startScanAngle = 0
var $endScanAngle = 360
var $angleToOre = 0
var $scanInProgress = 0
var $scanStarted = 0

function @initializeConeScan()
	$checkingCone = 0
	$oreFound = 0
	$tracking = 0
	$ticksToWait = 0
	$startedReadingScan = 0
	$configured = 0
	$startScanAngle = 320
	$endScanAngle = 400
	$angleToOre = 0
	$scanInProgress = 0
	$scanStarted = 0
	@initializeScanForBestResults()

init
	@initializeConeScan()

function @calculateX($angle:number, $distance:number) : number
	return cos(@degreesToRadians($angle)) * $distance
	
function @calculateY($angle:number, $distance:number) : number
	return sin(@degreesToRadians($angle)) * $distance

function @sendOreScannerResults()
	@sendBestOreConcentration($bestResult)
	@sendAngleToBestOreConcentration($bestAngle)
	@sendDistanceToBestOreConcentration($distanceOfBestOre)
	@sendLocateDirectionX(@calculateX($bestAngle, $distanceOfBestOre))
	@sendLocateDirectionY(@calculateY($bestAngle, $distanceOfBestOre))

function @configureDirectedOreScanner()
	$configured = 0
	$oreToScanFor = @readOreToScanFor()
	if ($oreToScanFor == "")
		return
	$maxDistanceOfScan = @readMaxDistanceOfScan()
	$minDistanceOfScan = @readMinDistanceOfScan()
	if ($maxDistanceOfScan <= $minDistanceOfScan)
		return
	$resolution = @readResolutionOfScan()
	if ($resolution == 0)
		return
	$increment = @readScanAngleIncrement()
	if ($increment == 0)
		return
	$configured = 1
	
function @findBestOreThisTick()
	@scanForOre($oreToScanFor)
	if ($startedReadingScan == 0)
		$startedReadingScan = 1
	else
		@storeBestOreResults($oreToScanFor)
	
	if ($bestOreConcentrationForCurrentScan > $bestResult)
		$bestResult = $bestOreConcentrationForCurrentScan
		$distanceOfBestOre = $distanceOfBestOreForCurrentScan
		$bestAngle = $angleToOre - $increment
		
function @findTargetOreInCone()
	if ($checkingCone == 0)
		$checkingCone = 1
		$angleToOre = $startScanAngle
		return
	
	if (@confirmAtAngle($angleToOre))
		@findBestOreThisTick()
		$angleToOre = $angleToOre + $increment
		if ($angleToOre > $endScanAngle)
			$scanStarted = 0
			@sendOreScannerResults()
			
update
	if ($scanStarted)
		@configureDirectedOreScanner()
		if ($configured)
			@findTargetOreInCone()
			$oreFound = $bestResult != 0
			@sendOreScannerResults()
			print($bestAngle)
			print("Best result for " & $oreToScanFor & " = " & $bestResult:text & " at an angle of " & $bestAngle:text & " at a distance of " & $distanceOfBestOre:text)
	else
		if (@readStartScan())
			@initializeConeScan()
			$scanStarted = 1
	