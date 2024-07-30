include "batteryIO.xc"
include "relayIO.xc"

const $batteryAlias = "battery"
const $powerRelayAlias = "relay"

update
	if (@getStateOfCharge($batteryAlias) < 1)
		@sendRelayOn($powerRelayAlias)
	else
		@sendRelayOff($powerRelayAlias)