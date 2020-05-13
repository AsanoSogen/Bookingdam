var gMap = null;

var gMarkerCenter = null;

function initMap() {
    
  var lat = 35.6896342;
  var lng = 139.6921006999999;

  var myLatLng = new google.maps.LatLng(lat, lng)
  var mapOptions = {
      center: myLatLng,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  gMap = new google.maps.Map(document.getElementById("map"), mapOptions);
  gMarkerCenter = drawMarkerCenterInit(myLatLng);
}

function drawMarkerCenterInit(pos) {
  var markerCenter = new google.maps.Marker({
      position: pos,
      map: gMap,
      draggable: true 
  });
  return markerCenter;
}

$(function(){
  $('#searchAddressBtn').click(function () {
    var geocoder = new google.maps.Geocoder();
    var address = $('[name=address]').val();

    geocoder.geocode(
      {
        'address': address,
        'region': 'jp'
      },
      function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {

          gMap.setCenter(results[0].geometry.location);
          
          var pos = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
          gMarkerCenter.setPosition(pos);

          $('#inputLat').val(pos.lat());
          $('#inputLng').val(pos.lng());

        } else {

          alert('住所検索に失敗しました。<br>住所が正しいか確認してください');
        } 
    });
  });
});