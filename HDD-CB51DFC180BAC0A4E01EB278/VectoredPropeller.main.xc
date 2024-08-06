include "hingeIO.xc"
include "pivotIO.xc"
include "propellerIO.xc"
include "vectoredPropellerIO.xc"

init
	@setMaxPivotAngle(0.24)
	@setMaxHingeAngle(0.4)
	
update
	@sendAngleToPivot(@readFrontBackAngle())
	@sendAngleToHInge(@readLeftRightAngle())
	@sendPropellerSpeed(@readPropellerSpeed())
	@sendPropellerPitch(@readPropellerPitch())