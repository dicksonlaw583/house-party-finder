var geocoder;
var map;
var marker;
var latitude;
var longitude;
function initialize() {
  geocoder = new google.maps.Geocoder();
  latitude = document.getElementById('latitude');
  var lat = parseFloat(latitude.value) || 0;
  longitude = document.getElementById('longitude');
  var lng = parseFloat(longitude.value) || 160;
  var latlng = new google.maps.LatLng(lat, lng);
  var mapOptions = {
	zoom: 0,
	center: latlng
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  if (!isNaN(parseFloat(latitude.value)) && !isNaN(parseFloat(longitude.value))) {
  	map.setZoom(15);
  	marker = new google.maps.Marker({
  		map: map,
  		position: latlng
  	});
  }
}

function clearCity () {
	document.getElementById('city').value = "";
	document.getElementById('location').value = "";
}

function codeAddress() {

  var city = document.getElementById('city').value;
  if (!city) { city = ""; }
  var location = document.getElementById('location').value;
  if (!location) { location = ""; }
  var province = document.getElementById('province').value;
  if (!province) { province = ""; }

  
  var address =  "Canada " + province + " " + city + " " + location;
  address = address.trim();
  geocoder.geocode( { 'address': address}, function(results, status) {
	if (status == google.maps.GeocoderStatus.OK) {
	  latitude.value = results[0].geometry.location.lat();
	  longitude.value = results[0].geometry.location.lng();

	  //alert(latitude.value + "," + longitude.value);	  

	  map.setCenter(results[0].geometry.location);
	  if (city != "") {
		map.setZoom(10);
	  } else {
		map.setZoom(2);
	  }
	  if (location != "") {
		map.setZoom(15);
	  } 
	  if (marker) {
		marker.setPosition(results[0].geometry.location);
	  } else {
		marker = new google.maps.Marker({
				 map: map,
				 position: results[0].geometry.location
		});
	  }
	} else {
	  alert('Could not locate your address, please verify the given address');
	}
  });
}

google.maps.event.addDomListener(window, 'load', initialize);