ready = ->
	console.log("App ready")
	$(".inverse-dropdown-select").selectpicker
		style: "btn btn-default"
		menuStyle: "dropdown-inverse"

	$('#select-college').change (event) ->
		$.ajax
			url: '/classifieds'
			type: 'GET'
			data:
				'[filters][college_id]': $(event.target).val()
			error: ->
				alert("Something went wrong. Sorry.")
				
	$('#select-category').change (event) ->
		$.ajax
			url: '/classifieds'
			type: 'GET'
			data:
				'[filters][category_id]': $(event.target).val()
			error: ->
				alert("Something went wrong. Sorry.")

$(document).ready(ready)
$(document).on('page:load', ready)