class Layout extends Spine.Controller
	className: "layout"
	constructor: ->
		super
		@routes
			"": ->
				$("body").append @render()
	render: ->
		@html require('views/layout')()

module.exports = Layout
