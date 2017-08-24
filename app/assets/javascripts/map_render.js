$(document).ready(function() {
  var coordinates = JSON.parse(document.getElementById('coordinates').value);
  myMap(coordinates.latitude, coordinates.longitude);
  searchCoordinates(coordinates.latitude, coordinates.longitude);
});

function locateMe() {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(function(position) {
      myMap(position.coords.latitude, position.coords.longitude);
      searchCoordinates(position.coords.latitude, position.coords.longitude);
    });
  } else {}
}

var map

function myMap(latitude, longitude) {
  // var piano_locations
  var mapProp = {
    center: new google.maps.LatLng(latitude, longitude),
    zoom: 13,
    disableDefaultUI: true,
    styles: [
      {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#D3E0EE"
          }, {
            "lightness": 17
          }
        ]
      }, {
        "featureType": "landscape",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#f5f5f5"
          }, {
            "lightness": 20
          }
        ]
      }, {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
          {
            "color": "#ffffff"
          }, {
            "lightness": 17
          }
        ]
      }, {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "color": "#ffffff"
          }, {
            "lightness": 29
          }, {
            "weight": 0.2
          }
        ]
      }, {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#ffffff"
          }, {
            "lightness": 18
          }
        ]
      }, {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#ffffff"
          }, {
            "lightness": 16
          }
        ]
      }, {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#f5f5f5"
          }, {
            "lightness": 21
          }
        ]
      }, {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#D5EED3"
          }, {
            "lightness": 21
          }
        ]
      }, {
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "visibility": "on"
          }, {
            "color": "#f3f3f3"
          }, {
            "lightness": 16
          }
        ]
      }, {
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "saturation": 36
          }, {
            "color": "#333333"
          }, {
            "lightness": 40
          }
        ]
      }, {
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      }, {
        "featureType": "transit",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#f2f2f2"
          }, {
            "lightness": 19
          }
        ]
      }, {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
          {
            "color": "#fefefe"
          }, {
            "lightness": 20
          }
        ]
      }, {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "color": "#fefefe"
          }, {
            "lightness": 17
          }, {
            "weight": 1.2
          }
        ]
      }
    ]
  };

  map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
  var input = document.getElementById('search_string');
  var autocomplete = new google.maps.places.Autocomplete(input);

  // Bind the map's bounds (viewport) property to the autocomplete object, so that the autocomplete requests use the current map bounds for the bounds option in the request.
  autocomplete.bindTo('bounds', map);

  var infowindow = new google.maps.InfoWindow();
  var infowindowContent = document.getElementById('infowindow-content');
  infowindow.setContent(infowindowContent);
  var marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });

  autocomplete.addListener('place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      // User entered the name of a Place that was not suggested and pressed the Enter key, or the Place Details request failed.
      //
      // ADD A NICER ERROR BEHAVIOUR HERE:
      //
      // window.alert("No details available for input: '" + place.name + "'");
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17); // Why 17? Because it looks good.
    }

    marker.setPosition(place.geometry.location);
    marker.setVisible(false);

    searchCoordinates(place.geometry.location.lat(), place.geometry.location.lng())

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }
  });
}
