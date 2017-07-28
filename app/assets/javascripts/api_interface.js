function locationSearch() {
  var settings = {
    url: '/api_search_test',
    data: {
      searchString: $('#search_string').val()
    }
  }
  $.ajax(settings).done(function(result) {
    console.log(result);
  })
}
$('#search_btn').click(locationSearch)

var markers = [];

var setMapOnAll = function(map) {
  for (var i = 0; i < markers.length; i++) { markers[i].setMap(map); }
};

function searchCoordinates(inputLatitude, inputLongitude) {
  var settings = {
    url: '/api_search_coordinates',
    data: {
      latitude: inputLatitude,
      longitude: inputLongitude
    }
  }
  $.ajax(settings).done(function(result) {
    console.log(result);
    piano_locations = result.result;
    star_ids = result.star_ids;
    console.log(piano_locations);
    _.each(piano_locations, function(piano) {
      var marker = new google.maps.Marker({
        position: {
          lat: piano.latitude,
          lng: piano.longitude
        },
        map: map
      });
      markers.push(marker);
      if (piano.category === "private") {
        marker.setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png')
      } else {
        marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png')
      };
      if (_.contains(star_ids, piano.id)) {
        marker.setIcon('http://maps.google.com/mapfiles/kml/paddle/orange-stars.png')
        console.log('inside');
      };
      setMapOnAll(map);
      marker.addListener("click", function() {
        setMapOnAll(null);
        marker.setMap(map);
        popTile(piano);
      })
    })
  });
}

function toggleStar(pianoId) {
  toggleTileStar();
  console.log(pianoId);
  var settings = {
    url: '/api_star_toggle',
    data: {
      piano_id: pianoId
    }
  }
  $.ajax(settings).done(function(result) {
    console.log(result);
  })
}
