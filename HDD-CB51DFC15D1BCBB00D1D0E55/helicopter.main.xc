include "pilotSeatIO.xc"
include "helicopterPropellerIO.xc"
include "gyroscopeIO.xc"

init
	@setGyroscopeAlias("gyroscopeAlias")
	@sendGyroscopeSpeed(0)

update
	@sendHeliPropSpeed(@getPilotSeatDownUpThrottle())
	@sendHeliPropPitch(@getPilotSeatPitch())
	@sendGyroscopeControl(@getPilotSeatYaw())