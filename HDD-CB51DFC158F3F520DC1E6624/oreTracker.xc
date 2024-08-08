include "mathLib.xc"

const $distanceToReaquire = 10
const $amountToMovePerScan = 0.05

var $oreToTrack : text
var $distanceToOre : number
var $angleToOre : number
var $oreConcentration : number

var $startedReadingTrackingScan = 0

var $startReaquireAngleSearch = 0
var $numAnglesToCheck = 0
var $searchAngleCount = 0
var $alternateSearchCount = 1

function @calculateDegreesToReaquire() : number
	if ($distanceToOre != 0)
		return @radiansToDegrees(atan($distanceToReaquire/$distanceToOre))
	return 0
	
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

function @scanToReaquireOre()
	var $maxReaquireDistance = $distanceToOre + $distanceToReaquire
	var $minReaquireDistance = $distanceToOre - $distanceToReaquire
	var $numChannelsToReaquire = ($maxReaquireDistance-$minReaquireDistance)/$amountToMovePerScan
	var $alternate = 1
	repeat $numChannelsToReaquire ($channel)
		$alternate = $alternate * -1
		var $distance = $distanceToOre - $amountToMovePerScan * $channel * $alternate
		@sendScanForOre($channel, $distance)
	
function @readScanToReaquireOre() : number
	var $maxReaquireDistance = $distanceToOre + $distanceToReaquire
	var $minReaquireDistance = $distanceToOre - $distanceToReaquire
	var $numChannelsToReaquire = ($maxReaquireDistance-$minReaquireDistance)/$amountToMovePerScan
	var $alternate = 1
	var $found = 0
	repeat $numChannelsToReaquire ($channel)
		$alternate = $alternate * -1
		var $distance = $distanceToOre - $amountToMovePerScan * $channel * $alternate
		var $result = @readResultOfScan($channel)
		if ($result == "")
			print("Reached scanner limit")
		else
			if ($result.$oreToTrack == $oreConcentration)
				if ($found == 0)
					$distanceToOre = $distance
					$found = 1
	return $found
	
function @trackOre()
	var $numDegreesToReaquire = @calculateDegreesToReaquire()
	var $numDegreesToIncrement = @calculateDegreesToIncrement($numDegreesToReaquire)

	if (@confirmAtAngle($angleToOre))
		@scanToReaquireOre()
		if ($startedReadingTrackingScan == 0)
			$startedReadingTrackingScan = 1
		else
			$startedReadingTrackingScan = 0
			if (@readScanToReaquireOre())
				print("Target locked")
				print($angleToOre)
				print($distanceToOre)
			else
				print("Target not locked")
				print($angleToOre)
				print($distanceToOre)
				if ($startReaquireAngleSearch == 0)
					$searchAngleCount = 0
					$numAnglesToCheck = (2*$numDegreesToReaquire)/$numDegreesToIncrement
					$startReaquireAngleSearch = 1
				else
					$alternateSearchCount = $alternateSearchCount * -1
					$angleToOre = $angleToOre - $numDegreesToIncrement * $searchAngleCount * $alternateSearchCount
					$searchAngleCount++
					if ($searchAngleCount > $numAnglesToCheck)
						print("Lost track or ore. Trying again at last angle.")
						$startReaquireAngleSearch = 0
		
	