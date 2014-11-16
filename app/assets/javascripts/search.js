var Marker = function(name, lat, Lng, map){
  var image = 'assets/icn_marker.png';
  var marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat, Lng),
      map: map,
      title: name,
      icon: image
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
  pinMap(window.map);
};

function bindInfoWindow(marker, map, infowindow, html) {
  google.maps.event.addListener(marker, 'click', function() {
    if (window.openedInfowindow != null) {
      window.openedInfowindow.close();
      $('.guide').removeClass('show');
    }
    infowindow.setContent('close');
    infowindow.open(map, marker);
    $('.guide').addClass('show');
    $('#map-canvas').addClass('minimize');
    $('#user_layout').html(html);
    $(".rating-value").jRating({
      isDisabled : true,
      type: 'small'
    });
    $(".rating-value-big").jRating({
      isDisabled : true,
    });
    map.setCenter(marker.position);
    window.openedInfowindow = infowindow;
  });
}

function closeInfoWindow(infoWindow){
  google.maps.event.addListener(infoWindow, 'closeclick', function(){
     infoWindow.close();
     $('.guide').removeClass('show');
     $('#map-canvas').removeClass('minimize');
  });
}

function pinMap(map){
  $.get( "pins.json", function( data ) {
    for (var key in data) {
      var element = data[key];

      var infowindow = new google.maps.InfoWindow({
          content: element.infowindow
      });

      closeInfoWindow(infowindow);

      var marker = new Marker(element.name, element.lat, element.lon, map);
      bindInfoWindow(marker, map, infowindow, element.infowindow);

    }
  });
}


$(document).ready(function(){

  initialize();

});

