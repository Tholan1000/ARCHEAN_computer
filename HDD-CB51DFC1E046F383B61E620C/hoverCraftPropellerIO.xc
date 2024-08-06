include "vectoredPropellerIO.xc"

const $leftFrontPropellerAlias = "leftFrontPropeller"
const $rightFrontPropellerAlias = "rightFrontPropeller"
const $leftBackPropellerAlias = "leftBackPropeller"
const $rightBackPropellerAlias = "rightBackPropeller"

var $propellerSpeed = 0
var $propellerSpeedIncrement = 0.01
var $propellerPitch = 0
var $propellerPitchIncrement = 0.01
var $propellerFrontBackAngle = 0
var $propellerFrontBackIncrement = 0.025
var $navControlFullStopMode = 1

function @sendHoverCraftIncUpDown($upDown : number)
	$propellerSpeed = $propellerSpeed + $propellerSpeedIncrement * $upDown
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
	
function @sendHoverCraftPropellerPitch($upDown : number)
	$propellerPitch = $propellerPitch + $propellerPitchIncrement * $upDown
	if ($propellerPitch > 1)
		$propellerPitch = 1
	if ($propellerPitch < 0)
		$propellerPitch = 0
	@setVectoredPropellerAlias($leftFrontPropellerAlias)
	@sendPropellerPitch($propellerPitch)
	@setVectoredPropellerAlias($rightFrontPropellerAlias)
	@sendPropellerPitch($propellerPitch * -1)
	@setVectoredPropellerAlias($leftBackPropellerAlias)
	@sendPropellerPitch($propellerPitch)
	@setVectoredPropellerAlias($rightBackPropellerAlias)
	@sendPropellerPitch($propellerPitch * -1)
	
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
	if ($navControlFullStopMode)
		$propellerFrontBackAngle = $angle
	else
		$propellerFrontBackAngle = $propellerFrontBackAngle + $propellerFrontBackIncrement * $angle
		if ($propellerFrontBackAngle > 1)
			$propellerFrontBackAngle = 1
		if ($propellerFrontBackAngle < -1)
			$propellerFrontBackAngle = -1
	@setVectoredPropellerAlias($leftFrontPropellerAlias)
	@sendPropellerFrontBackAngle($propellerFrontBackAngle)
	@setVectoredPropellerAlias($rightFrontPropellerAlias)
	@sendPropellerFrontBackAngle($propellerFrontBackAngle * -1)
	@setVectoredPropellerAlias($leftBackPropellerAlias)
	@sendPropellerFrontBackAngle($propellerFrontBackAngle)
	@setVectoredPropellerAlias($rightBackPropellerAlias)
	@sendPropellerFrontBackAngle($propellerFrontBackAngle * -1)

