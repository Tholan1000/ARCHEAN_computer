include "gyroscopeIO.xc"

const $gyroXyAlias = "gyroXy"
const $gyroYzAlias = "gyroYz"
const $gyroXzAlias = "gyroXz"

function @setAllGryoscopeSpeed($speed : number)
	@setGyroscopeAlias($gyroXyAlias)
	@sendGyroscopeSpeed($speed)
	@setGyroscopeAlias($gyroYzAlias)
	@sendGyroscopeSpeed($speed)
	@setGyroscopeAlias($gyroXzAlias)
	@sendGyroscopeSpeed($speed)

function @sendGyroscopeXyControl($control : number)
	@setGyroscopeAlias($gyroXyAlias)
	@sendGyroscopeControl($control)
	
function @sendGyroscopeYzControl($control : number)
	@setGyroscopeAlias($gyroYzAlias)
	@sendGyroscopeControl($control)
	
function @sendGyroscopeXzControl($control : number)
	@setGyroscopeAlias($gyroXzAlias)
	@sendGyroscopeControl($control)