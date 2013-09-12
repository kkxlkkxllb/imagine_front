require('lib/setup')
Dashboard = require("controllers/dashboard")
$ = require("jqueryify")
$ ->
	dashboard = new Dashboard()
	# Spine.Route.setup(history: true)
	dashboard.navigate("dashboard")