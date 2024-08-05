include "hingeIO.xc"
include "pivotIO.xc"
include "propellerIO.xc"
include "vectoredPropellerIO.xc"

init
	@setMaxPivotAngle(0.24)
	@setMaxHingeAngle(0.4)
	
update
	if (@readPropellerShutdown() == 1)
		@sendShutDownPropeller(0)
		@sendAngleToPivot(0)
		@sendAngleToHinge(0)
	else
		@setPropellerDirection(@readPropellerDirection())
		@sendPivotIncrementAngle(@readFrontBackAngle())
		@sendHingeIncrementAngle(@readLeftRightAngle())
		@sendPropellerIncrementSpeed(@readPropellerIncrementSpeed())
		print($propellerSpeed)
		