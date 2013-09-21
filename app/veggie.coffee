require('lib/setup')
Start = require("controllers/start")
$ = require("jqueryify")
Spine.Model.host = "http://192.168.0.101:3000"
Spine.Ajax.defaults.headers['auth_token'] = "RupemVPsPZ4tLDYpPAit"
$ ->
	new Start(el: $("nav"))
	Spine.Route.setup()
	#(history: true)

