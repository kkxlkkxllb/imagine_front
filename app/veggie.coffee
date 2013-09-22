require('lib/setup')
Start = require("controllers/start")
Spine.Model.host = "http://17up.org"
$ ->
	new Start(el: $("nav"))
	Spine.Route.setup()
	#(history: true)

