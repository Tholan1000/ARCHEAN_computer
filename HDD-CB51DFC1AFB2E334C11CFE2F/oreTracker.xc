include "oreScannerIO.xc"

var $oreToTrack = "Au"
var $distanceToOre : number
var $angleToOre : number

function @trackOre()
	@sendScanForOre(0, $distanceToOre)
	var $result = ""; @readResultOfScan(0)
	if ($result.$oreToTrack == "") 
		print("Lost track of target")
	