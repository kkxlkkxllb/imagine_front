CardItem = require("controllers/card_item")
Card = require("models/card")
class Cards extends Spine.Controller
	className: "kontext"
	constructor: ->
		super
		Card.bind 'refresh change', @render
		Card.fetch()
	render: =>
		@addAll()
	addOne: (item) =>
		card = new CardItem(item: item)
		@append(card.render())
	addAll: =>
		Card.each(@addOne)
		k = kontext document.querySelector(".kontext")
		$(".layer:first-child").addClass 'show'
		touchConsumed = false
		lastX = 0
		document.addEventListener 'touchstart', ( event ) ->
			touchConsumed = false
			lastX = event.touches[0].clientX
		, false
		document.addEventListener 'touchmove', ( event ) ->
			event.preventDefault()
			if !touchConsumed
				if event.touches[0].clientX > lastX + 10
					k.prev()
					touchConsumed = true
				else if event.touches[0].clientX < lastX - 10
					k.next()
					touchConsumed = true
		, false
module.exports = Cards
