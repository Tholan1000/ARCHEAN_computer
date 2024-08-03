include "propellerIO.xc"

const $leftFrontPropellerAlias = "leftFrontPropeller"
const $rightFrontPropellerAlias = "rightFrontPropeller"
const $leftRearPropellerAlias = "leftRearPropeller"
const $rightRearPropellerAlias = "rightRearPropeller"

var $hoverCraftThrottle = 0
const $hoverCraftThrottleInc = 0.005

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

function @sendHoverCraftUpDown()
	@sendLeftFrontPropellerSpeed($hoverCraftThrottle * -1)
	@sendRightFrontPropellerSpeed($hoverCraftThrottle)
	@sendLeftRearPropellerSpeed($hoverCraftThrottle * -1)
	@sendRightRearPropellerSpeed($hoverCraftThrottle)
	
function @sendThrottleHoverCraftUpDown($throttle : number)
	print($hoverCraftThrottle)
	$hoverCraftThrottle = $hoverCraftThrottle + $hoverCraftThrottleInc * $throttle
	if ($hoverCraftThrottle > 1)
		$hoverCraftThrottle = 1
	elseif ($hoverCraftThrottle < 0)
		$hoverCraftThrottle = 0
	@sendHoverCraftUpDown()
	
			
