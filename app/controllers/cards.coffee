CardItem = require("controllers/card_item")
Card = require("models/card")
class Cards extends Spine.Controller
	className: "kontext"
	events:
		"click .foot_nav": "turn_face"
	constructor: ->
		super
		Card.bind 'refresh', @render
		Card.fetch
			data: "auth_token=Ppc6Sipt7K6ddKq1o7vw"
	render: =>
		@addAll()
		@addFoot()
		@setupKontext(".kontext")
	addOne: (item) =>
		card = new CardItem(item: item)
		@append(card.render())
	addAll: =>
		Card.each(@addOne)
	addFoot: ->
		@append require("views/foot")()
	turn_face: (e) ->
		$(".layer.show .card_wraper").toggleClass 'obverse'
		this
	setupKontext: (query) ->
		k = kontext document.querySelector(query)
		$(".layer:first").addClass('show')
		$("img.u_word").unveil 100, ->
			$(@).load ->
				@style.opacity = 1
		Hammer(document.body).on 'swipeleft', (e) ->
			k.next()
		Hammer(document.body).on 'swiperight', (e) ->
			k.prev()
		# touchConsumed = false
		# lastX = 0
		# document.addEventListener 'touchstart', ( event ) ->
		# 	touchConsumed = false
		# 	lastX = event.touches[0].clientX
		# , false
		# document.addEventListener 'touchmove', ( event ) ->
		# 	event.preventDefault()
		# 	if !touchConsumed
		# 		if event.touches[0].clientX > lastX + 10
		# 			k.prev()
		# 			touchConsumed = true
		# 		else if event.touches[0].clientX < lastX - 10
		# 			k.next()
		# 			touchConsumed = true
		# , false
		document.addEventListener 'keyup', ( event ) ->
			if event.keyCode is 37
				k.prev()
			if event.keyCode is 39
				k.next()
		, false
		k.changed.add ( layer, index ) ->
			$(layer).find("img").trigger("unveil")

module.exports = Cards
