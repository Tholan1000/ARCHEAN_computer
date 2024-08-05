include "hingeIO.xc"
include "pivotIO.xc"
include "propellerIO.xc"
include "vectoredPropellerIO.xc"

init
	@setMaxPivotAngle(0.24)
	@setMaxHingeAngle(0.4)
	
update
	@sendPivotIncrementAngle(@readFrontBackAngle())
	@sendHingeIncrementAngle(@readLeftRightAngle())
	@sendPropellerIncrementSpeed(@readPropellerIncrementSpeed())