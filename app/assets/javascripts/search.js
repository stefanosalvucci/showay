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
    zoom: 15
  };
  window.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var marker = new Marker('Colosseo', 41.890374, 12.492188, window.map);
};

$(document).ready(function(){

  google.maps.event.addDomListener(window, 'load', initialize);

});


