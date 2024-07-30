var $navInstrumentAlias : text

const $navInstrumentDistaceChannel = 1
const $navInstrumentLocDirXChannel = 2
const $navInstrumentLocDirYChannel = 3
const $navInstrumentLocDirZChannel = 4

function @setNavInstrumentAlias($alias : text)
	$navInstrumentAlias = $alias

function @sendNavInstrumentDistance($distance : number)
	output_number($navInstrumentAlias, $navInstrumentDistaceChannel, $distance)

function @sendNavInstrumentLocDirX($direction : number)
	output_number($navInstrumentAlias, $navInstrumentLocDirXChannel, $direction)
	
function @sendNavInstrumentLocDirY($direction : number)
	output_number($navInstrumentAlias, $navInstrumentLocDirYChannel, $direction)
	
function @sendNavInstrumentLocDirZ($direction : number)
	output_number($navInstrumentAlias, $navInstrumentLocDirZChannel, $direction)