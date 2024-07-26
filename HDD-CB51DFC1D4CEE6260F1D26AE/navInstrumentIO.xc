const $navInstrumentAlias = "navInstrument"

const $locateDistranceChannel = 1
const $locateDirectionXChannel = 2
const $locateDirectionYChannel = 3
const $locateDirectionZChannel = 4

function @sendLocationDistance($distance:number)
	output_number($navInstrumentAlias, $locateDistranceChannel, $distance)

function @sendLocationDirectionX($x:number)
	output_number($navInstrumentAlias, $locateDirectionXChannel, $x)

function @sendLocationDirectionY($y:number)
	output_number($navInstrumentAlias, $locateDirectionYChannel, $y)
	
function @sendLocationDirectionZ($z:number)
	output_number($navInstrumentAlias, $locateDirectionZChannel, $z)