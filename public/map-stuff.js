var geocoder;
var map;
var feetToMeters = 0.3048;
var rad = 100;
var marker;
var circle;
var latlng;

var ready = function() {
	if ($('#map-canvas').length > 0) {
		geocoder = new google.maps.Geocoder();
		latlng = new google.maps.LatLng(40.350327, -74.6526856);
		saveLatLng(latlng);
		saveRad(rad);
		$("form#radius-form input").val(rad);
		var mapOptions = {
			zoom: 16,
			center: latlng
		}

		map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

		createMarker();
		$("#radius-form input").bind('keyup mouseup', codeRadius);
	}
}

function codeAddress() {
	var address = $("#address input").val();
	geocoder.geocode( { 'address': address}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			latlng = results[0].geometry.location;
			map.setCenter(latlng);
			map.setZoom(16);
			createMarker();
			saveLatLng(latlng)
		} else {
			alert("Geocode was not successful for the following reason: " + status);
		}
	});
}

function codeRadius() {
	rad = parseInt($("#radius-form input").val());
	saveRad(rad);
	drawCircle();
}

function createMarker() {
	marker = new google.maps.Marker({
		draggable: true,
		map: map,
		position: latlng 
	});
	drawCircle();
	google.maps.event.addListener(marker,'dragend',function(event){
		latlng = this.getPosition();
		drawCircle();
		saveLatLng(latlng)
	});
}

function saveLatLng(latlng) {
	console.log(latlng);
	$("input#latitude").val(latlng.k);
	$("input#longitude").val(latlng.B);
}

function saveRad(rad) {
	$("input#radius").val(rad);
}

function drawCircle() {
	if (circle != null) circle.setMap(null);

	circle = new google.maps.Circle({
		strokeColor: '#FF0000',
		strokeOpacity: 0.8,
		strokeWeight: 2,
		fillColor: '#FF0000',
		fillOpacity: 0.35,
		map: map,
		center: latlng,
		radius: rad * feetToMeters
	});
}

$(document).ready(ready);
$(document).on('page:load', ready);