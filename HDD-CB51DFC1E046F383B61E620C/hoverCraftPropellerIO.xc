include "vectoredPropellerIO.xc"

const $leftFrontPropellerAlias = "leftFrontPropeller"
const $rightFrontPropellerAlias = "rightFrontPropeller"
const $leftBackPropellerAlias = "leftBackPropeller"
const $rightBackPropellerAlias = "rightBackPropeller"

var $propellerSpeed = 0
var $propellerIncrement = 0.01

function @sendHoverCraftIncUpDown($upDown : number)
	$propellerSpeed = $propellerSpeed + $propellerIncrement * $upDown
	if ($propellerSpeed > 1)
		$propellerSpeed = 1
	if ($propellerSpeed < 0)
		$propellerSpeed = 0
	@setVectoredPropellerAlias($leftFrontPropellerAlias)
	@sendPropellerSpeed($propellerSpeed)
	@setVectoredPropellerAlias($rightFrontPropellerAlias)
	@sendPropellerSpeed($propellerSpeed * -1)
	@setVectoredPropellerAlias($leftBackPropellerAlias)
	@sendPropellerSpeed($propellerSpeed)
	@setVectoredPropellerAlias($rightBackPropellerAlias)
	@sendPropellerSpeed($propellerSpeed * -1)
	
function @sendHoverCraftLeftRight($angle : number)
	@setVectoredPropellerAlias($leftFrontPropellerAlias)
	@sendPropellerLeftRightAngle($angle * -1)
	@setVectoredPropellerAlias($rightFrontPropellerAlias)
	@sendPropellerLeftRightAngle($angle)
	@setVectoredPropellerAlias($leftBackPropellerAlias)
	@sendPropellerLeftRightAngle($angle * -1)
	@setVectoredPropellerAlias($rightBackPropellerAlias)
	@sendPropellerLeftRightAngle($angle)
	
function @sendHoverCraftFrontBack($angle : number)
	@setVectoredPropellerAlias($leftFrontPropellerAlias)
	@sendPropellerFrontBackAngle($angle)
	@setVectoredPropellerAlias($rightFrontPropellerAlias)
	@sendPropellerFrontBackAngle($angle * -1)
	@setVectoredPropellerAlias($leftBackPropellerAlias)
	@sendPropellerFrontBackAngle($angle)
	@setVectoredPropellerAlias($rightBackPropellerAlias)
	@sendPropellerFrontBackAngle($angle * -1)

