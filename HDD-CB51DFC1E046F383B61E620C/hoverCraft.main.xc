include "hoverCraftPropellerIO.xc"
include "gyroscope3AxisIO.xc"
include "navControl.xc"
include "beaconIO.xc"

init
	@sendAllGryoscopeSpeed(0)

update
	$navControlFullStopMode = input_number("dashboard", 3) or @readPilotSeatwAux0()
	output_number("anchor", 0, input_number("dashboard", 4))

update
	@sendHoverCraftIncUpDown(@readNavControlPropellerSpeed())
	@sendHoverCraftPropellerPitch(@readNavControlPropellerPitch())
	@sendHoverCraftLeftRight(@readNavControlLeftRight())
	@sendHoverCraftFrontBack(@readNavControlFrontBack())
	@sendGyroscopeYawControl(@readPilotSeatYaw())
	@sendGyroscopeRollControl(@readNavControlRoll())
	@sendGyroscopePitchControl(@readNavControlPitch())
	
update
	@sendNavLocCelestial(@getBeaconData())
	@sendNavInstrumentDistance(@getBeaconDistance())
	@sendNavInstrumentLocDirX(@getBeaconDirectionX())
	@sendNavInstrumentLocDirY(@getBeaconDirectionY())
	@sendNavInstrumentLocDirZ(@getBeaconDirectionZ())
	
	