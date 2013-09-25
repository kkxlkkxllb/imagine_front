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
		Member.fetch
			data: "auth_token=Ppc6Sipt7K6ddKq1o7vw"
			error: (e) =>
				if e.status is 401
					@render()
	render: =>
		item = Member.first() || login: Member.login
		@append @html require('views/start')(item)
		$(".dancing").animo
			animation: 'tada'
		new Widget(el: $("footer"))
		new Cards(el: $("article"))
		this
	start: (e) ->
		@$el.fadeOut()

module.exports = Start
