; This code was generated from Nodes. To go back to the original Nodes, you may erase this comment line and remove the ';' in front of the #NODES line below. CAUTION: Your changes in the code will be overwritten once you make a change in the nodes.
;#NODES {"nodes":[{"channel":3,"id":"NODECB51DFC1AC9E55C9661E6ACD","inputs":[],"ioNumber":8,"outputType":0,"pos":{"x":324.8728942871094,"y":42.75423812866211},"size":{"x":301.9322204589844,"y":63.559326171875},"title":"input.8","type":"InputNode"},{"id":"NODECB51DFC14C5570CF661E561F","inputTypes":[0,0],"inputValues":["",""],"inputs":["NODECB51DFC1AC9E55C9661E6ACD","NODECB51DFC1A8B868EE661EA623"],"ioNumber":0,"outputType":2,"pos":{"x":312.16107177734375,"y":249.533935546875},"size":{"x":147.33900451660156,"y":123.72882080078125},"title":"output.0","type":"OutputNode"},{"id":"NODECB51DFC1FADF6FD1661E9A68","inputTypes":[0,0],"inputValues":["",""],"inputs":["NODECB51DFC1AC9E55C9661E6ACD","NODECB51DFC1A8B868EE661EA623"],"ioNumber":1,"outputType":2,"pos":{"x":287.5847473144531,"y":413.09326171875},"size":{"x":135.0,"y":103.38983154296875},"title":"output.1","type":"OutputNode"},{"id":"NODECB51DFC1CAC0F0D1661EE6D3","inputTypes":[0,0],"inputValues":["",""],"inputs":["NODECB51DFC192A518DA661E3AF6","NODECB51DFC1A8B868EE661EA623"],"ioNumber":6,"outputType":2,"pos":{"x":825.7203369140625,"y":242.75425720214844},"size":{"x":135.0,"y":103.38983154296875},"title":"output.6","type":"OutputNode"},{"id":"NODECB51DFC144A93DD2661E36D6","inputTypes":[0,0],"inputValues":["",""],"inputs":["NODECB51DFC192A518DA661E3AF6","NODECB51DFC1A8B868EE661EA623"],"ioNumber":7,"outputType":2,"pos":{"x":858.7713012695313,"y":422.415283203125},"size":{"x":135.0,"y":103.38983154296875},"title":"output.7","type":"OutputNode"},{"id":"NODECB51DFC192A518DA661E3AF6","inputTypes":[0],"inputValues":[""],"inputs":["NODECB51DFC1AC9E55C9661E6ACD"],"outputType":0,"pos":{"x":625.7203979492188,"y":104.61865997314453},"size":{"x":67.79661560058594,"y":45.0},"title":"NEGATIVE","type":"MathNode_NEGATIVE"},{"channel":4,"id":"NODECB51DFC1A8B868EE661EA623","inputs":[],"ioNumber":8,"outputType":0,"pos":{"x":716.3983154296875,"y":45.296600341796875},"size":{"x":204.47459411621094,"y":63.559326171875},"title":"input.8","type":"InputNode"},{"id":"NODECB51DFC15587C609671E4695","inputTypes":[0,0],"inputValues":["1",""],"inputs":["",""],"ioNumber":2,"outputType":2,"pos":{"x":552.8389892578125,"y":487.6695251464844},"size":{"x":135.0,"y":103.38983154296875},"title":"output.2","type":"OutputNode"},{"channel":5,"id":"NODECB51DFC1997D8159671E2E26","inputs":[],"ioNumber":8,"outputType":0,"pos":{"x":972.33056640625,"y":47.838966369628906},"size":{"x":167.1864471435547,"y":63.559326171875},"title":"input.8","type":"InputNode"}]}

include "pilotSeatIO.xc"
include "hoverCraftPropellerIO.xc"
include "gyroscopeIO.xc"

init
	@setPilotSeatAlias("pilotSeat")
	@setGyroScopeAlias("gyro")
	@setGyroscopeSpeed(0)

update
	@sendHoverCraftUpDown(@getPilotSeatDownUp())
	@setHoverCraftPitch(@getPilotSeatPitch())
	@setGyroscopeControl(@getPilotSeatYaw())

;update
;	var $_input_number_8_3 = input_number(8, 3)
;	output_number(0, 0, $_input_number_8_3)
;	var $_input_number_8_4 = input_number(8, 4)
;	output_number(0, 1, $_input_number_8_4)
;	output_number(1, 0, $_input_number_8_3)
;	output_number(1, 1, $_input_number_8_4)
;	output_number(6, 0, (-$_input_number_8_3))
;	output_number(6, 1, $_input_number_8_4)
;	output_number(7, 0, (-$_input_number_8_3))
;	output_number(7, 1, $_input_number_8_4)
;	output_number(2, 0, 0)
