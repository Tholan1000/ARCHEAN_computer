var $beaconAlias = "beacon"

const $beaconDataChannel = 0
const $beaconDistanceChannel = 1
const $beaconDirectionXChannel = 2
const $beaconDirectionYChannel = 3
const $beaconDirectionZChannel = 4

const $beaconReceiveFrequencyChannel = 2

function @setBeaconAlias($alias : text)
	$beaconAlias = $alias

function @sendReceiveFrequency($frequency : text)
	output_text($beaconAlias, $beaconReceiveFrequencyChannel, $frequency)

function @getBeaconData() : text
	return input_text($beaconAlias, $beaconDataChannel)

function @getBeaconDistance() : number
	return input_number($beaconAlias, $beaconDistanceChannel)
	
function @getBeaconDirectionX() : number
	return input_number($beaconAlias, $beaconDirectionXChannel)
	
function @getBeaconDirectionY() : number
	return input_number($beaconAlias, $beaconDirectionYChannel)
	
function @getBeaconDirectionZ() : number
	return input_number($beaconAlias, $beaconDirectionZChannel)