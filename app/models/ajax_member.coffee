class AjaxMember extends Spine.Model
	@configure 'Member', "_id", 'name', 'avatar', 'gems', 'member_path', 'auth_token'
	@extend Spine.Model.Ajax
	@scope: "api"
	@fromJSON: (json) ->
		item = json.data
		if item.avatar
			src = Spine.Model.host + item.avatar
		else
			src = null
		data = $.extend {},item,avatar: src
		super data

module.exports = AjaxMember
