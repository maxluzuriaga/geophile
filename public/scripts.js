var ready = function() {
	$("tr").on("click", function(){
		if ($(this).data("href") != undefined) {
			document.location = $(this).data("href");
		}
		return;
	});
}

$(document).ready(ready);
$(document).on('page:load', ready);