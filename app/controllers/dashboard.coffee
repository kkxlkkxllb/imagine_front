class Dashboard extends Spine.Controller
	className: "common dashboard"
	constructor: ->
		super
		# Dashboard.bind "refresh",@fetchAll
		@routes
			"dashboard": =>
				$("article").append @render()
	template: ->
		require('views/dashboard')

	render: =>
		@html @template()

module.exports = Dashboard