include "crafterIO.xc"
include "dashBoardIO.xc"
include "autoCrafterContainer.xc"
include "electrolyserIO.xc"
include "autoCrafterItemConveyorIO.xc"
include "crusherIO.xc"

var $desiredRecipes : text
var $desiredRecipeArrayIndex = 0
var $itemToCraft = ""
var $requiredAmountOfItem = 0
var $startCrafting = 0
var $craftItemAndAllDependencies = 0
var $currentRecipe : text
var $amountRequired : number
var $craftFailed = 0

init
	@turnOffConveyor($components1ItemConveyor)
	@turnOffConveyor($components2ItemConveyor)
	@turnOffConveyor($everythingElseItemConveyor)
	@turnOffCrafter()
	$desiredRecipes = @getDesiredRecipes()

function @displayScreen($recipesForScreen : text)
	@blankScreen()
	var $rowHeight = @getRowHeight()
	var $tableMargin = 2
	var $rowIndex = 0
	foreach $recipesForScreen ($recipe, $amount)
		var $row = $rowHeight * $rowIndex + $tableMargin
		$desiredRecipes.$recipe = @counter($recipe, @getContainerItemAmount($recipe), $desiredRecipes.$recipe, 6, $row)
		$rowIndex++

function @handleUi()
	
	@setScreen($container1Dashboard, 2)
	@incrementByHandler()

	var $container1Screen1Recipes = ""
	var $container1Screen2Recipes = ""
	var $container1Count = 0
	var $container2Screen1Recipes = ""
	var $container2Screen2Recipes = ""
	var $container2Count = 0
	var $container3Recipes = ""
	foreach $desiredRecipes ($key, $value)
		if (@itemBelongsInContainer1($key))
			if ($container1Count < 25)
				$container1Screen1Recipes.$key = $value
			else
				$container1Screen2Recipes.$key = $value				
			$container1Count++
			
		if (@itemBelongsInContainer2($key))
			if ($container2Count < 25)
				$container2Screen1Recipes.$key = $value
			else
				$container2Screen2Recipes.$key = $value				
			$container2Count++
			
		if (@itemBelongsInContainer3($key))
			$container3Recipes.$key = $value
	
	@setScreen($container1Dashboard, 0)
	@displayScreen($container1Screen1Recipes)
	@setScreen($container1Dashboard, 1)
	@displayScreen($container1Screen2Recipes)
	
	@setScreen($container2Dashboard, 0)
	@displayScreen($container2Screen1Recipes)
	@setScreen($container2Dashboard, 1)
	@displayScreen($container2Screen2Recipes)
	
	@setScreen($container3Dashboard, 0)
	@displayScreen($container3Recipes)


function @sendItemConveyorFilter($item : text)
	if (@itemBelongsInContainer1($item)
		@turnOnItemConveyorAndFilter($components1ItemConveyor, $item)
	elseif (@itemBelongsInContainer2($item)
		@turnOnItemConveyorAndFilter($components2ItemConveyor, $item)
	else
		@turnOnItemConveyorAndFilter($everythingElseItemConveyor, $item)

function @setNextItemToCraftAndItemFilter()
	$itemToCraft = ""
	$requiredAmountOfItem = 0
	array $desiredRecipesArray : text
	$desiredRecipesArray.clear()
	foreach $desiredRecipes ($recipe, $amount)
		$desiredRecipesArray.append("." & $recipe & "{" & $amount & "}")
	
	if ($desiredRecipeArrayIndex < $desiredRecipesArray.size)
		var $singleKeyValue = $desiredRecipesArray.$desiredRecipeArrayIndex
		foreach $singleKeyValue ($key, $value)
			@sendItemConveyorFilter($key)
			if (@getContainerItemAmount($key) < $value)
				$itemToCraft = $key
				$requiredAmountOfItem = $value

	if ($desiredRecipeArrayIndex > $desiredRecipesArray.size)
		$desiredRecipeArrayIndex = -1

function @craftItemAndAllDependencies()
	print("Craft dep recipe = " & $currentRecipe)
	if (@getContainerItemAmount($currentRecipe) < $amountRequired)
		@turnOnCrafter()
		@setCrafterRecipe($currentRecipe)
		if (@getCrafterProgress() == -1)
;			print("Error crafting " & $currentRecipe)
			$craftFailed = 1
	else
;		print("Finished item " & $currentRecipe)
		@keyValuePairPop()
		$currentRecipe = @getKeyValuePairLastKey()
		$amountRequired = @getKeyValuePairLastValue()

function @incrementDesiredRecipesIndex()
	$desiredRecipeArrayIndex++
	$craftItemAndAllDependencies = 0

function @handleError()
;	print("Handle error by moving onto next. Eventually show red in UI")
	@incrementDesiredRecipesIndex()
	$craftFailed = 0
	
function @startCrafting()
	@turnElectrolyserOn()
	if ($craftItemAndAllDependencies == 0)
		@clearKeyValuePairStack()
		@createKeyValueStackOfDependencies($itemToCraft, $requiredAmountOfItem)
		$currentRecipe = @getKeyValuePairLastKey()
		$amountRequired = @getKeyValuePairLastValue()
		$craftItemAndAllDependencies = 1
		print("Craft item with dependencies " & @getKeyValuePair())
	else
		@craftItemAndAllDependencies()
		
function @stopCrafting()
	@turnElectrolyserOff()
	@turnOffCrafter()
	@setCrafterRecipe("Nothing")
	@incrementDesiredRecipesIndex()
	
function @handleCrusher()
	if (@getContainerItemAmountWithAlias($rockContainer, "Rock") > 0)
		@turnOnCrusher()
		@turnOnConveyor($rockConveyor)
	else
		@turnOffCrusher()
		@turnOffConveyor($rockConveyor)

update
	@handleUi()

update
	@handleCrusher()

update
	if ($craftFailed)
		@handleError()
	else
		@setNextItemToCraftAndItemFilter()
		$startCrafting = (@getContainerItemAmount($itemToCraft) < $requiredAmountOfItem)
		if ($startCrafting)
			@startCrafting()
		else
			@stopCrafting()

	
	