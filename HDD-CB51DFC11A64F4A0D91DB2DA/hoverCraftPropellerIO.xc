include "propellerIO.xc"

const $leftFrontPropellerAlias = "leftFrontPropeller"
const $rightFrontPropellerAlias = "rightFrontPropeller"
const $leftRearPropellerAlias = "leftRearPropeller"
const $rightRearPropellerAlias = "rightRearPropeller"

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
	@sendLeftFrontPropellerSpeed($speed)
	@sendRightFrontPropellerSpeed($speed * -1)
	@sendLeftRearPropellerSpeed($speed)
	@sendRightRearPropellerSpeed($speed * -1)