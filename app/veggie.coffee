require('lib/setup')
Start = require("controllers/start")
Spine.Model.host = "http://192.168.1.100:3000"
$ ->
	new Start(el: $("nav"))
	Spine.Route.setup()
	#(history: true)

