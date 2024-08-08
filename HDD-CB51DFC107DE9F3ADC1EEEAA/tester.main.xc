include "directedOreScannerIO.xc"
include "radarScreen.xc"

update
	@sendOreToScanFor("Au")
	@sendMaxDistanceOfScan(6000)
	@sendMinDistanceOfScan(5000)
	@sendResolutionOfScan(1)
	@sendScanAngleIncrement(1)
	@sendStartScan(0)
	
	@radar(@readAngleToBestConcentration())
	print(@readLocateDirectionX())
	print(@readLocateDirectionY())

	