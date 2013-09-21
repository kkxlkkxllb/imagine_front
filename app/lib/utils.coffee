class window.Utils
	@loading: ($item) ->
		$item.addClass 'disable_event'
		$item.queue (next) ->
			$(@).animate({opacity: 0.2},800).animate({opacity: 1},800)
			$(@).queue(arguments.callee)
			next()
	@loaded: ($item) ->
		$item.stop(true).css "opacity",1
		$item.removeClass 'disable_event'

	@tag_input: ($form) ->
		$("input.tags",$form).each (i,e) ->
			delimiter = $(@).data().delimiter || ","
			$(@).selectize
				plugins: ['remove_button']
				delimiter: delimiter
				persist: false
				create: (input) ->
					value: input,text: input
	# Utils.getSelection('Italic')
	# Utils.getSelection('bold')
	@getSelection: (command = 'bold') ->
		if window.getSelection
			select = window.getSelection()
			if select.rangeCount
				range = select.getRangeAt(0)
				document.designMode = "on"
				select.removeAllRanges()
				select.addRange(range)
				document.execCommand(command, null, false)
				document.designMode = "off"
				$.trim(new String(select).replace(/^\s+|\s+$/g,''))

