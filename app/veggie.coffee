require('lib/setup')
Start = require("controllers/start")
Spine.Model.host = "http://17up.org"
Spine.Ajax.defaults.headers['auth_token'] = "Ppc6Sipt7K6ddKq1o7vw"
$ ->
	new Start(el: $("nav"))
	Spine.Route.setup()
	#(history: true)

