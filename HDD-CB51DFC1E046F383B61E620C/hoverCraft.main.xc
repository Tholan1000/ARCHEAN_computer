include "pilotSeatIO.xc"
include "hoverCraftPropellerIO.xc"
include "gyroscope3AxisIO.xc"

init
	@sendAllGryoscopeSpeed(0)

update
	@sendHoverCraftIncUpDown(@readPilotSeatDownUp())
	@sendHoverCraftLeftRight(@readPilotSeatLeftRight())
	@sendHoverCraftFrontBack(@readPilotSeatBackFront())
	@sendGyroscopeYawControl(@readPilotSeatYaw())
	@sendGyroscopeRollControl(@readPilotSeatRoll())
	@sendGyroscopePitchControl(@readPilotSeatPitch())
	
	