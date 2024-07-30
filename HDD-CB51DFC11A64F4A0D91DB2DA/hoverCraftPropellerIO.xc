include "propellerIO.xc"

const $leftFrontPropellerAlias = "leftFrontPropeller"
const $rightFrontPropellerAlias = "rightFrontPropeller"
const $leftRearPropellerAlias = "leftRearPropeller"
const $rightRearPropellerAlias = "rightRearPropeller"

var $hoverCraftPitch : number
var $hoverCraftRearPitch : number

function @setHoverCraftPitch($pitch : number)
	$hoverCraftPitch = 1 + $pitch/1.2
	$hoverCraftRearPitch = 1 - $pitch/1.2

function @sendLeftFrontPropellerSpeed($speed : number)
	@setPropellerAlias($leftFrontPropellerAlias)
	@sendPropellerSpeed($speed)
	
function @sendRightFrontPropellerSpeed($speed : number)
	@setPropellerAlias($rightFrontPropellerAlias)
	@sendPropellerSpeed($speed)

function @sendLeftRearPropellerSpeed($speed : number)
	@setPropellerAlias($leftRearPropellerAlias)
	@sendPropellerSpeed($speed)
	
function @sendRightRearPropellerSpeed($speed : number)
	@setPropellerAlias($rightRearPropellerAlias)
	@sendPropellerSpeed($speed)

function @sendHoverCraftUpDown($speed : number)
	@sendLeftFrontPropellerSpeed($speed * $hoverCraftPitch))
	@sendRightFrontPropellerSpeed($speed * -1 * $hoverCraftPitch)
	@sendLeftRearPropellerSpeed($speed * $hoverCraftRearPitch)
	@sendRightRearPropellerSpeed($speed * -1 * $hoverCraftRearPitch)