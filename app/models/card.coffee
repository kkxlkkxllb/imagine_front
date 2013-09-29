AjaxCard = require("models/ajax_card")
class Card extends Spine.Model
	@configure 'Card', 'title', 'content', 'u_word_image', "_id", "audio", "sentence", "synset"
	@extend Spine.Model.Local
	@fetch: ->
		super()
		unless Card.count() > 0
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
module.exports = Card
