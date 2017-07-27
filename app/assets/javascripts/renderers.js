var source   = $("#tile-template").html();
var template = Handlebars.compile(source);
var tile = $("#tile");

function popTile(obj) {
  console.log(obj);
}
