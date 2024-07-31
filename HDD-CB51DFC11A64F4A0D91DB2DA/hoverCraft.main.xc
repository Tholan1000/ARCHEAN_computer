include "pilotSeatIO.xc"
include "hoverCraftPropellerIO.xc"
include "hoverCraftGyroIO.xc"
include "beaconIO.xc"
include "navInstrumentIO.xc"
include "hoverCraftDashboardIO.xc"

var $throttle = 0
const $throttleIncrement = 0.005

init
	@setPilotSeatAlias("pilotSeat")
	@setAllGryoscopeSpeed(0)
	@setBeaconAlias("beacon")
	@setNavInstrumentAlias("navInstrument")
	@setDashboardAlias("dashboard")
	@setGroundAnchorAlias("groundAnchor")

update
	if (@getPilotSeatInUse() == 0 or @getMainThrust() == 1)
		$throttle = 0
	if (@getPilotSeatDownUp() > 0)
		$throttle = $throttle + $throttleIncrement
	if (@getPilotSeatDownUp() < 0)
		$throttle = $throttle - $throttleIncrement

	@sendHoverCraftUpDown($throttle)
	@getPilotSeatPitch()
	@sendGyroscopeXyControl(@getPilotSeatYaw())
	@sendGyroscopeYzControl(@getPilotSeatPitch() * -1)
	@sendGyroscopeXzControl(@getPilotSeatRoll())

update
	@sendReceiveFrequency("Home_tx")
	@sendNavInstrumentDistance(@getBeaconDistance())
	@sendNavInstrumentLocDirX(@getBeaconDirectionX())
	@sendNavInstrumentLocDirY(@getBeaconDirectionY())
	@sendNavInstrumentLocDirZ(@getBeaconDirectionZ())
	
update
	@sendDashboardAnchorEngaged()
	