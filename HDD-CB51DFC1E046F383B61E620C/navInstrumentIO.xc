var $navInstrumentAlias = "navInstrument"

; Channels that can be send to the nav instrument
const $navInstrumentLocCelestialChannel = 0
const $navInstrumentDistaceChannel = 1
const $navInstrumentLocDirXChannel = 2
const $navInstrumentLocDirYChannel = 3
const $navInstrumentLocDirZChannel = 4

; Channels that can read from the nav instrument
const $navInstrumentForwardAirSpeedChannel = 0
const $navInstrumentVerticalSpeedChannel = 1
const $navInstrumentAltitudeChannel = 2
const $navInstrumentAboveTerainhannel = 3
const $navInstrumentPitchChannel = 4
const $navInstrumentRollChannel = 5
const $navInstrumentGroundSpeedForwardChannel = 11
const $navInstrumentGroundSpeedRightChannel = 12

function @setNavInstrumentAlias($alias : text)
	$navInstrumentAlias = $alias

function @sendNavLocCelestial($celestial : text)
	output_text($navInstrumentAlias, $navInstrumentLocCelestialChannel, $celestial)

function @sendNavInstrumentDistance($navDistance : number)
	output_number($navInstrumentAlias, $navInstrumentDistaceChannel, $navDistance)

function @sendNavInstrumentLocDirX($navDirection : number)
	output_number($navInstrumentAlias, $navInstrumentLocDirXChannel, $navDirection)
	
function @sendNavInstrumentLocDirY($navDirection : number)
	output_number($navInstrumentAlias, $navInstrumentLocDirYChannel, $navDirection)
	
function @sendNavInstrumentLocDirZ($navDirection : number)
	output_number($navInstrumentAlias, $navInstrumentLocDirZChannel, $navDirection)

function @readNavInstrumentAltitude() : number
	return input_number($navInstrumentAlias, $navInstrumentAltitudeChannel)

function @readNavInstrumentVerticalSpeed() : number
	return input_number($navInstrumentAlias, $navInstrumentVerticalSpeedChannel)

function @readNavInstrumentPitch() : number
	return input_number($navInstrumentAlias, $navInstrumentPitchChannel)

function @readNavInstrumentRoll() : number
	return input_number($navInstrumentAlias, $navInstrumentRollChannel)

function @readNavInstrumentGroundSpeedForward() : number
	return input_number($navInstrumentAlias, $navInstrumentGroundSpeedForwardChannel)

function @readNavInstrumentGroundSpeedRight() : number
	return input_number($navInstrumentAlias, $navInstrumentGroundSpeedRightChannel)