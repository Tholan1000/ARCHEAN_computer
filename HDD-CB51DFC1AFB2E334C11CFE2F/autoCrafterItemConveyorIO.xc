include "itemConveyorIO.xc"

const $components1ItemConveyor = "components1ItemConveyor"
const $components2ItemConveyor = "components2ItemConveyor"
const $everythingElseItemConveyor = "everythingElseItemConveyor"

function @turnOnItemConveyorAndFilter($alias:text, $filter:text)
	@setConveyorFilter($alias, $filter)
	@turnOnConveyor($alias)
	if ($filter == "")
		print("Filter is empty")