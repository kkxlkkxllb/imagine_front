class Start extends Spine.Controller
	className: "start"
	constructor: ->
		super

	render: ->
		@html require('views/start')()

module.exports = Start
