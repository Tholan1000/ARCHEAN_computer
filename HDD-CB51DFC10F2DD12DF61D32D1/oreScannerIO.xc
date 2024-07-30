include "pivotIO.xc"

const $oreScannerAlas = "oreScanner"

var $maxDistanceOfScan = 6000
var $minDistanceOfScan = 5000
var $resolution = 1

; Configurable settings
var $coneAngle = 30
var $direction = 1
var $increment = 0.5
var $oreToScanFor = "Ti"

var $distanceOfBestOreForCurrentScan = 0
var $bestOreConcentrationForCurrentScan = 0

var $angle = 0
var $bestAngle = 0
var $bestResult = 0
var $distanceOfBestOre = 0

function @initialize()
	$bestAngle = 0
	$bestResult = 0
	$distanceOfBestOre = 0
	$angle = $coneAngle/2 * $direction
	$distanceOfBestOreForCurrentScan = 0
	$bestOreConcentrationForCurrentScan = 0
	
function @controlScannerOscillation($medianAngle:number)
	@sendPivotAngle($angle)
	var $halfCone = $coneAngle/2
	var $leftLimit = $medianAngle + $halfCone
	var $rightLimit = $medianAngle - $halfCone
	if ($angle > $leftLimit)
		$direction = -1
	if ($angle < $rightLimit)
		$direction = 1
	$angle = $angle + ($increment * $direction)
	
function @controlScannerRotation()
	@sendPivotAngle($angle)
	$angle = $angle + $increment

function @scanForOre($channel : number, $distance : number)
	output_number($oreScannerAlas, $channel, $distance)
	
function @getOreResult($channel : number) : text
	return input_text($oreScannerAlas, $channel)
	
function @storeBestOreResults($ore : text)
	$distanceOfBestOreForCurrentScan = 0
	$bestOreConcentrationForCurrentScan = 0
	var $numChannels = ($maxDistanceOfScan - $minDistanceOfScan) / $resolution
	repeat $numChannels ($channel)
		var $distance = $channel * $resolution + $minDistanceOfScan
		@scanForOre($channel, $distance)
		var $result = @getOreResult($channel)
		if ($result == "")
			print("Reached scanner limit")
		else
			if ($result.$ore >= $bestOreConcentrationForCurrentScan)
				$bestOreConcentrationForCurrentScan = $result.$ore
				$distanceOfBestOreForCurrentScan = $distance
				