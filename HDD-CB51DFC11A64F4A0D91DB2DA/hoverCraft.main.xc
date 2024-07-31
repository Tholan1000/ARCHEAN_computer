include "pilotSeatIO.xc"
include "hoverCraftPropellerIO.xc"
include "hoverCraftGyroIO.xc"
include "beaconIO.xc"
include "oreScanner.xc"
include "hoverCraftDashboardIO.xc"

var $throttle = 0
const $throttleIncrement = 0.005

init
	@setPilotSeatAlias("pilotSeat")
	@setAllGryoscopeSpeed(0)
	@setBeaconAlias("beacon")
	@setNavInstrumentAlias("navInstrument")
	@setGroundAnchorAlias("groundAnchor")
	@initializeOreScanner()

update
	if (@getPilotSeatInUse() == 0 or @getMainThrust() == 1)
		$throttle = 0
	if (@getPilotSeatDownUp() > 0)
		$throttle = $throttle + $throttleIncrement
		if ($throttle > 1)
			$throttle = 1
	if (@getPilotSeatDownUp() < 0)
		$throttle = $throttle - $throttleIncrement
		if ($throttle < 0)
			$throttle = 0

	@sendHoverCraftUpDown($throttle)
	@getPilotSeatPitch()
	@sendGyroscopeXyControl(@getPilotSeatYaw())
	@sendGyroscopeYzControl(@getPilotSeatPitch() * -1)
	@sendGyroscopeXzControl(@getPilotSeatRoll())

update
	@sendReceiveFrequency("Home_tx")
	@sendNavLocCelestial(@getBeaconData())
	@sendNavInstrumentDistance(@getBeaconDistance())
	@sendNavInstrumentLocDirX(@getBeaconDirectionX())
	@sendNavInstrumentLocDirY(@getBeaconDirectionY())
	@sendNavInstrumentLocDirZ(@getBeaconDirectionZ())
	
update
	@sendDashboardAnchorEngaged()
	@sendDashboardScannerPower()
	@sendDashboardMiningDrillOnOff()
	@sendDashboardResetOreScanner()
	@sendDashboardGryoToggle()
	
update
	if ($oreFound == 0)
		@findTargetOreIn360Arc()
		$medianAngle = $bestAngle

	else
		@controlScannerOscillation($medianAngle)
		@findBestOreThisTick()
		if ($bestAngle != $medianAngle)
			$medianAngle = $bestAngle
	$screen.blank(black)
	$screen.text_size(2)
	$screen.write(10, 20, white, "Searching for " & $oreToScanFor)
	$screen.write(10, 40, white, "Angle = " & $bestAngle:text
	$screen.write(10, 60, white, "At distance " & $distanceOfBestOre:text)
	$screen.write(10, 80, white, "Ore concentration " & $bestResult:text)
	
	var $message = "Best result for " & $oreToScanFor & " = " & $bestResult:text & " at an angle of " & $bestAngle:text & " at a distance of " & $distanceOfBestOre:text)
	print($message)
	