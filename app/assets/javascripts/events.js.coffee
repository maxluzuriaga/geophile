# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('tr.event-row').on("click", function() {
    if($(this).data('href') !== undefined){
        document.location = $(this).data('href');
    }
});