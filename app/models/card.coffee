class Card extends Spine.Model
	@configure 'Card', 'title', 'content', 'u_word_image', "_id"
	@extend Spine.Model.Ajax
	@scope: "api"
	@fromJSON: (json) ->
		data = for item in json.data
			if item.u_word_image
				src = Spine.Model.host + item.u_word_image
			else
				src = null
			$.extend {},item,u_word_image: src
		super data
module.exports = Card
