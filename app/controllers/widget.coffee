Card = require("models/card")
Member = require("models/member")
class Widget extends Spine.Controller
	events:
		"change #img_uploader": "resize"
	constructor: ->
		super
		@append @render()
	render: =>
		@html require("views/widget/uploader")()
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
				Spine.Ajax.disable ->
					card.save()
				card.trigger "loaded"
				form = new FormData()
				form.append("image", blob)
				form.append("_id",_id)
				form.append("auth_token",Member.auth_token)
				oReq = new XMLHttpRequest()
				oReq.open("POST",Spine.Model.host + "/api/cards/create")
				oReq.send(form)
module.exports = Widget
