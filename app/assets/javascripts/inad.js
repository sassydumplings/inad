function initialize() {
  var mapOptions = {
    zoom: 16,
    panControl: false,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.SMALL
    },
    center: new google.maps.LatLng(37.779931, -122.394868),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var myLatlng = new google.maps.LatLng(37.779931, -122.394868);
  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  var image = 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=1|ff776b';
  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      icon: image
  });

}


// google.maps.event.addDomListener(window, 'ready', initialize);
$(document).ready(function(){
  initialize();
});