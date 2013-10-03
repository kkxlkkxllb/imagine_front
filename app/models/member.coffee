AjaxMember = require("models/ajax_member")
class Member extends Spine.Model
	@configure 'Member', "_id", 'name', 'avatar', 'gems', 'member_path', 'auth_token'
	@extend Spine.Model.Local
	@login: "http://17up.org/members/auth/qq_connect"
	@fetch: ->
		if localStorage[@className]
			super()
			@current = @first()
		else
			AjaxMember.fetch
				# data: "auth_token=Ppc6Sipt7K6ddKq1o7vw"
				error: (e) =>
					if e.status is 401
						@refresh([], clear: true)
				complete: (e) =>
					if e.responseJSON.status is 0
						@current = @create AjaxMember.first().attributes()
						@refresh(@current, clear: true)
module.exports = Member
