// these are super ugly global functions taken from stackoverflow
function getLocation() {
  if(enu) {
		navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
	} else {
		console.log('not supported.')
	}
}

function geoSuccess(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    $.ajax({
		  url: "/sessions/update_geolocation",
		  // context: document.body,
		  data: position.coords
		}).done(function(response) {
		  console.log(response);
		});
}

function geoError() {
  console.log("error: Geocoder failed.");
}

$(function() {
	if ($('body').data('username') != "")	getLocation()
})
	