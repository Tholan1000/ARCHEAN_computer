include "mathLib.xc"

const $distanceToReaquire = 50
const $amountToMovePerScan = 0.5

var $oreToTrack : text
var $distanceToOre : number
var $angleToOre : number
var $oreConcentration : number

var $startSearchAngle = 0
var $endSearchAngle = 0

var $startedReadingScan = 0

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

function @scanToReaquireOre()

	var $maxReaquireDistance = $distanceToOre + $distanceToReaquire
	var $minReaquireDistance = $distanceToOre - $distanceToReaquire
	var $numChannelsToReaquire = ($maxReaquireDistance-$minReaquireDistance)/$amountToMovePerScan
	repeat $numChannelsToReaquire ($channel)
		var $distance = $channel * $amountToMovePerScan + $minReaquireDistance
		@sendScanForOre($channel, $distance)
	
function @readScanToReaquireOre() : number
	var $maxReaquireDistance = $distanceToOre + $distanceToReaquire
	var $minReaquireDistance = $distanceToOre - $distanceToReaquire
	var $numChannelsToReaquire = ($maxReaquireDistance-$minReaquireDistance)/$amountToMovePerScan
	repeat $numChannelsToReaquire ($channel)
		var $distance = $channel * $amountToMovePerScan + $minReaquireDistance
		var $result = @readResultOfScan($channel)
		if ($result == "")
			print("Reached scanner limit")
		else
			if ($result.$oreToTrack == $oreConcentration)
				$distanceToOre = $distance
				return 1
	return 0
	
function @trackOre()
	var $numDegreesToReaquire = @calculateDegreesToReaquire()
	var $numDegreesToIncrement = @calculateDegreesToIncrement($numDegreesToReaquire)

	if (@confirmAtAngle($angleToOre))
		print("Angle confirmed")
		@scanToReaquireOre()
		if ($startedReadingScan == 0)
			$startedReadingScan = 1
		else
			if (@readScanToReaquireOre())
				print("Target locked")
				print($angleToOre)
				print($distanceToOre)
			else
				print("Ore not aquired")
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
	else
		print("Aligning to angle " & $angleToOre:text)
		
	