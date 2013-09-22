class Member extends Spine.Model
	@configure 'Member', 'name', 'avatar', 'gem'
	@extend Spine.Model.Ajax
	@scope: "api"
	@login: "http://17up.org/members/auth/qq_connect"
	@url: "http://192.168.1.100:3000/api/members?auth_token=RupemVPsPZ4tLDYpPAit"
	@fromJSON: (json) ->
		item = json.data
		@auth_token = item.auth_token
		if item.avatar
			src = Spine.Model.host + item.avatar
		else
			src = null
		data = $.extend {},item,avatar: src
		super data

module.exports = Member
