Card = require("models/card")
Member = require("models/member")
class Widget extends Spine.Controller
	events:
		"change #img_uploader": "resize"
	constructor: ->
		super
		@append @render()
		# $("#img_uploader").fileupload
		# 	dataType: 'json'
		# 	multipart: true
	render: =>
		item =
			action: Spine.Model.host + "/api/cards/create"
			auth_token: Member.auth_token
		@html require("views/widget/uploader")(item)
	resize: (e) ->
		_id = $(e.currentTarget).closest("form").find("input[name='_id']").val()
		file = e.target.files[0]
		canvasResize file,
			width: 640
			height: 0
			crop: false
			quality: 90
			callback: (data, width, height) ->
				card = Card.findByAttribute("_id",_id)
				card.u_word_image = data
				Spine.Ajax.disable ->
					card.save()
module.exports = Widget
