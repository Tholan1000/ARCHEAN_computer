const $crusherOnOffChannel = 0
const $crusherAlias = "crusher"

function @turnOnCrusher()
	output_number($crusherAlias, $crusherOnOffChannel, 1)
	
function @turnOffCrusher()
	output_number($crusherAlias, $crusherOnOffChannel, 0)