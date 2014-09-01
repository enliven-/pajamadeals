# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$container = $('#classifieds')
	$container.imagesLoaded ->
  		$container.isotope itemSelector: ".item"

	$container.infinitescroll
		navSelector: "nav.pagination"
		nextSelector: "nav.pagination a[rel=next]"
		itemSelector: ".item"
		finishedMsg: ''
		pixelsFromNavToBottom: -Math.round($(window).height() * 0.9)
		bufferPx: Math.round($(window).height() * 0.9)
		(newElements) ->
			$newElems = $(newElements)
			$newElems.imagesLoaded ->
				$container.isotope "appended", $newElems
				
				
$ ->
	$('.inverse-dropdown-select').selectpicker
		style: 'btn btn-default'
		menuStyle: 'dropdown-inverse'
		
$ ->
	$('#classified-next-step').click (event) ->
		event.preventDefault()
		$('.classified-fields').toggle()
		$(event.target).toggle()
		$('.user-fields').toggle()
		$('#classified-submit').toggle()