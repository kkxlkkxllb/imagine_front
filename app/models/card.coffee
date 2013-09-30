AjaxCard = require("models/ajax_card")
class Card extends Spine.Model
	@configure 'Card', 'title', 'content', 'u_word_image', "_id", "audio", "sentence", "synset"
	@extend Spine.Model.Local
	@fetch: ->
		if localStorage[@className]
			super()
		else
			AjaxCard.fetch
				data: "auth_token=Ppc6Sipt7K6ddKq1o7vw"
				complete: (e) =>
					if e.responseJSON.status is 0
						Card.records = AjaxCard.all()
						Card.change()
						@refresh(Card.all(), clear: true)
	@clean: ->
		@refresh([],clear: true)
		Card.change()
	sync: (blob) ->
		form = new FormData()
		form.append("image", blob)
		form.append("_id",@_id)
		form.append("auth_token",Member.current.auth_token)
		oReq = new XMLHttpRequest()
		oReq.open("POST",Spine.Model.host + "/api/cards/create")
		oReq.send(form)
module.exports = Card
