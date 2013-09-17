Start = require("controllers/start")
class Cards extends Spine.Controller
	constructor: ->
		super
		@routes
			"": ->
				start = new Start()
				$("body").append start.render()
	load: ->
		$("body").append @render()
	render: ->
		@html require('views/cards')()
module.exports = Cards