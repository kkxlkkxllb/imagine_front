Card = require("models/card")
class CardItem extends Spine.Controller
	className: "card_item layer"
	events:
		"click .card_facade": "make"
	constructor: ->
		super
		@listenTo @item,'change', @render
	render: =>
		console.log @item
		@html require("views/items/card")(@item)
	make: (e) ->
		Card.current_id = @item._id
		$("#img_uploader").trigger "click"
module.exports = CardItem
