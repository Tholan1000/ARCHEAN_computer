include "pilotSeatIO.xc"
include "hoverCraftPropellerIO.xc"
include "hoverCraftGyroIO.xc"

init
	@setPilotSeatAlias("pilotSeat")
	@sendAllGryoscopeSpeed(0)

update
	@sendThrottleHoverCraftUpDown(@readPilotSeatDownUp())
	@sendGyroscopeYawControl(@readPilotSeatYaw())
	@sendGyroscopeRollControl(@readPilotSeatRoll())
	@sendGyroscopePitchControl(@readPilotSeatPitch())
	
	