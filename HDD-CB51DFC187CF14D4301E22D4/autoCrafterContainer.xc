include "containerIO.xc"

const $containerBaseItems = "rawMaterialsContainer"
const $components1Container = "components1Container"
const $components2Container = "components2Container"
const $components3Container = "components3Container"
const $rockContainer = "rockContainer"

function @itemBelongsInContainer1($item : text) : number
	if (@getCategoryForRecipe($item) == "COMPONENTS")
		var $startsWith = substring($item, 0, 1)
		if ($startsWith == "A" or $startsWith == "B" or $startsWith == "C" or $startsWith == "D" or $startsWith == "E")
			return 1
		if ($startsWith == "F" or $startsWith == "G" or $startsWith == "H" or $startsWith == "I" or $startsWith == "J")
			return 1
		if ($startsWith == "K" or $startsWith == "L")
			return 1
		return 0
	else
		return 0

function @itemBelongsInContainer3($item : text) : number
	var $category = @getCategoryForRecipe($item)
	return (($category == "SPOOLS") or ($category == "TOOLS") or ($category == "CONSTRUCTION"))
				
function @itemBelongsInContainer2($item : text) : number
	if (@getCategoryForRecipe($item) == "COMPONENTS")
		var $startsWith = substring($item, 0, 1)
		if ($startsWith == "M" or $startsWith == "N" or $startsWith == "O" or $startsWith == "P" or $startsWith == "Q")
			return 1
		if ($startsWith == "R" or $startsWith == "S" or $startsWith == "T" or $startsWith == "U" or $startsWith == "V")
			return 1
		if ($startsWith == "W" or $startsWith == "X" or $startsWith == "Y" or $startsWith == "Z")
			return 1
		return 0
	else
		return 0


function @getContainerItemAmount($item : text) : number
	if ($item == "")
		return 0
	var $contents = ""
	if (@itemBelongsInContainer1($item))
		$contents = @getContainerContentsWithAlias($components1Container)
	elseif (@itemBelongsInContainer2($item))
		$contents = @getContainerContentsWithAlias($components2Container)
	elseif (@itemBelongsInContainer3($item))
		$contents = @getContainerContentsWithAlias($components3Container)
	else
		$contents = @getContainerContentsWithAlias($containerBaseItems)
	return $contents.$item
	