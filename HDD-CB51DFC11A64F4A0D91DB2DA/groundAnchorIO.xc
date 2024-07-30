var $groundAnchorAlias : text

const $groundEnchorEngageChannel = 0

function @setGroundAnchorAlias($alias : text)
	$groundAnchorAlias = $alias
	
function @sendAnchorEngaged($engaged : number)
	output_number($groundAnchorAlias, $groundEnchorEngageChannel, $engaged)