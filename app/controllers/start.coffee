Member = require("models/member")
Cards = require("controllers/cards")
Footer = require("controllers/footer")
class Start extends Spine.Controller
	className: "start"
	events:
		"click": "start"
	constructor: ->
		super
		Member.bind 'refresh', @render
		Member.fetch()
	render: =>
		if member = Member.first()
			new Cards(el: $("article"))
			new Footer(el: $("footer"))
			@activate()
		@append @html require('views/start')(member)
		$(".dancing").animo
			animation: 'tada'
		this
	start: (e) ->
		if Member.current
			if @isActive()
				@deactivate()
			else
				@activate()
		else
			window.location.href = Member.login
module.exports = Start
