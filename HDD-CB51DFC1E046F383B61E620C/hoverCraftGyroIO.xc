include "gyroscopeIO.xc"

const $gyroYawAlias = "gyroYaw"
const $gyroRollAlias = "gyroRoll"
const $gyroPitchAlias = "gyroPitch"

function @sendAllGryoscopeSpeed($speed : number)
	@setGyroscopeAlias($gyroYawAlias)
	@sendGyroscopeSpeed($speed)
	@setGyroscopeAlias($gyroRollAlias)
	@sendGyroscopeSpeed($speed)
	@setGyroscopeAlias($gyroPitchAlias)
	@sendGyroscopeSpeed($speed)

function @sendGyroscopeYawControl($control : number)
	@setGyroscopeAlias($gyroYawAlias)
	@sendGyroscopeControl($control)
	
function @sendGyroscopeRollControl($control : number)
	@setGyroscopeAlias($gyroRollAlias)
	@sendGyroscopeControl($control)
	
function @sendGyroscopePitchControl($control : number)
	@setGyroscopeAlias($gyroPitchAlias)
	@sendGyroscopeControl($control)