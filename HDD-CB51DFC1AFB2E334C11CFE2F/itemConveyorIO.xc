const $filterConveyorOnOffChannel = 0
const $filterConveyorStackSizeChannel = 1
const $filterConveyorFilterChannel = 2

function @turnOnConveyor($alias:text)
	output_number($alias, $filterConveyorOnOffChannel, 1)
	
function @turnOffConveyor($alias:text)
	output_number($alias, $filterConveyorOnOffChannel, 0)
	
function @setConveyorStackSize($alias:text, $stackSize : number)
	output_number($alias, $filterConveyorStackSizeChannel, $stackSize)
	
function @setConveyorFilter($alias:text, $filter : text)
	output_text($alias, $filterConveyorFilterChannel, $filter)
