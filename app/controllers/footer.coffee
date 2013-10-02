Card = require("models/card")
Member = require("models/member")
class Footer extends Spine.Controller
	events:
		"change #img_uploader": "resize"
		"click .sync": "sync"
		"click .config": "config"
		"click #help": "close_help"
	constructor: ->
		super
		@append @render()
	render: =>
		cnt = Card.check_unSync().length
		@html require("views/footer")(cnt: cnt)
	sync: ->
		cards = Card.check_unSync()
		for card in cards
			card.sync(card.blob,Member.current.auth_token)
		@render()
	config: ->
		$("#help").show()
	close_help: (e) ->
		$(e.currentTarget).hide()
	resize: (e) ->
		_id = Card.current_id
		card = Card.findByAttribute("_id",_id)
		card.trigger "loading"
		file = e.target.files[0]
		canvasResize file,
			width: 640
			height: 0
			crop: false
			quality: 80
			callback: (data, width, height, blob) ->
				card.u_word_image = data
				card.save()
				card.trigger "loaded"
				card.sync(blob,Member.current.auth_token)
module.exports = Footer
