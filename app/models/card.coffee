AjaxCard = require("models/ajax_card")
class Card extends Spine.Model
	@configure 'Card', 'title', 'content', 'u_word_image', "_id", "audio", "sentence", "synset", "sync_over", "blob"
	@extend Spine.Model.Local
	@fetch: ->
		if localStorage[@className]
			super()
		else
			AjaxCard.fetch
				# data: "auth_token=Ppc6Sipt7K6ddKq1o7vw"
				complete: (e) =>
					if e.responseJSON.status is 0
						@records = AjaxCard.all()
						@change()
						@refresh(@all(), clear: true)
	@clean: ->
		@refresh([],clear: true)
		@change()
	@check_unSync: ->
		@findAllByAttribute "sync_over",false

	sync: (blob,auth_token) ->
		form = new FormData()
		form.append("image", blob)
		form.append("_id",@_id)
		form.append("auth_token",auth_token)
		request_url = Spine.Model.host + "/api/cards/create"
		$.ajax
			type: 'POST'
			url: request_url
			data: form
			contentType: false
			processData: false
			error: =>
				@updateAttributes
					sync_over: false
					blob: blob
			success: =>
				@updateAttribute "sync_over",true
module.exports = Card
