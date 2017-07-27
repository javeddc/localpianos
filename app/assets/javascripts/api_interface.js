function locationSearch() {
  var settings = {
    url: '/api_search_test',
    data: {
      searchString: $('#search_string').val()
    }
  }
  $.ajax(settings).done(function (result) {
    console.log(result);
  })
}
$('#search_btn').click(locationSearch)

function searchCoordinates(input_latitude, input_longitude) {
  var settings = {
    url: '/api_search_coordinates',
    data: {
      latitude: input_latitude,
      longitude: input_longitude
    }
  }
  $.ajax(settings).done(function (result) {

    piano_locations = result.result;
    console.log(piano_locations);
    piano_locations.forEach(function (piano) {
      var marker = new google.maps.Marker({
        position: {
          lat: piano.latitude,
          lng: piano.longitude
        },
        map: map
      });
      if (piano.category === "private") {
        marker.setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png')
      } else {
        marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png')
      };
      marker.addListener("click", function() {
        popTile(piano);
      })
    });
  });
}
