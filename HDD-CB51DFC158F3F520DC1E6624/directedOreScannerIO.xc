
const $directedOreScannerPort = 0

; Input channels
const $oreToScanForChannel = 0
const $maxDistanceOfScanChannel = 1
const $minDistanceOfScanChannel = 2
const $resolutionOfScanChannel = 3
const $scanAngleIncrementChannel = 4
const $scanStartScanChannel = 5

; Output channels
const $bestOreConcentration = 0
const $angleToBestOreConcentration = 1
const $distanceToBestOreConcentration = 2
const $locateDirectionXChannel = 3
const $locateDirectionyChannel = 4

function @readOreToScanFor() : text
	return input_text($directedOreScannerPort, $oreToScanForChannel)
	
function @readMaxDistanceOfScan() : number
	return input_text($directedOreScannerPort, $maxDistanceOfScanChannel)
	
function @readMinDistanceOfScan() : number
	return input_text($directedOreScannerPort, $minDistanceOfScanChannel)
	
function @readResolutionOfScan() : number
	return input_text($directedOreScannerPort, $resolutionOfScanChannel)
	
function @readScanAngleIncrement() : number
	return input_text($directedOreScannerPort, $scanAngleIncrementChannel)
	
function @readStartScan() : number
	return input_text($directedOreScannerPort, $scanStartScanChannel)
	
function @sendBestOreConcentration($bestOreConcetration : number)
	output_number($directedOreScannerPort, $bestOreConcentration, $bestOreConcetration)

function @sendAngleToBestOreConcentration($angle : number)
	output_number($directedOreScannerPort, $angleToBestOreConcentration, $angle)
	
function @sendDistanceToBestOreConcentration($distance : number)
	output_number($directedOreScannerPort, $distanceToBestOreConcentration, $distance)
	
function @sendLocateDirectionX($xDirection : number)
	output_number($directedOreScannerPort, $locateDirectionXChannel, $xDirection)
	
function @sendLocateDirectionY($yDirection : number)
	output_number($directedOreScannerPort, $locateDirectionYChannel, $yDirection)
		