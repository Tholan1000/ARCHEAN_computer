include "propellerIO.xc"

const $topPropellerAlias = "topPropeller"
const $bottomPropellerAlias = "bottomPropeller"

function @sendHeliPropSpeed($speed : number)
	@setPropellerAlias($topPropellerAlias)
	@sendPropellerSpeed($speed)
	@setPropellerAlias($bottomPropellerAlias)
	@sendPropellerSpeed($speed*-1)
	
function @sendHeliPropPitch($pitch: number)
	@setPropellerAlias($topPropellerAlias)
	@sendPropellerPitch($pitch)
	@setPropellerAlias($bottomPropellerAlias)
	@sendPropellerPitch($pitch)