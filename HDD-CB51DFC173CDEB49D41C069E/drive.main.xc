include "wheelIO.xc"
include "pilotSeatIO.xc"

update
	@moveForwardBackward(@getBackwardForward())
	@steerLeftRight(@getLeftRight())
