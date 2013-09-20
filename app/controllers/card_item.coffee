class CardItem extends Spine.Controller
	className: "card_item layer"
	events:
		"click .card_facade": "make"
	constructor: ->
		super
	render: ->
		@html require("views/items/card")(@item)
	make: (e) ->
		Utils.uploader $(e.currentTarget),(img) =>
			@item.load u_word_image: img
			@render()
		this
module.exports = CardItem
