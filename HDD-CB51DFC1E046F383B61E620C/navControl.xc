include "navInstrumentIO.xc"
include "pilotSeatIO.xc"

const $stabilityMultiplier = 10
var $prevVertSpeed = 0

function @easeInPropellerPitchAltitudeChange($speed : number) : number
	var $diff = $speed - $prevVertSpeed
	var $retVal = 0
	if ($speed > 1)
		if ($diff > 0.05)
			$retVal = -1
		elseif ($diff > 0.025)
			$retVal = -0.75
		elseif ($diff >= 0)
			$retVal = -0.5
		elseif ($diff < 0)
			$retVal = -0.25
		elseif ($diff < 0.25)
			$retVal = 0
	elseif ($speed > 0.5)
		if ($diff > 0.05)
			$retVal = -0.5
		elseif ($diff > 0)
			$retVal = -0.2
		elseif ($diff == 0)
			$retVal = -0.1
		else
			$retVal = 0
	elseif ($speed > 0)
		if ($diff > 0.05)
			$retVal = -0.25
		elseif ($diff > 0)
			$retVal = -0.1
		elseif ($diff == 0)
			$retVal = -0.05
		else
			$retVal = 0
	if ($speed < -1)
		if ($diff < -0.05)
			$retVal = 1
		elseif ($diff < -0.025)
			$retVal = 0.75
		elseif ($diff <= -0)
			$retVal = 0.5
		elseif ($diff > 0)
			$retVal = 0.25
		elseif ($diff > 0.25)
			$retVal = 0
	elseif ($speed < -0.5)
		if ($diff < -0.05)
			$retVal = 0.5
		elseif ($diff < 0)
			$retVal = 0.2
		elseif ($diff == 0)
			$retVal = 0.1
		else
			$retVal = 0
	elseif ($speed < 0)
		if ($diff < -0.05)
			$retVal = 0.25
		elseif ($diff < 0)
			$retVal = 0.1
		elseif ($diff == 0)
			$retVal = -0.05
		else
			$retVal = 0
	$prevVertSpeed = $speed
	return $retVal

function @easeInControlChange($speed : number) : number
	if ($speed > 8)
		return -1
	elseif ($speed > 5)
		return -0.5
	elseif ($speed > 1)
		return -0.2
	elseif ($speed > 0.5)
		return -0.1
	elseif ($speed > 0)
		return -0.05
	elseif ($speed < -8)
		return 1
	elseif ($speed < -5)
		return 0.5
	elseif ($speed < -1)
		return 0.2
	elseif ($speed < -0.5)
		return 0.1
	elseif ($speed < 0)
		return 0.05
	return 0
	
function @easeInFrontBack($speed : number) : number
	if ($speed > 8)
		return -1
	elseif ($speed > 5)
		return -0.2
	elseif ($speed > 1)
		return -0.1
	elseif ($speed > 0.1)
		return -0.05
	elseif ($speed > 0)
		return -0.01
	elseif ($speed < -8)
		return 1
	elseif ($speed < -5)
		return 0.2
	elseif ($speed < -1)
		return 0.1
	elseif ($speed < -0.1)
		return 0.05
	elseif ($speed < -0)
		return 0.01
	return 0
			
function @readNavControlPropellerSpeed() : number
	return @readPilotSeatDownUp()
	
function @readNavControlPropellerPitch() : number
	var $pilotDownUp = @readPilotSeatDownUp()
	if ($pilotDownUp != 0)
		return -1
	return @easeInPropellerPitchAltitudeChange(@readNavInstrumentVerticalSpeed()) * -1

function @readNavControlLeftRight() : number
	var $pilotLeftRight = @readPilotSeatLeftRight()
	if ($pilotLeftRight != 0)
		return $pilotLeftRight
	else
		return @easeInControlChange(@readNavInstrumentGroundSpeedRight()) * 0.5
			
function @readNavControlFrontBack() : number
	var $pilotFrontBack = @readPilotSeatBackFront()
	if ($pilotFrontBack != 0)
		return $pilotFrontBack
	else
		if ($navControlFullStopMode)
			return @easeInFrontBack(@readNavInstrumentGroundSpeedForward()) * 0.5
		else
			return $pilotFrontBack
		
function @readNavControlPitch() : number
	var $pilotPitch = @readPilotSeatPitch()
	if ($pilotPitch != 0)
		return $pilotPitch
	else
		return @readNavInstrumentPitch()*$stabilityMultiplier
		
function @readNavControlRoll() : number
	var $pilotRoll = @readPilotSeatRoll()
	if ($pilotRoll != 0)
		return $pilotRoll
	else
		return @readNavInstrumentRoll()*$stabilityMultiplier