var $oreScannerAlias = "oreScanner"

function @setOreScannerAlias($alias : text)
	$oreScannerAlias = $alias
	
function @sendScanForOre($channel : number, $distance : number)
	output_number($oreScannerAlias, $channel, $distance)
	
function @readResultOfScan($channel : number) : text
	return input_text($oreScannerAlias, $channel)
