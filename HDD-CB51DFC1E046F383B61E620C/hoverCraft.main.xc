include "pilotSeatIO.xc"
include "hoverCraftPropellerIO.xc"
include "hoverCraftGyroIO.xc"

var $throttle = 0
const $throttleIncrement = 0.005

init
	@setPilotSeatAlias("pilotSeat")
	@sendAllGryoscopeSpeed(0)

update
	@sendThrottleHoverCraftUpDown(@readPilotSeatDownUp())
;	@getPilotSeatPitch()
	@sendGyroscopeYawControl(@readPilotSeatYaw())
	@sendGyroscopeRollControl(@readPilotSeatRoll())
	@sendGyroscopePitchControl(@readPilotSeatPitch())
	
	