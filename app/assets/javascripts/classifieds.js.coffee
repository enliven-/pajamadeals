# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	if $('nav.pagination').length
		$(window).scroll ->
			url = $('nav.pagination a[rel=next]').attr('href')
			if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
				$('nav.pagination').text("Fetching more classifieds...")
				$.getScript(url)
		$(window).scroll()
			