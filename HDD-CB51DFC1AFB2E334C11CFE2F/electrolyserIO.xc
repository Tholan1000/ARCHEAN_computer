const $electrolyserAlias = "electrolyser"

const $electrolyserOnOffChannel = 0

function @turnElectrolyserOn()
	output_number($electrolyserAlias, $electrolyserOnOffChannel, 1)
	
function @turnElectrolyserOff()
	output_number($electrolyserAlias, $electrolyserOnOffChannel, 0)