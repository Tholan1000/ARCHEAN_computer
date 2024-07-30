const $stateOfChargeChannel = 2

function @getStateOfCharge($alias : text) : number
	var $retVal = input_number($alias, $stateOfChargeChannel)
	print($retVal)
	if ($retVal >= 0.999)
		return 1
	else
		return $retVal