include "pivotIO.xc"
include "oreScannerIO.xc"

var $maxDistanceOfScan = 10
var $minDistanceOfScan = 0
var $resolution = 0.2

; Configurable settings
var $coneAngle = 30
var $direction = 1
var $increment = 1
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

function @scanForOre($ore : text)
	var $numChannels = ($maxDistanceOfScan - $minDistanceOfScan) / $resolution
	repeat $numChannels ($channel)
		var $distance = $channel * $resolution + $minDistanceOfScan
		@sendScanForOre($channel, $distance)

function @storeBestOreResults($ore : text)
	$distanceOfBestOreForCurrentScan = 0
	$bestOreConcentrationForCurrentScan = 0
	var $numChannels = ($maxDistanceOfScan - $minDistanceOfScan) / $resolution
	repeat $numChannels ($channel)
		var $distance = $channel * $resolution + $minDistanceOfScan
;		@sendScanForOre($channel, $distance)
		var $result = @readResultOfScan($channel)
		if ($result == "")
			print("Reached scanner limit")
		else
			if ($result.$ore > $bestOreConcentrationForCurrentScan)
;				print($result)
;				print($distance)
;				print($angle)
				$bestOreConcentrationForCurrentScan = $result.$ore
				$distanceOfBestOreForCurrentScan = $distance