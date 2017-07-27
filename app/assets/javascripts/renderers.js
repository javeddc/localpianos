var source   = $("#tile-template").html();
var template = Handlebars.compile(source);
var tile = $("#tile");

console.log(tile);

function popTile(obj) {
  console.log(obj);
}
