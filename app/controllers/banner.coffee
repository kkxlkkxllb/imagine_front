class Banner extends Spine.Controller
	className: 'banner'
  	constructor: ->
    		super

    	template: ->
		require('views/banner')

	render: =>
		@html @template()

module.exports = Banner
