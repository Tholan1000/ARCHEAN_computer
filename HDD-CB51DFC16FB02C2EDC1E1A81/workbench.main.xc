include "vectoredPropellerIO.xc"
include "pilotSeat.xc"

update
	@sendFrontBackAngle(@readPilotSeatBackFront())
	@sendLeftRightAngle(@readPilotSeatLeftRight())
	@sendPropellerSpeed(@readPilotSeatDownUp())