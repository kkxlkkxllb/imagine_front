Member = require("models/member")
Cards = require("controllers/cards")
Widget = require("controllers/widget")
class Start extends Spine.Controller
	className: "start"
	events:
		"click .avatar": "start"
	constructor: ->
		super
		Member.bind 'refresh', @render
		Member.fetch()
	render: =>
		item = Member.first() || login: Member.login
		@append @html require('views/start')(item)
		$(".dancing").animo
			animation: 'tada'
		this
	start: (e) ->
		if $("article").html() is ''
			new Cards(el: $("article"))
			new Widget(el: $("footer"))
		if @isActive()
			@deactivate()
		else
			@activate()

module.exports = Start
