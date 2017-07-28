
var tileClosed = true

function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}





/* Markup for the Piano Tile Slider */

function openTile() {
    document.getElementById("tile").style.flex = 1;
    tileClosed = false;
}

/* Close when someone clicks on the "x" symbol inside the overlay */
function closeTile() {
    setMapOnAll(map);
    document.getElementById("tile").style.flex = 0;
    tileClosed = true;
    document.getElementById('tile').style.height = 0;
    map.setZoom(14);
}
