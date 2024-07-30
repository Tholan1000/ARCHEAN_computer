
function @sendRelayOn($alias : text)
	output_number($alias, 0, 1)
	
function @sendRelayOff($alias : text)
	output_number($alias, 0, 0)