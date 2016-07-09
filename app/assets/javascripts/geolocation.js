function getLocation() {
	enu = true;
  if(enu)
		navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
}

function geoSuccess(position) {
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
