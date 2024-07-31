var $dashBoardAlias = "dashBoard"


const $hoverCraftScreenChannel = 0
const $anchorToggleChannel = 1

var $hoverCraftScreen = screen("dashboard", $hoverCraftScreenChannel)

function @setDashboardAlias($alias : text)
	$dashBoardAlias = $alias

function @blankScreen()
	$hoverCraftScreen.blank(black)

function @writeToScreen($message : text)
	$hoverCraftScreen.write($message)