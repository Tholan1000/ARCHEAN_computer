var $dashBoardAlias : text

include "groundAnchorIO.xc"

const $screenChannel = 0
const $anchorToggleChannel = 1

function @setDashboardAlias($alias : text)
	$dashBoardAlias = $alias
	
function @getDashboardAnchorEngaged() : number
	return input_number($dashboardAlias, $anchorToggleChannel
	
function @sendDashboardAnchorEngaged()
	
	@sendAnchorEngaged(@getDashboardAnchorEngaged())
	