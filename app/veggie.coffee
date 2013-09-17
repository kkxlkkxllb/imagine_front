require('lib/setup')
Cards = require("controllers/cards")
$ = require("jqueryify")
$ ->
	cards = new Cards()
	# Spine.Route.setup(history: true)
	cards.navigate("")
