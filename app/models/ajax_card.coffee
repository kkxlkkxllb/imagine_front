class AjaxCard extends Spine.Model
	@configure 'Card', 'title', 'content', 'u_word_image', "_id", "audio", "sentence", "synset"
	@extend Spine.Model.Ajax
	@scope: "api"
	@fromJSON: (json) ->
		data = for item in json.data
			if item.u_word_image
				src = Spine.Model.host + item.u_word_image
			else
				src = null
			options =
				audio: "http://tts.yeshj.com/uk/s/" + encodeURIComponent(item.title)
				u_word_image: src

			$.extend {},item,options
		super data
module.exports = AjaxCard
