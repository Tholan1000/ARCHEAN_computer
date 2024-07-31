include "groundAnchorIO.xc"
include "miningDrillIO.xc"

const $dashBoardAlias = "dashboard"
const $hoverCraftScreenChannel = 0
const $anchorToggleChannel = 1
const $scannerPowerToggleChannel = 2
const $miningDrillToggleChannel = 3
const $resetOreScannerButtonChannel = 4
const $gyroToggleChannel = 5

var $screen = screen($dashBoardAlias, $hoverCraftScreenChannel)

var $hoverCraftScreen = screen("dashboard", $hoverCraftScreenChannel)
	
function @getDashboardAnchorEngaged() : number
	return input_number($dashboardAlias, $anchorToggleChannel)
	
function @sendDashboardAnchorEngaged()
	@sendAnchorEngaged(@getDashboardAnchorEngaged())

function @getDashboardScannerPower() : number
	return input_number($dashboardAlias, $scannerPowerToggleChannel)

function @sendDashboardScannerPower()
	output_number("scannerPowerRelay", 0, @getDashboardScannerPower())
	
function @getDashboardMiningDrillOnOff() : number
	return input_number($dashboardAlias, $miningDrillToggleChannel)
	
function @sendDashboardMiningDrillOnOff()
	@sendMiningDrillOnOff(@getDashboardMiningDrillOnOff())
	
function @getDashboardResetOreScanner() : number
	return input_number($dashboardAlias, $resetOreScannerButtonChannel)
	
function @sendDashboardResetOreScanner()
	if (@getDashboardResetOreScanner() == 1)
		@startOreScanOver()
		
function @getDashboardGyroToggle() : number
	return input_number($dashboardAlias, $gyroToggleChannel)
	
function @sendDashboardGryoToggle()
	@setAllGryoscopeSpeed(@getDashboardGyroToggle())
	
	