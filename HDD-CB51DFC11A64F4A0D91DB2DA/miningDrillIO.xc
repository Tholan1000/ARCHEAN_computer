var $miningDrillAlias = "miningDrill"

const $miningDrillOnOffChannel = 0

function @setMiningDrillAlias($alias : text)
	$miningDrillAlias = $alias
	
function @sendMiningDrillOnOff($onOff : number)
	output_number($miningDrillAlias, $miningDrillOnOffChannel, $onOff)