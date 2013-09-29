Card = require("models/card")
class CardItem extends Spine.Controller
	className: "card_item layer"
	events:
		"hold .card_facade": "make"
		"tap": "turn_face"
	constructor: ->
		super
		@item.bind 'loading', @loading
		@item.bind 'loaded', @loaded

	render: =>
		@html require("views/items/card")(@item)
	make: (e) ->
		e.preventDefault()
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
	turn_face: (e) ->
		e.preventDefault()
		url = @item.audio
		id = @item.cid
		sound = soundManager.createSound
			id: id
			url: url
		$(".card_wraper",@$el).toggleClass 'obverse'
		sound.play()
		this
module.exports = CardItem
