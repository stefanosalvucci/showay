var Marker = function(name, lat, Lng, map){
  var marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat, Lng),
      map: map,
      title: name
  });
  return marker;
};


function initialize() {
  var myLatlng = new google.maps.LatLng(41.890374, 12.492188);
  var mapOptions = {
    center: myLatlng,
    zoom: 12
  };
  window.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
};

function bindInfoWindow(marker, map, infowindow, html) {
  google.maps.event.addListener(marker, 'click', function() {
    if (window.openedInfowindow != null) {
      window.openedInfowindow.close();
    }
    infowindow.setContent(html);
    infowindow.open(map, marker);
    map.setCenter(marker.position);
    window.openedInfowindow = infowindow;
  });
}


$(document).ready(function(){

  google.maps.event.addDomListener(window, 'load', initialize);
  $.get( "pins.json", function( data ) {
    for (var key in data) {
      var element = data[key];

      var infowindow = new google.maps.InfoWindow({
          content: element.infowindow
      });

      var marker = new Marker(element.name, element.lat, element.lon, window.map);
      bindInfoWindow(marker, window.map, infowindow, element.infowindow);

    }
  });
});


