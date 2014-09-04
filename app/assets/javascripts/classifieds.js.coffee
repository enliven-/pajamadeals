# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	
	# Grid layout for classified - index page
	
	$container = $('#classifieds')
	$container.imagesLoaded ->
  		$container.isotope itemSelector: ".item"
		
	# Endless scrolling code	

	$container.infinitescroll
		navSelector: "nav.pagination"
		nextSelector: "nav.pagination a[rel=next]"
		itemSelector: ".item"
		finishedMsg: ''
		speed: 'fast'
		pixelsFromNavToBottom: -Math.round($(window).height() * 0.9)
		bufferPx: 1000
		(newElements) ->
			console.log( newElements )
			$newElems = $(newElements)
			$newElems.imagesLoaded ->
				$container.isotope "appended", $newElems
		
	# Next step for creating classified if user not signed in
			
	$('#classified-next-step').click (event) ->
		event.preventDefault()
		$('.classified-fields').toggle()
		$(event.target).toggle()
		$('.user-fields').toggle()
		$('#classified-submit').toggle()
			
$(document).ready(ready)
$(document).on('page:load', ready)
