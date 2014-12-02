// [TODO] move to ember
function getLocation() {
	enu = true;
  if(enu)
		navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
}

function geoSuccess(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    $.ajax({
		  url: "/sessions/update_geolocation",
		  context: document.body,
		  data: position.coords
		}).done(function(response) {
		  console.log(response);
		});
}

function geoError() {
  console.log("error: Geocoder failed.");
}

	