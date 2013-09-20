require('lib/setup')
Cards = require("controllers/cards")
$ = require("jqueryify")
Spine.Model.host = "http://192.168.0.101:3000"
Spine.Ajax.defaults.headers['auth_token'] = "RupemVPsPZ4tLDYpPAit"
$ ->
	cards = new Cards(el: $("article"))
	Spine.Route.setup()
	#(history: true)
