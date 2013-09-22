class Card extends Spine.Model
	@configure 'Card', 'title', 'content', 'u_word_image', "_id"
	@extend Spine.Model.Ajax
	@scope: "api"
	@url: "http://192.168.1.100:3000/api/cards?auth_token=RupemVPsPZ4tLDYpPAit"
	@fromJSON: (json) ->
		data = for item in json.data
			w_src = Spine.Model.host + item.word_image
			if item.u_word_image
				src = Spine.Model.host + item.u_word_image
			else
				src = null
			$.extend {},item,u_word_image: src,word_image: w_src
		super data
module.exports = Card
