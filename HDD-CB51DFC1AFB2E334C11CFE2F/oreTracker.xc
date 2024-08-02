include "mathLib.xc"

var $oreToTrack = "Au"
var $distanceToOre : number
var $angleToOre : number
var $oreConcentration : number

var $startSearchAngle = 0
var $endSearchAngle = 0

const $distanceToReaquire = 50
const $amountToMovePerScan = 0.5

function @calculateDegreesToReaquire() : number
	var $radians = atan($distanceToReaquire/$distanceToOre)
	return @radiansToDegrees($radians)

function @calculateDegreesToIncrement($numDegreesToReaquire : number) : number
	var $numScansToReaquire = $distanceToReaquire / $amountToMovePerScan
	return $numDegreesToReaquire / $numScansToReaquire
	
function @setOreToTrack($ore : text)
	$oreToTrack = $ore
	
function @setDistanceToOre($distance : number)
	$distanceToOre = $distance
	
function @setAngleToOre($origAngle : number)
	$angleToOre = $origAngle
	
function @setOreConcentration($concentration : number)
	$oreConcentration = $concentration

function @scanToReaquireOre() : number
	var $maxReaquireDistance = $distanceToOre + $distanceToReaquire
	var $minReaquireDistance = $distanceToOre - $distanceToReaquire
	var $numChannelsToReaquire = ($maxReaquireDistance-$minReaquireDistance)/$amountToMovePerScan
	repeat $numChannelsToReaquire ($channel)
		var $distance = $channel * $amountToMovePerScan + $minReaquireDistance
		print($distance)
		@sendScanForOre($channel, $distance)
		var $result = @readResultOfScan($channel)
		if ($result == "")
			print("Reached scanner limit")
		else
			if ($result.$oreToTrack == $oreConcentration)
				print("Ore found")
				print($minReaquireDistance)
				print($maxReaquireDistance)
;				$distanceToOre = $distance
				return 1
	return 0
	
function @trackOre()
	var $numDegreesToReaquire = @calculateDegreesToReaquire()
	var $numDegreesToIncrement = @calculateDegreesToIncrement($numDegreesToReaquire)
	print("tracking ore")
	if (@confirmAtAngle($angleToOre))
		print("Angle confirmed")
		if (@scanToReaquireOre())
			print("Target locked")
			print($distanceToOre)
			print($angleToOre)
			return
		if ($startSearchAngle == 0)
			$endSearchAngle = $angleToOre + $numDegreesToReaquire
			$angleToOre = $angleToOre - $numDegreesToReaquire
			$startSearchAngle = $angleToOre
		else
			if ($angleToOre > $endSearchAngle)
				print("Lost track of target")
				$angleToOre = $startSearchAngle
			else
				$angleToOre = $angleToOre + $numDegreesToIncrement
				print("Attempting to reaquire target")

	