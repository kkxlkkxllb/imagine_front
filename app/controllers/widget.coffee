Card = require("models/card")
class Widget extends Spine.Controller
	constructor: ->
		super
		@append @render()
		$("#img_uploader").fileupload
			dataType: 'json'
			multipart: true
			done: (e,data) ->
				resp = data.result
				if resp.status is 0
					url = Spine.Model.host + resp.data.url
					card = Card.findByAttribute("_id",resp.data._id)
					card.u_word_image = url
					Spine.Ajax.disable ->
  						card.save()
	render: =>
		item =
			action: Spine.Model.host + "/api/cards/create"
			auth_token: Spine.Ajax.defaults.headers['auth_token']
		@html require("views/widget/uploader")(item)
module.exports = Widget
