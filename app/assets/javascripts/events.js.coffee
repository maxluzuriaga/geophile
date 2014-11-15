# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	$("tr").on "click", ->
		document.location = $(this).data("href") if $(this).data("href") isnt `undefined`
		return

$(document).ready(ready)
$(document).on('page:load', ready)