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
		$uploader = $("footer #uploader")
		$file = $("input[type='file']",$uploader)
		$form = $file.closest('form')
		$("input[name='_id']",$form).val @item._id
		$file.trigger "click"
module.exports = CardItem
