Card = require("models/card")
class CardItem extends Spine.Controller
	className: "card_item layer"
	events:
		"click .card_facade": "make"
	constructor: ->
		super
		@item.bind 'loading', @loading
		@item.bind 'loaded', @loaded
	render: =>
		@html require("views/items/card")(@item)
	make: (e) ->
		Card.current_id = @item._id
		$("#img_uploader").trigger "click"
	loading: =>
		$("img",@$el).animo('blur')
		@$el.addClass 'disable_event'
	loaded: =>
		new_src = @item.u_word_image
		$("img",@$el).attr "src",new_src
		$("img",@$el).animo('focus').animo
			animation: 'tada'
		@$el.removeClass 'disable_event'
module.exports = CardItem
