require('lib/setup')
Layout = require("controllers/layout")
$ = require("jqueryify")
$ ->
	layout = new Layout()
	# Spine.Route.setup(history: true)
	layout.navigate("")
