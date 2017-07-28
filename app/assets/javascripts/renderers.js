var source
var template
var tile


$(document).ready(function() {
  source = $("#tile-template").html();
  template = Handlebars.compile(source);
  tile = $("#tile")[0];
})



function popTile(obj) {
  if (tileClosed) {
    openTile();
    tileClosed = false
  }
  window.setTimeout(function() {
    map.setCenter({lat: (obj.latitude - 0.005), lng: obj.longitude});
    map.setZoom(15);
  }, 500)

  tile.innerHTML = (template(obj))
}

function toggleTileStar() {
  $('#star-icon')[0].classList.toggle('fa-star')
  $('#star-icon')[0].classList.toggle('fa-star-o')
}
