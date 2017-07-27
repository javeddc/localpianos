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

  tile.innerHTML = (template(obj))
}
