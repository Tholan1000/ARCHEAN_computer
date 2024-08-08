include "pivotIO.xc"
include "oreScannerIO.xc"

; Configurable settings
var $oreToScanFor : text
var $maxDistanceOfScan : number
var $minDistanceOfScan : number
var $resolution : number
var $increment : number

var $distanceOfBestOreForCurrentScan = 0
var $bestOreConcentrationForCurrentScan = 0
var $bestAngle = 0
var $bestResult = 0
var $distanceOfBestOre = 0

function @initializeScanForBestResults()
	$bestAngle = 0
	$bestResult = 0
	$distanceOfBestOre = 0
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
		var $result = @readResultOfScan($channel)
		if ($result == "")
			print("Reached scanner limit")
		else
			if ($result.$ore > $bestOreConcentrationForCurrentScan)
				$bestOreConcentrationForCurrentScan = $result.$ore
				$distanceOfBestOreForCurrentScan = $distance