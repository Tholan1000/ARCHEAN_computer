var $navInstrumentAlias = "navInstrument"

const $navInstrumentLocCelestialChannel = 0
const $navInstrumentDistaceChannel = 1
const $navInstrumentLocDirXChannel = 2
const $navInstrumentLocDirYChannel = 3
const $navInstrumentLocDirZChannel = 4

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
	
function @sendNavInstrumentDirXY($navAngle:number, $navDistance:number)
	var $x = cos($navAngle) * $navDistance
	var $y = sin($navAngle) * $navDistance
	@sendNavInstrumentLocDirX($x)
	@sendNavInstrumentLocDirY($y)
	