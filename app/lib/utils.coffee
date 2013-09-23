class window.Utils
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

