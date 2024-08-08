
const $directedOreScannerPort = "directedOreScanner"

; Output channels
const $oreToScanForChannel = 0
const $maxDistanceOfScanChannel = 1
const $minDistanceOfScanChannel = 2
const $resolutionOfScanChannel = 3
const $scanAngleIncrementChannel = 4
const $scanStartScanChannel = 5

; Input channels
const $bestOreConcentration = 0
const $angleToBestOreConcentration = 1
const $distanceToBestOreConcentration = 2
const $locateDirectionXChannel = 3
const $locateDirectionyChannel = 4

function @sendOreToScanFor($ore : text)
	output_text($directedOreScannerPort, $oreToScanForChannel, $ore)
	
function @sendMaxDistanceOfScan($distance : number)
	output_number($directedOreScannerPort, $maxDistanceOfScanChannel, $distance)
	
function @sendMinDistanceOfScan($distance : number)
	output_number($directedOreScannerPort, $minDistanceOfScanChannel, $distance)
	
function @sendResolutionOfScan($resolution : number)
	output_number($directedOreScannerPort, $resolutionOfScanChannel, $resolution)
	
function @sendScanAngleIncrement($angle : number)
	output_number($directedOreScannerPort, $scanAngleIncrementChannel, $angle)
	
function @sendStartScan($start : number)
	output_number($directedOreScannerPort, $scanStartScanChannel, $start)
	
function @readBestOreConcentration() : number
	return input_number($directedOreScannerPort, $bestOreConcentration)
	
function @readAngleToBestConcentration() : number
	return input_number($directedOreScannerPort, $angleToBestOreConcentration)
	
function @readDistanceToBestConcentration() : number
	return input_number($directedOreScannerPort, $distanceToBestOreConcentration)
	
function @readLocateDirectionX() : number
	return input_number($directedOreScannerPort, $locateDirectionXChannel)
	
function @readLocateDirectionY() : number
	return input_number($directedOreScannerPort, $locateDirectionYChannel)