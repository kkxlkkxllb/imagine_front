Member = require("models/member")
Cards = require("controllers/cards")
Widget = require("controllers/widget")
class Start extends Spine.Controller
	className: "start"
	events:
		"click .avatar": "start"
	constructor: ->
		super
		Member.bind 'refresh change', @render
		@append @render()
		# if member's token exist
		Member.fetch()
	render: =>
		item = Member.first() || login: Member.login
		@html require('views/start')(item)
		this
	start: (e) ->
		$(@el).fadeOut()
		new Widget(el: $("footer"))
		new Cards(el: $("article"))
module.exports = Start
